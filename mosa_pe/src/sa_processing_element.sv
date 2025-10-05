module sa_processing_element #(
    parameter MUL_TYPE = 0,
    parameter M_APPROX = 0,
    parameter MM_APPROX = 0,
    parameter ADD_TYPE = 0,
    parameter A_APPROX = 0,
    parameter AA_APPROX = 0,
    parameter IA_W = 16,
    parameter IB_W = 16,
    parameter OC_W = 48,
    parameter STAGES_MUL = 2,
    parameter INTERMEDIATE_PIPELINE_STAGE = 1
)(
    // Clk, RST
    input logic                 i_clk,
    input logic                 i_rstn,

    // Data Inputs
    input  logic [IA_W-1:0]     i_a,    // Activation operand
    input  logic [IB_W-1:0]     i_b,    // Weight operand
    input  logic [OC_W-1:0]     i_c,    // MAC input (preload / out chain)

    // Control Inputs
    input logic                 i_reg_clear,    // Register clear
    input logic                 i_pipeline_en,  // Global pipeline enable (for stalls)

    // Data Outputs
    output logic [IA_W-1:0]     o_a,            // Activation output
    output logic [IB_W-1:0]     o_b,            // Weight output
    output logic [OC_W-1:0]     o_c             // MAC output (preload / out chain)
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

// ----------
// Control
// ----------

assign pipeline_ff_en = i_pipeline_en;

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
    .i_clk          (i_clk),
    .i_rstn         (i_rstn && (!i_reg_clear)),
    .i_a            (i_a),
    .i_b            (i_b),
    .i_c            (mac_q),
    .i_msel         (1'b0),
    .i_pipeline_en  (pipeline_ff_en),
    .o_c            (mac_d)
);


// --------------------------------------
// Local Accumulator (Output Stationary)
// --------------------------------------

always_ff @(posedge i_clk or negedge i_rstn) begin : acc_reg
    if(~i_rstn) begin
        mac_q <= 0;
    end else begin
        // Synchronous reset
        if (i_reg_clear) begin
            mac_q <= 0;
        end else if(pipeline_ff_en) begin
            mac_q <= mac_d;
        end
    end
end


// -------------------------------
// Propagation Pipeline Registers
// -------------------------------

always_ff @(posedge i_clk or negedge i_rstn) begin : prop_reg
    if(~i_rstn) begin
        a_q <= 0;
        b_q <= 0;
    end else begin
        // Synchronous reset
        if (i_reg_clear) begin
            a_q <= 0;
            b_q <= 0;
        end else if(pipeline_ff_en) begin
            a_q <= i_a;
            b_q <= i_b;
        end
    end
end


// -------------------
// Outputs
// -------------------

assign o_a = a_q;
assign o_b = b_q;
assign o_c = mac_q;

endmodule
