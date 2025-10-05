// Copyright 2023 Barcelona Supercomputing Center (BSC)
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// Simple testbench for standalone PE synthesis verification

`timescale 1ns/1ps

module synthesis_pe_tb;

// Parameters
localparam CLK_PERIOD = 2.0;  // 500MHz clock
localparam IA_W = 16;
localparam IB_W = 16; 
localparam OC_W = 16;
localparam TH_W = 2;

// Clock and Reset
logic clk;
logic rstn;

// PE Interface signals
logic [IA_W-1:0]     i_a;
logic [IB_W-1:0]     i_b;
logic [OC_W-1:0]     i_c;
logic                i_reg_clear;
logic                i_cell_en;
logic                i_cell_sc_en;
logic                i_pipeline_en;
logic                i_cswitch;
logic                i_cscan_en;
logic [TH_W-1:0]     i_thres;

logic                o_cswitch;
logic                o_cell_en;
logic [IA_W-1:0]     o_a;
logic [IB_W-1:0]     o_b;
logic [OC_W-1:0]     o_c;

// Clock generation
initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

// DUT instantiation
synthesis_pe dut (
    .i_clk(clk),
    .i_rstn(rstn),
    .i_a(i_a),
    .i_b(i_b),
    .i_c(i_c),
    .i_reg_clear(i_reg_clear),
    .i_cell_en(i_cell_en),
    .i_cell_sc_en(i_cell_sc_en),
    .i_pipeline_en(i_pipeline_en),
    .i_cswitch(i_cswitch),
    .i_cscan_en(i_cscan_en),
    .i_thres(i_thres),
    .o_cswitch(o_cswitch),
    .o_cell_en(o_cell_en),
    .o_a(o_a),
    .o_b(o_b),
    .o_c(o_c)
);

// Test stimulus
initial begin
    $display("=== PE Synthesis Testbench Started ===");
    
    // Initialize signals
    rstn = 0;
    i_a = 0;
    i_b = 0;
    i_c = 0;
    i_reg_clear = 0;
    i_cell_en = 1;
    i_cell_sc_en = 0;
    i_pipeline_en = 1;
    i_cswitch = 0;
    i_cscan_en = 0;
    i_thres = 0;
    
    // Reset sequence
    #(10 * CLK_PERIOD);
    rstn = 1;
    #(5 * CLK_PERIOD);
    
    $display("=== Test 1: Basic FP16 MAC Operation ===");
    // Test 1: Simple FP16 MAC operation
    i_a = 16'h3c00;  // FP16: 1.0
    i_b = 16'h4000;  // FP16: 2.0  
    i_c = 16'h4200;  // FP16: 3.0
    #(CLK_PERIOD);
    
    // Wait for pipeline delay
    repeat(5) @(posedge clk);
    
    $display("Time: %0t | Input: a=%h b=%h c=%h", $time, i_a, i_b, i_c);
    $display("Time: %0t | Output: a=%h b=%h c=%h", $time, o_a, o_b, o_c);
    
    $display("=== Test 2: Zero Input Test ===");
    // Test 2: Zero input (should trigger zero gating)
    i_a = 16'h0000;  // FP16: 0.0
    i_b = 16'h4000;  // FP16: 2.0
    i_c = 16'h4200;  // FP16: 3.0
    #(CLK_PERIOD);
    
    repeat(5) @(posedge clk);
    
    $display("Time: %0t | Zero Input: a=%h b=%h c=%h", $time, i_a, i_b, i_c);
    $display("Time: %0t | Output: a=%h b=%h c=%h", $time, o_a, o_b, o_c);
    
    $display("=== Test 3: Context Switch Test ===");
    // Test 3: Context switch
    i_a = 16'h3800;  // FP16: 0.5
    i_b = 16'h4000;  // FP16: 2.0
    i_c = 16'h4100;  // FP16: 2.5
    i_cswitch = 1;
    #(CLK_PERIOD);
    i_cswitch = 0;
    
    repeat(5) @(posedge clk);
    
    $display("Time: %0t | Context Switch: a=%h b=%h c=%h", $time, i_a, i_b, i_c);
    $display("Time: %0t | Output: a=%h b=%h c=%h", $time, o_a, o_b, o_c);
    
    $display("=== Test 4: Pipeline Stall Test ===");
    // Test 4: Pipeline enable/disable
    i_a = 16'h3c00;  // FP16: 1.0
    i_b = 16'h3c00;  // FP16: 1.0
    i_c = 16'h3c00;  // FP16: 1.0
    i_pipeline_en = 0;  // Stall pipeline
    #(CLK_PERIOD);
    i_pipeline_en = 1;  // Resume pipeline
    
    repeat(5) @(posedge clk);
    
    $display("Time: %0t | Pipeline Test: a=%h b=%h c=%h", $time, i_a, i_b, i_c);
    $display("Time: %0t | Output: a=%h b=%h c=%h", $time, o_a, o_b, o_c);
    
    $display("=== Test 5: Register Clear Test ===");
    // Test 5: Register clear
    i_reg_clear = 1;
    #(CLK_PERIOD);
    i_reg_clear = 0;
    
    repeat(3) @(posedge clk);
    
    $display("Time: %0t | After Clear - Output: a=%h b=%h c=%h", $time, o_a, o_b, o_c);
    
    // Final operations
    repeat(10) @(posedge clk);
    
    $display("=== PE Synthesis Testbench Completed ===");
    $finish;
end

// Monitor for debugging
initial begin
    $monitor("Time: %0t | clk=%b rstn=%b | i_a=%h i_b=%h i_c=%h | o_a=%h o_b=%h o_c=%h | cswitch=%b pipeline_en=%b", 
             $time, clk, rstn, i_a, i_b, i_c, o_a, o_b, o_c, i_cswitch, i_pipeline_en);
end

// Waveform dump
initial begin
    $dumpfile("synthesis_pe_tb.vcd");
    $dumpvars(0, synthesis_pe_tb);
end

endmodule