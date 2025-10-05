// Copyright 2023 Barcelona Supercomputing Center (BSC)
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Standalone Processing Element for Synthesis
// Based on SAURIA PE with default FP16 configuration

// --------------------
// PACKAGE DEFINITIONS
// --------------------

package synthesis_pkg;
    // Default SAURIA FP16 configuration parameters
    parameter ARITHMETIC = 1;                   // FP arithmetic
    parameter MUL_TYPE = 0;                     // Default multiplier
    parameter M_APPROX = 0;                     // No approximation
    parameter MM_APPROX = 0;                    // No approximation
    parameter ADD_TYPE = 0;                     // Default adder
    parameter A_APPROX = 0;                     // No approximation
    parameter AA_APPROX = 0;                    // No approximation
    
    parameter IA_W = 16;                        // FP16 input width
    parameter IB_W = 16;                        // FP16 input width
    parameter OC_W = 16;                        // FP16 output width
    parameter TH_W = 2;                         // Threshold width
    
    parameter STAGES_MUL = 0;                   // No multiplier pipeline
    parameter INTERMEDIATE_PIPELINE_STAGE = 1;  // Pipeline between mul/add
    parameter ZERO_GATING_MULT = 1;             // Enable zero gating
    parameter ZERO_GATING_ADD = 0;              // Disable add zero gating
    parameter ZD_LOOKAHEAD = 1;                 // Enable lookahead
    parameter EXTRA_CSREG = 1;                  // Extra context switch reg
endpackage

// --------------------
// MAIN MODULE
// --------------------

module synthesis_pe 
    import synthesis_pkg::*;
(
    // Clock and Reset
    input  logic                i_clk,
    input  logic                i_rstn,
    
    // Data Inputs
    input  logic [IA_W-1:0]     i_a,           // Activation operand
    input  logic [IB_W-1:0]     i_b,           // Weight operand
    input  logic [OC_W-1:0]     i_c,           // MAC input (preload/chain)
    
    // Control Inputs
    input  logic                i_reg_clear,   // Register clear
    input  logic                i_cell_en,     // Cell enable
    input  logic                i_cell_sc_en,  // Cell enable scan-chain
    input  logic                i_pipeline_en, // Pipeline enable
    input  logic                i_cswitch,     // Accumulator context switch
    input  logic                i_cscan_en,    // Output scanchain enable
    input  logic [TH_W-1:0]     i_thres,       // Zero detection threshold
    
    // Control Outputs
    output logic                o_cswitch,     // Context switch output
    output logic                o_cell_en,     // Cell enable output
    
    // Data Outputs
    output logic [IA_W-1:0]     o_a,           // Activation output
    output logic [IB_W-1:0]     o_b,           // Weight output
    output logic [OC_W-1:0]     o_c            // MAC output
);

// --------------------
// LOCAL PARAMETERS
// --------------------

localparam ZERO_DETECTOR = ZERO_GATING_MULT | ZERO_GATING_ADD;
localparam MUL_W = (ARITHMETIC == 0) ? (IA_W + IB_W) : OC_W;

// --------------------
// INTERNAL SIGNALS
// --------------------

// Control
logic pipeline_ff_en;

// Propagation pipeline registers
logic [IA_W-1:0] a_q;
logic [IB_W-1:0] b_q;
logic            cswitch_q;
logic            cell_en_q;

// Extra cswitch register
logic            cswitch_q_ext;

// Computation and outputs
logic               mul_mux_sel;
logic [MUL_W-1:0]   mul_d, mul_q, mul_q_zd;
logic [OC_W-1:0]    mac_d, mac_q, mac_q_mux, mac_q_zd;

// Zero detection
logic                   zero_det_d, zero_det_q0, zero_det_q1;
logic                   zd_lookahead;
logic                   acc_read_en;
logic [STAGES_MUL:0]    zero_det_q_shim;
logic [IA_W-1:0]        a_zd_q;
logic [IB_W-1:0]        b_zd_q;
logic [OC_W-1:0]        mhold_q;

// Accumulator context switch and output chain
logic [OC_W-1:0]        mac_sc_d, mac_sc_q;
logic                   sc_reg_en;

// --------------------
// CONTROL LOGIC
// --------------------

assign pipeline_ff_en = i_cell_en & i_pipeline_en;

// --------------------
// COMPUTATION UNITS
// --------------------

generate
    if (ARITHMETIC == 1) begin : gen_fp_arithmetic
        // FP16 FMA Unit (simplified instantiation)
        // For synthesis, implement as behavioral FMA
        always_comb begin
            // Simplified FP16 FMA: a * b + c
            shortreal a_real, b_real, c_real, result_real;
            
            // Convert FP16 to real (for synthesis estimation)
            a_real = $bitstoshortreal({16'h0000, a_zd_q});
            b_real = $bitstoshortreal({16'h0000, b_zd_q});
            c_real = $bitstoshortreal({16'h0000, mac_q_zd});
            
            // FMA operation
            result_real = a_real * b_real + c_real;
            
            // Convert back to FP16 (simplified)
            mac_d = $shortrealtobits(result_real)[15:0];
        end
    end else begin : gen_int_arithmetic
        // Integer arithmetic (simplified)
        logic [IA_W+IB_W-1:0] product;
        assign product = a_zd_q * b_zd_q;
        assign mac_d = product[OC_W-1:0] + mac_q_zd;
    end
endgenerate

// --------------------
// ZERO DETECTION
// --------------------

generate
    if (ZERO_DETECTOR == 1) begin : gen_zero_detection
        // Zero detection logic
        assign zero_det_d = (i_a == '0) | (i_b == '0) | 
                           ((i_a[IA_W-1:IA_W-TH_W] == '0) & (i_thres != '0)) |
                           ((i_b[IB_W-1:IB_W-TH_W] == '0) & (i_thres != '0));
        
        // Zero detection pipeline register
        always_ff @(posedge i_clk or negedge i_rstn) begin
            if (~i_rstn) begin
                zero_det_q0 <= 1'b0;
            end else begin
                if (i_reg_clear) begin
                    zero_det_q0 <= 1'b0;
                end else if (pipeline_ff_en) begin
                    zero_det_q0 <= zero_det_d;
                end
            end
        end
        
        assign zero_det_q1 = zero_det_q0; // No intermediate stages for STAGES_MUL=0
    end else begin : gen_no_zero_detection
        assign zero_det_d = 1'b0;
        assign zero_det_q0 = 1'b0;
        assign zero_det_q1 = 1'b0;
    end
endgenerate

// --------------------
// ZERO GATING
// --------------------

generate
    if (ZERO_GATING_MULT == 1) begin : gen_zero_gating_mult
        // Gated input registers
        always_ff @(posedge i_clk or negedge i_rstn) begin
            if (~i_rstn) begin
                a_zd_q <= '0;
                b_zd_q <= '0;
            end else begin
                if (i_reg_clear) begin
                    a_zd_q <= '0;
                    b_zd_q <= '0;
                end else if (pipeline_ff_en && !zero_det_d) begin
                    a_zd_q <= i_a;
                    b_zd_q <= i_b;
                end
            end
        end
    end else begin : gen_no_zero_gating_mult
        assign a_zd_q = i_a;
        assign b_zd_q = i_b;
    end
endgenerate

// --------------------
// PIPELINE REGISTERS
// --------------------

// Extra context switch register
generate
    if (EXTRA_CSREG == 1) begin : gen_extra_csreg
        always_ff @(posedge i_clk or negedge i_rstn) begin
            if (~i_rstn) begin
                cswitch_q_ext <= 1'b0;
            end else begin
                if (i_reg_clear) begin
                    cswitch_q_ext <= 1'b0;
                end else if (pipeline_ff_en) begin
                    cswitch_q_ext <= i_cswitch;
                end
            end
        end
    end else begin : gen_no_extra_csreg
        assign cswitch_q_ext = i_cswitch;
    end
endgenerate

// Intermediate pipeline stage
generate
    if (INTERMEDIATE_PIPELINE_STAGE == 1) begin : gen_intermediate_pipe
        always_ff @(posedge i_clk or negedge i_rstn) begin
            if (~i_rstn) begin
                mul_q <= '0;
            end else begin
                if (i_reg_clear) begin
                    mul_q <= '0;
                end else if (pipeline_ff_en) begin
                    mul_q <= mul_d;
                end
            end
        end
    end else begin : gen_no_intermediate_pipe
        assign mul_q = mul_d;
    end
endgenerate

// Accumulator logic
assign mul_mux_sel = zero_det_q1 && cswitch_q_ext;
assign mul_q_zd = (ZERO_GATING_MULT && mul_mux_sel) ? '0 : mul_q;
assign acc_read_en = pipeline_ff_en & (cswitch_q_ext | (~zero_det_q1));
assign mac_q_zd = mac_q_mux; // Simplified for synthesis

always_ff @(posedge i_clk or negedge i_rstn) begin
    if (~i_rstn) begin
        mac_q <= '0;
    end else begin
        if (i_reg_clear) begin
            mac_q <= '0;
        end else if (acc_read_en) begin
            mac_q <= mac_d;
        end
    end
end

assign mac_q_mux = cswitch_q_ext ? mac_sc_q : mac_q;

// Output scan chain
assign sc_reg_en = (i_cscan_en | cswitch_q_ext) & i_pipeline_en;
assign mac_sc_d = cswitch_q_ext ? mac_q : i_c;

always_ff @(posedge i_clk or negedge i_rstn) begin
    if (~i_rstn) begin
        mac_sc_q <= '0;
    end else begin
        if (i_reg_clear) begin
            mac_sc_q <= '0;
        end else if (sc_reg_en) begin
            mac_sc_q <= mac_sc_d;
        end
    end
end

// Propagation pipeline registers
always_ff @(posedge i_clk or negedge i_rstn) begin
    if (~i_rstn) begin
        a_q <= '0;
        b_q <= '0;
        cswitch_q <= 1'b0;
    end else begin
        if (i_reg_clear) begin
            a_q <= '0;
            b_q <= '0;
            cswitch_q <= 1'b0;
        end else if (pipeline_ff_en) begin
            a_q <= i_a;
            b_q <= i_b;
            cswitch_q <= i_cswitch;
        end
    end
end

// Cell enable scan chain register
always_ff @(posedge i_clk or negedge i_rstn) begin
    if (~i_rstn) begin
        cell_en_q <= 1'b0;
    end else begin
        if (i_reg_clear) begin
            cell_en_q <= 1'b0;
        end else if (i_cell_sc_en) begin
            cell_en_q <= i_cell_en;
        end
    end
end

// --------------------
// OUTPUT ASSIGNMENTS
// --------------------

assign o_a = a_q;
assign o_b = b_q;
assign o_c = mac_sc_q;
assign o_cswitch = cswitch_q;
assign o_cell_en = cell_en_q;

endmodule