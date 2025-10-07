// Max Processing Element for Systolic Array
// Compares input with stored value and updates to maximum

module sa_processing_element_max #(
    parameter IA_W = 16,        // Input A width (FP16)
    parameter IB_W = 16,        // Input B width (FP16)
    parameter OC_W = 16         // Output C width (FP16)
)(
    // Clk, RST
    input logic                 clk,
    input logic                 rst_n,

    // Data Inputs
    input  logic [IA_W-1:0]     a,            // New value input
    input  logic [IB_W-1:0]     b,            // Weight operand (propagation only)
    input  logic [OC_W-1:0]     c,            // Preload value (for initialization)

    // Control Inputs
    input logic                 reg_clear,    // Register clear
    input logic                 pipeline_en,  // Global pipeline enable
    input logic                 result_load,  // Load result into result register
    input logic                 preload_en,   // Enable preload from c input

    // Data Outputs
    output logic [IA_W-1:0]     a_out,        // Activation output (propagation)
    output logic [IB_W-1:0]     b_out,        // Weight output (propagation)
    output logic [OC_W-1:0]     c_out         // Max value output
);

import fpnew_pkg::*;

// ----------
// SIGNALS
// ----------

// Control
logic pipeline_ff_en;

// Propagation pipeline registers
logic [IA_W-1:0] a_q;
logic [IB_W-1:0] b_q;

// Max computation
logic [OC_W-1:0] max_current;  // Current stored max value
logic [OC_W-1:0] max_result;   // Result from max operation
logic [OC_W-1:0] result_q;     // Result register for output stationary

// fpnew signals
logic [1:0][IA_W-1:0] fpnew_operands;
logic [OC_W-1:0]      fpnew_result;
fpnew_pkg::status_t   fpnew_status;
logic                 fpnew_extension_bit;
fpnew_pkg::classmask_e fpnew_class_mask;
logic                 fpnew_is_class;

// ----------
// Control
// ----------

assign pipeline_ff_en = pipeline_en;

// -------------------
// Operand Assignment
// -------------------

// Operand A: new input value
// Operand B: current stored max value
assign fpnew_operands[0] = a;
assign fpnew_operands[1] = max_current;

// -------------------
// FP MAX Unit
// -------------------

fpnew_noncomp #(
    .FpFormat    ( fpnew_pkg::FP16 ),
    .NumPipeRegs ( 0 ),
    .PipeConfig  ( fpnew_pkg::BEFORE ),
    .TagType     ( logic ),
    .AuxType     ( logic )
) fpnew_max_i (
    .clk_i            ( clk ),
    .rst_ni           ( rst_n && (!reg_clear) ),
    // Input signals
    .operands_i       ( fpnew_operands ),
    .is_boxed_i       ( 2'b11 ),           // Both operands are valid FP16
    .rnd_mode_i       ( fpnew_pkg::RTZ ),  // RTZ = MAX mode
    .op_i             ( fpnew_pkg::MINMAX ),
    .op_mod_i         ( 1'b0 ),
    .tag_i            ( 1'b0 ),
    .aux_i            ( 1'b0 ),
    // Input Handshake
    .in_valid_i       ( pipeline_ff_en ),
    .in_ready_o       ( ),                 // Not used in this design
    .flush_i          ( 1'b0 ),
    // Output signals
    .result_o         ( fpnew_result ),
    .status_o         ( fpnew_status ),
    .extension_bit_o  ( fpnew_extension_bit ),
    .class_mask_o     ( fpnew_class_mask ),
    .is_class_o       ( fpnew_is_class ),
    .tag_o            ( ),
    .aux_o            ( ),
    // Output handshake
    .out_valid_o      ( ),                 // Not used in this design
    .out_ready_i      ( 1'b1 ),
    // Indication of valid data in flight
    .busy_o           ( )
);

// Select between fpnew result and preload value
assign max_result = preload_en ? c : fpnew_result;

// --------------------------------------
// Max Value Register (Output Stationary)
// --------------------------------------

always_ff @(posedge clk or negedge rst_n) begin : max_reg
    if(~rst_n) begin
        max_current <= '0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            max_current <= '0;
        end else if(pipeline_ff_en) begin
            max_current <= max_result;
        end
    end
end

// ------------------------------
// Result Register (for output)
// ------------------------------

always_ff @(posedge clk or negedge rst_n) begin : result_reg
    if(~rst_n) begin
        result_q <= '0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            result_q <= '0;
        end else if(result_load) begin
            result_q <= max_current;
        end
    end
end

// -------------------------------
// Propagation Pipeline Registers
// -------------------------------

always_ff @(posedge clk or negedge rst_n) begin : prop_reg
    if(~rst_n) begin
        a_q <= '0;
        b_q <= '0;
    end else begin
        // Synchronous reset
        if (reg_clear) begin
            a_q <= '0;
            b_q <= '0;
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
