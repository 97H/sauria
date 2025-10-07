module sa_processing_element #(
    parameter MUL_TYPE = 0,
    parameter M_APPROX = 0,
    parameter MM_APPROX = 0,
    parameter ADD_TYPE = 0,
    parameter A_APPROX = 0,
    parameter AA_APPROX = 0,
    parameter IA_W = 16,
    parameter IB_W = 16,
    parameter OC_W = 16, //origianl = 48
    parameter STAGES_MUL = 0, // original = 2
    parameter INTERMEDIATE_PIPELINE_STAGE = 0, // origianl = 1
    parameter WORD_SIZE = 16,
    parameter RST_SIZE = 16
)(
    // Clk, RST
    input logic                 clk,
    input logic                 rst_n,

    // Data Inputs
    input  logic [IA_W-1:0]     a,    // Activation operand
    input  logic [IB_W-1:0]     b,    // Weight operand
    input  logic [OC_W-1:0]     c,    // MAC input (preload / out chain)

    // Control Inputs
    input logic                 reg_clear,    // Register clear
    input logic                 pipeline_en,  // Global pipeline enable (for stalls)
    input logic                 result_load,  // Load MAC result into result register

    // MOSA-style flexible routing control
    input logic [1:0]           sel0,         // Input operand A mux select
    input logic [1:0]           sel1,         // Input operand B mux select
    input logic                 sel2,         // Adder input mux select
    input logic                 sel3,         // MAC register write enable
    input logic			sel4,         // Result register control
    input logic [WORD_SIZE-1:0] imm1,         // Immediate value 1
    input logic [WORD_SIZE-1:0] imm2,         // Immediate value 2

    // Data Outputs
    output logic [IA_W-1:0]     a_out,        // Activation output
    output logic [IB_W-1:0]     b_out,        // Weight output
    output logic [OC_W-1:0]     c_out,        // MAC output (preload / out chain)
    output logic [RST_SIZE-1:0] result_out    // Final result output
);

// ----------
// SIGNALS
// ----------

// Control
logic pipeline_ff_en;

// Propagation pipeline registers
logic [IA_W-1:0] a_q;
logic [IB_W-1:0] b_q;

// Computation and outputs
logic [OC_W-1:0] mac_d, mac_q;
logic [OC_W-1:0] result_q;  // Result register for output stationary

// MOSA-style flexible routing wires
logic [IA_W-1:0]        input_wire;     // Muxed input operand A
logic [IB_W-1:0]        weight_wire;    // Muxed input operand B
logic [OC_W-1:0]        add_wire;       // Muxed adder input
logic [RST_SIZE-1:0]    result_reg;     // Final result register
logic [RST_SIZE-1:0]      output_wire;    // Multiply output (before adding)

// ----------
// Control
// ----------

assign pipeline_ff_en = pipeline_en;

// ---------------------------------------
// MOSA-style Flexible Input Routing MUXes
// ---------------------------------------

// Input operand A mux (sel0)
always_comb begin
    case (sel0)
        2'b00: input_wire = a;                      // Normal input from systolic array
        2'b01: input_wire = mac_q[IA_W-1:0];        // Recirculate MAC result (truncated)
        default: input_wire = {IA_W{1'b1}};         // All ones
    endcase
end

// Weight operand B mux (sel1)
always_comb begin
    case (sel1)
        2'b00: weight_wire = b;                                         // Normal weight input
        2'b01: weight_wire = imm1;				         // Immediate value 1
        2'b10: weight_wire = imm2;				         // Immediate value 2
        default: weight_wire = result_reg[IB_W-1:0];                    // Result feedback (truncated)
    endcase
end

// Adder input mux (sel2)
always_comb begin
    case (sel2)
        1'b0: add_wire = mac_q;                     // Accumulate mode
        default: add_wire = {OC_W{1'b0}};           // Reset/passthrough mode
    endcase
end

// -------------------
// Computation Units
// -------------------

// FP ARITHMETIC
fma_wrapper #(
    .MUL_TYPE(MUL_TYPE),
    .M_APPROX(M_APPROX),
    .MM_APPROX(MM_APPROX),
    .ADD_TYPE(ADD_TYPE),
    .A_APPROX(A_APPROX),
    .AA_APPROX(AA_APPROX),
    .STAGES(STAGES_MUL),
    .INTERMEDIATE_PIPELINE_STAGE(INTERMEDIATE_PIPELINE_STAGE),
    .ZERO_GATING_MULT(0),
    .FP_W(IA_W)
) fma_i (
    .i_clk          (clk),
    .i_rstn         (rst_n && (!reg_clear)),
    .i_a            (input_wire),       // Use muxed input
    .i_b            (weight_wire),      // Use muxed weight
    .i_c            (add_wire),         // Use muxed accumulator input
    .i_msel         (1'b0),
    .i_pipeline_en  (pipeline_ff_en),
    .o_c            (mac_d)
);


// --------------------------------------
// Local Accumulator (Output Stationary)
// --------------------------------------

always_ff @(posedge clk or negedge rst_n) begin : acc_reg
    if(~rst_n) begin
        mac_q <= 0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            mac_q <= 0;
        end else begin
            // sel3 controls MAC register write enable
            case (sel3)
                1'b0: mac_q <= mac_d;       // Update MAC register
                default: mac_q <= mac_q;    // Hold current value
            endcase
        end
    end
end


// ------------------------------
// Result Register (for output)
// ------------------------------

always_ff @(posedge clk or negedge rst_n) begin : result_reg_old
    if(~rst_n) begin
        result_q <= 0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            result_q <= 0;
        end else if(result_load) begin
            result_q <= mac_q;
        end
    end
end

// MOSA-style result register with shift capability
always_ff @(posedge clk or negedge rst_n) begin : result_reg_mosa
    if(~rst_n) begin
        result_reg <= 0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            result_reg <= 0;
        end else begin
            // sel4 controls result register operation
            case (sel4)
                1'b0: result_reg <= mac_d; 				             // Load MAC output
                default: result_reg <= result_reg;                                   // Hold current value
            endcase
        end
    end
end


// -------------------------------
// Propagation Pipeline Registers
// -------------------------------

always_ff @(posedge clk or negedge rst_n) begin : prop_reg
    if(~rst_n) begin
        a_q <= 0;
        b_q <= 0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            a_q <= 0;
            b_q <= 0;
        end else if(pipeline_ff_en) begin
            a_q <= a;
            b_q <= b;
        end
    end
end


// -------------------
// Outputs
// -------------------

assign a_out = a_q;
assign b_out = b_q;
assign c_out = result_q;          // Output from result register (original)
assign result_out = result_reg;   // MOSA-style result output

endmodule
