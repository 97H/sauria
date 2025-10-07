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
    parameter INTERMEDIATE_PIPELINE_STAGE = 0 // origianl = 1
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

    // Data Outputs
    output logic [IA_W-1:0]     a_out,            // Activation output
    output logic [IB_W-1:0]     b_out,            // Weight output
    output logic [OC_W-1:0]     c_out             // MAC output (preload / out chain)
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

// ----------
// Control
// ----------

assign pipeline_ff_en = pipeline_en;

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
    .i_a            (a),
    .i_b            (b),
    .i_c            (mac_q),
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
        end else if(pipeline_ff_en) begin
            mac_q <= mac_d;
        end
    end
end


// ------------------------------
// Result Register (for output)
// ------------------------------

always_ff @(posedge clk or negedge rst_n) begin : result_reg
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
assign c_out = result_q;  // Output from result register

endmodule
