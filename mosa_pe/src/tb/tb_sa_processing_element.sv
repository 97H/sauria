// Testbench for Basic Output Stationary Processing Element
// Copyright 2023 Barcelona Supercomputing Center (BSC)
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1

`timescale 1ns/1ps

module tb_sa_processing_element;

    // Parameters
    parameter MUL_TYPE = 0;
    parameter M_APPROX = 0;
    parameter MM_APPROX = 0;
    parameter ADD_TYPE = 0;
    parameter A_APPROX = 0;
    parameter AA_APPROX = 0;
    parameter IA_W = 16;
    parameter IB_W = 16;
    parameter OC_W = 32;
    parameter STAGES_MUL = 2;
    parameter INTERMEDIATE_PIPELINE_STAGE = 1;

    // Clock and Reset
    logic clk;
    logic rstn;

    // Data Inputs
    logic [IA_W-1:0] i_a;
    logic [IB_W-1:0] i_b;
    logic [OC_W-1:0] i_c;

    // Control Inputs
    logic i_reg_clear;
    logic i_pipeline_en;

    // Data Outputs
    logic [IA_W-1:0] o_a;
    logic [IB_W-1:0] o_b;
    logic [OC_W-1:0] o_c;

    // Clock generation
    always #5 clk = ~clk;

    // DUT instantiation
    sa_processing_element #(
        .MUL_TYPE(MUL_TYPE),
        .M_APPROX(M_APPROX),
        .MM_APPROX(MM_APPROX),
        .ADD_TYPE(ADD_TYPE),
        .A_APPROX(A_APPROX),
        .AA_APPROX(AA_APPROX),
        .IA_W(IA_W),
        .IB_W(IB_W),
        .OC_W(OC_W),
        .STAGES_MUL(STAGES_MUL),
        .INTERMEDIATE_PIPELINE_STAGE(INTERMEDIATE_PIPELINE_STAGE)
    ) dut (
        .i_clk(clk),
        .i_rstn(rstn),
        .i_a(i_a),
        .i_b(i_b),
        .i_c(i_c),
        .i_reg_clear(i_reg_clear),
        .i_pipeline_en(i_pipeline_en),
        .o_a(o_a),
        .o_b(o_b),
        .o_c(o_c)
    );

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;
        i_a = 0;
        i_b = 0;
        i_c = 0;
        i_reg_clear = 0;
        i_pipeline_en = 1;

        // Reset sequence
        #10;
        rstn = 1;
        #10;

        $display("=== Output Stationary PE Test ===");
        
        // Test 1: Basic MAC operation (FP16: 1.0 * 2.0 + 0.0 = 2.0)
        $display("\nTest 1: Basic MAC (1.0 * 2.0 + 0.0)");
        i_a = 16'h3C00; // FP16: 1.0
        i_b = 16'h4000; // FP16: 2.0
        wait_cycles(5);
        $display("Result: 0x%h (expected: ~0x40000000 for FP32 2.0)", o_c);

        // Test 2: Accumulation test (output stationary)
        $display("\nTest 2: Accumulation (1.0 * 1.0 + previous)");
        i_a = 16'h3C00; // FP16: 1.0
        i_b = 16'h3C00; // FP16: 1.0
        wait_cycles(5);
        $display("Result: 0x%h (expected: ~0x40400000 for FP32 3.0)", o_c);

        // Test 3: Pipeline propagation test
        $display("\nTest 3: Pipeline propagation");
        i_a = 16'h4200; // FP16: 3.0
        i_b = 16'h4400; // FP16: 4.0
        wait_cycles(1);
        $display("o_a = 0x%h, o_b = 0x%h (should be previous values)", o_a, o_b);
        wait_cycles(4);
        $display("o_a = 0x%h, o_b = 0x%h (should be current values)", o_a, o_b);

        // Test 4: Register clear test
        $display("\nTest 4: Register clear");
        i_reg_clear = 1;
        wait_cycles(1);
        i_reg_clear = 0;
        wait_cycles(3);
        $display("After clear - o_c: 0x%h (should be 0)", o_c);

        // Test 5: Pipeline disable test
        $display("\nTest 5: Pipeline disable");
        i_a = 16'h3C00; // FP16: 1.0
        i_b = 16'h3C00; // FP16: 1.0
        i_pipeline_en = 0;
        wait_cycles(3);
        logic [OC_W-1:0] disabled_result = o_c;
        i_pipeline_en = 1;
        wait_cycles(3);
        $display("Disabled result: 0x%h, Enabled result: 0x%h", disabled_result, o_c);

        $display("\n=== Test Complete ===");
        $finish;
    end

    // Helper task
    task wait_cycles(input int cycles);
        repeat(cycles) @(posedge clk);
    endtask

    // Monitor
    always @(posedge clk) begin
        if (rstn) begin
            $display("Time %0t: a=0x%h, b=0x%h, c=0x%h, o_a=0x%h, o_b=0x%h, o_c=0x%h", 
                     $time, i_a, i_b, i_c, o_a, o_b, o_c);
        end
    end

endmodule