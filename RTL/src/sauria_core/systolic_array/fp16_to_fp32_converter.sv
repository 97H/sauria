// Copyright 2024 Barcelona Supercomputing Center (BSC)
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// FP16 to FP32 Converter Module
// Converts IEEE 754 FP16 to FP32 format for higher precision accumulation

module fp16_to_fp32_converter (
    input  logic [15:0] fp16_i,    // FP16 input
    output logic [31:0] fp32_o     // FP32 output
);

// FP16 format: [15] [14:10] [9:0]
//              sign  exp   mantissa
// FP32 format: [31] [30:23] [22:0] 
//              sign  exp    mantissa

logic        fp16_sign;
logic [4:0]  fp16_exp;
logic [9:0]  fp16_man;

logic        fp32_sign;
logic [7:0]  fp32_exp;
logic [22:0] fp32_man;

// Extract FP16 fields
assign fp16_sign = fp16_i[15];
assign fp16_exp  = fp16_i[14:10];
assign fp16_man  = fp16_i[9:0];

// Sign conversion (direct copy)
assign fp32_sign = fp16_sign;

// Exponent conversion
always_comb begin
    if (fp16_exp == 5'b00000) begin
        // Zero or subnormal
        if (fp16_man == 10'b0) begin
            fp32_exp = 8'b00000000;    // Zero
        end else begin
            fp32_exp = 8'b01110000;    // Convert subnormal (bias adjustment)
        end
    end else if (fp16_exp == 5'b11111) begin
        // Infinity or NaN
        fp32_exp = 8'b11111111;
    end else begin
        // Normal number: convert bias from 15 to 127
        fp32_exp = {3'b011, fp16_exp} + 8'd112;  // 127 - 15 = 112
    end
end

// Mantissa conversion (zero-extend)
assign fp32_man = {fp16_man, 13'b0};

// Assemble FP32 result
assign fp32_o = {fp32_sign, fp32_exp, fp32_man};

endmodule