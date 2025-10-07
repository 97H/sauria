/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : V-2023.12-SP5
// Date      : Tue Oct  7 01:50:02 2025
/////////////////////////////////////////////////////////////


module fpnew_classifier_2_2 ( operands_i, is_boxed_i, info_o );
  input [31:0] operands_i;
  input [1:0] is_boxed_i;
  output [15:0] info_o;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  NAND4_X1 U1 ( .A1(operands_i[12]), .A2(operands_i[13]), .A3(operands_i[10]), 
        .A4(operands_i[14]), .ZN(n8) );
  NOR2_X1 U2 ( .A1(operands_i[5]), .A2(operands_i[7]), .ZN(n5) );
  NOR4_X1 U3 ( .A1(operands_i[2]), .A2(operands_i[1]), .A3(operands_i[4]), 
        .A4(operands_i[3]), .ZN(n4) );
  NOR4_X1 U4 ( .A1(operands_i[8]), .A2(operands_i[6]), .A3(operands_i[0]), 
        .A4(operands_i[9]), .ZN(n3) );
  NAND3_X1 U5 ( .A1(n5), .A2(n4), .A3(n3), .ZN(n6) );
  NAND2_X1 U6 ( .A1(operands_i[11]), .A2(n6), .ZN(n7) );
  NOR2_X1 U7 ( .A1(n8), .A2(n7), .ZN(info_o[3]) );
  NAND4_X1 U8 ( .A1(operands_i[26]), .A2(operands_i[27]), .A3(operands_i[29]), 
        .A4(operands_i[28]), .ZN(n14) );
  NOR2_X1 U9 ( .A1(operands_i[21]), .A2(operands_i[23]), .ZN(n11) );
  NOR4_X1 U10 ( .A1(operands_i[18]), .A2(operands_i[17]), .A3(operands_i[20]), 
        .A4(operands_i[19]), .ZN(n10) );
  NOR4_X1 U11 ( .A1(operands_i[24]), .A2(operands_i[22]), .A3(operands_i[16]), 
        .A4(operands_i[25]), .ZN(n9) );
  NAND3_X1 U12 ( .A1(n11), .A2(n10), .A3(n9), .ZN(n12) );
  NAND2_X1 U13 ( .A1(operands_i[30]), .A2(n12), .ZN(n13) );
  NOR2_X1 U14 ( .A1(n14), .A2(n13), .ZN(info_o[11]) );
endmodule


module fpnew_noncomp_2_0_0__logic_Z_1yB___logic_Z_1yB_ ( clk_i, rst_ni, 
        operands_i, is_boxed_i, rnd_mode_i, op_i, op_mod_i, tag_i, aux_i, 
        in_valid_i, in_ready_o, flush_i, result_o, extension_bit_o, 
        class_mask_o, is_class_o, tag_o, aux_o, out_valid_o, out_ready_i, 
        busy_o, status_o_NV_, status_o_DZ_, status_o_OF_, status_o_UF_, 
        status_o_NX_ );
  input [31:0] operands_i;
  input [1:0] is_boxed_i;
  input [2:0] rnd_mode_i;
  input [3:0] op_i;
  output [15:0] result_o;
  output [9:0] class_mask_o;
  input clk_i, rst_ni, op_mod_i, tag_i, aux_i, in_valid_i, flush_i,
         out_ready_i;
  output in_ready_o, extension_bit_o, is_class_o, tag_o, aux_o, out_valid_o,
         busy_o, status_o_NV_, status_o_DZ_, status_o_OF_, status_o_UF_,
         status_o_NX_;
  wire   n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, net1257,
         net1258, net1259, net1260, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13,
         SYNOPSYS_UNCONNECTED_14;
  wire   [1:0] info_q;

  fpnew_classifier_2_2 i_class_a ( .operands_i({net1257, operands_i[30:16], 
        net1258, operands_i[14:0]}), .is_boxed_i({net1259, net1260}), .info_o(
        {SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, info_q[1], 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, info_q[0], 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14}) );
  INV_X1 U3 ( .I(info_q[1]), .ZN(n126) );
  INV_X1 U4 ( .I(operands_i[27]), .ZN(n112) );
  INV_X1 U5 ( .I(operands_i[26]), .ZN(n91) );
  OAI22_X1 U6 ( .A1(n112), .A2(operands_i[11]), .B1(n91), .B2(operands_i[10]), 
        .ZN(n90) );
  INV_X1 U7 ( .I(n90), .ZN(n114) );
  INV_X1 U8 ( .I(operands_i[25]), .ZN(n105) );
  AOI22_X1 U9 ( .A1(operands_i[9]), .A2(n105), .B1(operands_i[10]), .B2(n91), 
        .ZN(n111) );
  INV_X1 U10 ( .I(operands_i[23]), .ZN(n137) );
  INV_X1 U11 ( .I(operands_i[21]), .ZN(n135) );
  INV_X1 U12 ( .I(operands_i[19]), .ZN(n133) );
  INV_X1 U13 ( .I(operands_i[18]), .ZN(n139) );
  NOR2_X1 U14 ( .A1(operands_i[2]), .A2(n139), .ZN(n94) );
  INV_X1 U15 ( .I(operands_i[1]), .ZN(n145) );
  OAI21_X1 U16 ( .A1(operands_i[17]), .A2(n145), .B(operands_i[16]), .ZN(n92)
         );
  INV_X1 U17 ( .I(operands_i[17]), .ZN(n146) );
  OAI22_X1 U18 ( .A1(n92), .A2(operands_i[0]), .B1(operands_i[1]), .B2(n146), 
        .ZN(n93) );
  INV_X1 U19 ( .I(operands_i[2]), .ZN(n140) );
  OAI22_X1 U20 ( .A1(n94), .A2(n93), .B1(n140), .B2(operands_i[18]), .ZN(n96)
         );
  INV_X1 U21 ( .I(operands_i[3]), .ZN(n134) );
  NAND2_X1 U22 ( .A1(operands_i[19]), .A2(n134), .ZN(n95) );
  AOI22_X1 U23 ( .A1(operands_i[3]), .A2(n133), .B1(n96), .B2(n95), .ZN(n98)
         );
  INV_X1 U24 ( .I(operands_i[20]), .ZN(n142) );
  NOR2_X1 U25 ( .A1(operands_i[4]), .A2(n142), .ZN(n97) );
  INV_X1 U26 ( .I(operands_i[4]), .ZN(n141) );
  OAI22_X1 U27 ( .A1(n98), .A2(n97), .B1(operands_i[20]), .B2(n141), .ZN(n100)
         );
  INV_X1 U28 ( .I(operands_i[5]), .ZN(n136) );
  NAND2_X1 U29 ( .A1(operands_i[21]), .A2(n136), .ZN(n99) );
  AOI22_X1 U30 ( .A1(operands_i[5]), .A2(n135), .B1(n100), .B2(n99), .ZN(n102)
         );
  INV_X1 U31 ( .I(operands_i[22]), .ZN(n144) );
  NOR2_X1 U32 ( .A1(operands_i[6]), .A2(n144), .ZN(n101) );
  INV_X1 U33 ( .I(operands_i[6]), .ZN(n143) );
  OAI22_X1 U34 ( .A1(n102), .A2(n101), .B1(operands_i[22]), .B2(n143), .ZN(
        n104) );
  INV_X1 U35 ( .I(operands_i[7]), .ZN(n138) );
  NAND2_X1 U36 ( .A1(operands_i[23]), .A2(n138), .ZN(n103) );
  AOI22_X1 U37 ( .A1(operands_i[7]), .A2(n137), .B1(n104), .B2(n103), .ZN(n107) );
  NOR2_X1 U38 ( .A1(n107), .A2(operands_i[24]), .ZN(n109) );
  NOR2_X1 U39 ( .A1(operands_i[9]), .A2(n105), .ZN(n106) );
  AOI21_X1 U40 ( .A1(operands_i[24]), .A2(n107), .B(n106), .ZN(n108) );
  OAI21_X1 U41 ( .A1(operands_i[8]), .A2(n109), .B(n108), .ZN(n110) );
  NAND2_X1 U42 ( .A1(n111), .A2(n110), .ZN(n113) );
  AOI22_X1 U43 ( .A1(n114), .A2(n113), .B1(operands_i[11]), .B2(n112), .ZN(
        n116) );
  NOR2_X1 U44 ( .A1(n116), .A2(operands_i[28]), .ZN(n118) );
  INV_X1 U45 ( .I(operands_i[29]), .ZN(n119) );
  NOR2_X1 U46 ( .A1(operands_i[13]), .A2(n119), .ZN(n115) );
  AOI21_X1 U47 ( .A1(operands_i[28]), .A2(n116), .B(n115), .ZN(n117) );
  OAI21_X1 U48 ( .A1(operands_i[12]), .A2(n118), .B(n117), .ZN(n123) );
  INV_X1 U49 ( .I(operands_i[30]), .ZN(n120) );
  AOI22_X1 U50 ( .A1(operands_i[14]), .A2(n120), .B1(operands_i[13]), .B2(n119), .ZN(n122) );
  INV_X1 U51 ( .I(operands_i[14]), .ZN(n121) );
  AOI22_X1 U52 ( .A1(n123), .A2(n122), .B1(operands_i[30]), .B2(n121), .ZN(
        n125) );
  NAND2_X1 U53 ( .A1(n125), .A2(operands_i[15]), .ZN(n124) );
  OAI21_X1 U54 ( .A1(n125), .A2(operands_i[31]), .B(n124), .ZN(n127) );
  AOI21_X1 U55 ( .A1(n126), .A2(n127), .B(info_q[0]), .ZN(n132) );
  OAI21_X1 U56 ( .A1(info_q[0]), .A2(n127), .B(n126), .ZN(n152) );
  INV_X1 U57 ( .I(n152), .ZN(n130) );
  AOI22_X1 U58 ( .A1(operands_i[15]), .A2(n132), .B1(operands_i[31]), .B2(n130), .ZN(n128) );
  INV_X1 U59 ( .I(n128), .ZN(result_o[15]) );
  AOI22_X1 U60 ( .A1(operands_i[0]), .A2(n132), .B1(operands_i[16]), .B2(n130), 
        .ZN(n129) );
  INV_X1 U61 ( .I(n129), .ZN(result_o[0]) );
  AOI22_X1 U62 ( .A1(operands_i[8]), .A2(n132), .B1(operands_i[24]), .B2(n130), 
        .ZN(n131) );
  INV_X1 U63 ( .I(n131), .ZN(result_o[8]) );
  INV_X1 U64 ( .I(n132), .ZN(n153) );
  OAI22_X1 U65 ( .A1(n134), .A2(n153), .B1(n133), .B2(n152), .ZN(result_o[3])
         );
  OAI22_X1 U66 ( .A1(n136), .A2(n153), .B1(n135), .B2(n152), .ZN(result_o[5])
         );
  OAI22_X1 U67 ( .A1(n138), .A2(n153), .B1(n137), .B2(n152), .ZN(result_o[7])
         );
  OAI22_X1 U68 ( .A1(n140), .A2(n153), .B1(n139), .B2(n152), .ZN(result_o[2])
         );
  OAI22_X1 U69 ( .A1(n142), .A2(n152), .B1(n141), .B2(n153), .ZN(result_o[4])
         );
  OAI22_X1 U70 ( .A1(n144), .A2(n152), .B1(n143), .B2(n153), .ZN(result_o[6])
         );
  OAI22_X1 U71 ( .A1(n146), .A2(n152), .B1(n145), .B2(n153), .ZN(result_o[1])
         );
  AOI22_X1 U72 ( .A1(operands_i[13]), .A2(n152), .B1(operands_i[29]), .B2(n153), .ZN(n147) );
  NAND2_X1 U73 ( .A1(info_q[0]), .A2(info_q[1]), .ZN(n154) );
  NAND2_X1 U74 ( .A1(n147), .A2(n154), .ZN(result_o[13]) );
  AOI22_X1 U75 ( .A1(operands_i[12]), .A2(n152), .B1(operands_i[28]), .B2(n153), .ZN(n148) );
  NAND2_X1 U76 ( .A1(n148), .A2(n154), .ZN(result_o[12]) );
  AOI22_X1 U77 ( .A1(operands_i[14]), .A2(n152), .B1(operands_i[30]), .B2(n153), .ZN(n149) );
  NAND2_X1 U78 ( .A1(n149), .A2(n154), .ZN(result_o[14]) );
  AOI22_X1 U79 ( .A1(operands_i[9]), .A2(n152), .B1(operands_i[25]), .B2(n153), 
        .ZN(n150) );
  NAND2_X1 U80 ( .A1(n150), .A2(n154), .ZN(result_o[9]) );
  AOI22_X1 U81 ( .A1(operands_i[27]), .A2(n153), .B1(operands_i[11]), .B2(n152), .ZN(n151) );
  NAND2_X1 U82 ( .A1(n151), .A2(n154), .ZN(result_o[11]) );
  AOI22_X1 U83 ( .A1(operands_i[26]), .A2(n153), .B1(operands_i[10]), .B2(n152), .ZN(n155) );
  NAND2_X1 U84 ( .A1(n155), .A2(n154), .ZN(result_o[10]) );
endmodule


module sa_processing_element_max ( clk, rst_n, a, b, c, reg_clear, pipeline_en, 
        result_load, preload_en, a_out, b_out, c_out );
  input [15:0] a;
  input [15:0] b;
  input [15:0] c;
  output [15:0] a_out;
  output [15:0] b_out;
  output [15:0] c_out;
  input clk, rst_n, reg_clear, pipeline_en, result_load, preload_en;
  wire   n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, fpnew_operands_1__15_, fpnew_operands_1__14_,
         fpnew_operands_1__13_, fpnew_operands_1__12_, fpnew_operands_1__11_,
         fpnew_operands_1__10_, fpnew_operands_1__9_, fpnew_operands_1__8_,
         fpnew_operands_1__7_, fpnew_operands_1__6_, fpnew_operands_1__5_,
         fpnew_operands_1__4_, fpnew_operands_1__3_, fpnew_operands_1__2_,
         fpnew_operands_1__1_, fpnew_operands_1__0_, n92, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, net1261, net1262, net1263, net1264, net1265,
         net1266, net1267, net1268, net1269, net1270, net1271, net1272,
         net1273, net1274, net1275, net1276, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10;
  wire   [15:0] fpnew_result;

  fpnew_noncomp_2_0_0__logic_Z_1yB___logic_Z_1yB_ fpnew_max_i ( .clk_i(clk), 
        .rst_ni(net1261), .operands_i({fpnew_operands_1__15_, 
        fpnew_operands_1__14_, fpnew_operands_1__13_, fpnew_operands_1__12_, 
        fpnew_operands_1__11_, fpnew_operands_1__10_, fpnew_operands_1__9_, 
        fpnew_operands_1__8_, fpnew_operands_1__7_, fpnew_operands_1__6_, 
        fpnew_operands_1__5_, fpnew_operands_1__4_, fpnew_operands_1__3_, 
        fpnew_operands_1__2_, fpnew_operands_1__1_, fpnew_operands_1__0_, 
        a[15], n166, n164, a[12], n162, n160, n158, a[8:0]}), .is_boxed_i({
        net1262, net1263}), .rnd_mode_i({net1264, net1265, net1266}), .op_i({
        net1267, net1268, net1269, net1270}), .op_mod_i(net1271), .tag_i(
        net1272), .aux_i(net1273), .in_valid_i(net1274), .flush_i(net1275), 
        .result_o(fpnew_result), .class_mask_o({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10}), .out_ready_i(net1276) );
  DFFRNQ_X1 max_current_reg_0_ ( .D(n156), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__0_) );
  DFFRNQ_X1 max_current_reg_1_ ( .D(n155), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__1_) );
  DFFRNQ_X1 max_current_reg_2_ ( .D(n154), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__2_) );
  DFFRNQ_X1 max_current_reg_3_ ( .D(n153), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__3_) );
  DFFRNQ_X1 max_current_reg_4_ ( .D(n152), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__4_) );
  DFFRNQ_X1 max_current_reg_5_ ( .D(n151), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__5_) );
  DFFRNQ_X1 max_current_reg_6_ ( .D(n150), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__6_) );
  DFFRNQ_X1 max_current_reg_7_ ( .D(n149), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__7_) );
  DFFRNQ_X1 max_current_reg_8_ ( .D(n148), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__8_) );
  DFFRNQ_X1 max_current_reg_9_ ( .D(n147), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__9_) );
  DFFRNQ_X1 max_current_reg_10_ ( .D(n146), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__10_) );
  DFFRNQ_X1 max_current_reg_11_ ( .D(n145), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__11_) );
  DFFRNQ_X1 max_current_reg_12_ ( .D(n144), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__12_) );
  DFFRNQ_X1 max_current_reg_13_ ( .D(n143), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__13_) );
  DFFRNQ_X1 max_current_reg_14_ ( .D(n142), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__14_) );
  DFFRNQ_X1 max_current_reg_15_ ( .D(n141), .CLK(clk), .RN(rst_n), .Q(
        fpnew_operands_1__15_) );
  DFFRNQ_X1 result_q_reg_15_ ( .D(n140), .CLK(clk), .RN(rst_n), .Q(n336) );
  DFFRNQ_X1 result_q_reg_14_ ( .D(n139), .CLK(clk), .RN(rst_n), .Q(n337) );
  DFFRNQ_X1 result_q_reg_13_ ( .D(n138), .CLK(clk), .RN(rst_n), .Q(n338) );
  DFFRNQ_X1 result_q_reg_12_ ( .D(n137), .CLK(clk), .RN(rst_n), .Q(n339) );
  DFFRNQ_X1 result_q_reg_11_ ( .D(n136), .CLK(clk), .RN(rst_n), .Q(n340) );
  DFFRNQ_X1 result_q_reg_10_ ( .D(n135), .CLK(clk), .RN(rst_n), .Q(n341) );
  DFFRNQ_X1 result_q_reg_9_ ( .D(n134), .CLK(clk), .RN(rst_n), .Q(n342) );
  DFFRNQ_X1 result_q_reg_8_ ( .D(n133), .CLK(clk), .RN(rst_n), .Q(n343) );
  DFFRNQ_X1 result_q_reg_7_ ( .D(n132), .CLK(clk), .RN(rst_n), .Q(n344) );
  DFFRNQ_X1 result_q_reg_6_ ( .D(n131), .CLK(clk), .RN(rst_n), .Q(n345) );
  DFFRNQ_X1 result_q_reg_5_ ( .D(n130), .CLK(clk), .RN(rst_n), .Q(n346) );
  DFFRNQ_X1 result_q_reg_4_ ( .D(n129), .CLK(clk), .RN(rst_n), .Q(n347) );
  DFFRNQ_X1 result_q_reg_3_ ( .D(n128), .CLK(clk), .RN(rst_n), .Q(n348) );
  DFFRNQ_X1 result_q_reg_2_ ( .D(n127), .CLK(clk), .RN(rst_n), .Q(n349) );
  DFFRNQ_X1 result_q_reg_1_ ( .D(n126), .CLK(clk), .RN(rst_n), .Q(n350) );
  DFFRNQ_X1 result_q_reg_0_ ( .D(n125), .CLK(clk), .RN(rst_n), .Q(n351) );
  DFFRNQ_X1 a_q_reg_15_ ( .D(n124), .CLK(clk), .RN(rst_n), .Q(n304) );
  DFFRNQ_X1 a_q_reg_14_ ( .D(n123), .CLK(clk), .RN(rst_n), .Q(n305) );
  DFFRNQ_X1 a_q_reg_13_ ( .D(n122), .CLK(clk), .RN(rst_n), .Q(n306) );
  DFFRNQ_X1 a_q_reg_12_ ( .D(n121), .CLK(clk), .RN(rst_n), .Q(n307) );
  DFFRNQ_X1 a_q_reg_11_ ( .D(n120), .CLK(clk), .RN(rst_n), .Q(n308) );
  DFFRNQ_X1 a_q_reg_10_ ( .D(n119), .CLK(clk), .RN(rst_n), .Q(n309) );
  DFFRNQ_X1 a_q_reg_9_ ( .D(n118), .CLK(clk), .RN(rst_n), .Q(n310) );
  DFFRNQ_X1 a_q_reg_8_ ( .D(n117), .CLK(clk), .RN(rst_n), .Q(n311) );
  DFFRNQ_X1 a_q_reg_7_ ( .D(n116), .CLK(clk), .RN(rst_n), .Q(n312) );
  DFFRNQ_X1 a_q_reg_6_ ( .D(n115), .CLK(clk), .RN(rst_n), .Q(n313) );
  DFFRNQ_X1 a_q_reg_5_ ( .D(n114), .CLK(clk), .RN(rst_n), .Q(n314) );
  DFFRNQ_X1 a_q_reg_4_ ( .D(n113), .CLK(clk), .RN(rst_n), .Q(n315) );
  DFFRNQ_X1 a_q_reg_3_ ( .D(n112), .CLK(clk), .RN(rst_n), .Q(n316) );
  DFFRNQ_X1 a_q_reg_2_ ( .D(n111), .CLK(clk), .RN(rst_n), .Q(n317) );
  DFFRNQ_X1 a_q_reg_1_ ( .D(n110), .CLK(clk), .RN(rst_n), .Q(n318) );
  DFFRNQ_X1 a_q_reg_0_ ( .D(n109), .CLK(clk), .RN(rst_n), .Q(n319) );
  DFFRNQ_X1 b_q_reg_15_ ( .D(n108), .CLK(clk), .RN(rst_n), .Q(n320) );
  DFFRNQ_X1 b_q_reg_14_ ( .D(n107), .CLK(clk), .RN(rst_n), .Q(n321) );
  DFFRNQ_X1 b_q_reg_13_ ( .D(n106), .CLK(clk), .RN(rst_n), .Q(n322) );
  DFFRNQ_X1 b_q_reg_12_ ( .D(n105), .CLK(clk), .RN(rst_n), .Q(n323) );
  DFFRNQ_X1 b_q_reg_11_ ( .D(n104), .CLK(clk), .RN(rst_n), .Q(n324) );
  DFFRNQ_X1 b_q_reg_10_ ( .D(n103), .CLK(clk), .RN(rst_n), .Q(n325) );
  DFFRNQ_X1 b_q_reg_9_ ( .D(n102), .CLK(clk), .RN(rst_n), .Q(n326) );
  DFFRNQ_X1 b_q_reg_8_ ( .D(n101), .CLK(clk), .RN(rst_n), .Q(n327) );
  DFFRNQ_X1 b_q_reg_7_ ( .D(n100), .CLK(clk), .RN(rst_n), .Q(n328) );
  DFFRNQ_X1 b_q_reg_6_ ( .D(n99), .CLK(clk), .RN(rst_n), .Q(n329) );
  DFFRNQ_X1 b_q_reg_5_ ( .D(n98), .CLK(clk), .RN(rst_n), .Q(n330) );
  DFFRNQ_X1 b_q_reg_4_ ( .D(n97), .CLK(clk), .RN(rst_n), .Q(n331) );
  DFFRNQ_X1 b_q_reg_3_ ( .D(n96), .CLK(clk), .RN(rst_n), .Q(n332) );
  DFFRNQ_X1 b_q_reg_2_ ( .D(n95), .CLK(clk), .RN(rst_n), .Q(n333) );
  DFFRNQ_X1 b_q_reg_1_ ( .D(n94), .CLK(clk), .RN(rst_n), .Q(n334) );
  DFFRNQ_X1 b_q_reg_0_ ( .D(n92), .CLK(clk), .RN(rst_n), .Q(n335) );
  INV_X1 U158 ( .I(a[9]), .ZN(n157) );
  INV_X1 U159 ( .I(n157), .ZN(n158) );
  INV_X1 U160 ( .I(a[10]), .ZN(n159) );
  INV_X1 U161 ( .I(n159), .ZN(n160) );
  INV_X1 U162 ( .I(a[11]), .ZN(n161) );
  INV_X1 U163 ( .I(n161), .ZN(n162) );
  INV_X1 U164 ( .I(a[13]), .ZN(n163) );
  INV_X1 U165 ( .I(n163), .ZN(n164) );
  INV_X1 U166 ( .I(a[14]), .ZN(n165) );
  INV_X1 U167 ( .I(n165), .ZN(n166) );
  INV_X1 U168 ( .I(fpnew_operands_1__15_), .ZN(n222) );
  INV_X1 U169 ( .I(reg_clear), .ZN(n185) );
  NAND2_X1 U170 ( .A1(result_load), .A2(n185), .ZN(n184) );
  OR2_X1 U171 ( .A1(reg_clear), .A2(result_load), .Z(n183) );
  INV_X1 U172 ( .I(n336), .ZN(n167) );
  OAI22_X1 U173 ( .A1(n222), .A2(n184), .B1(n183), .B2(n167), .ZN(n140) );
  INV_X1 U174 ( .I(fpnew_operands_1__10_), .ZN(n254) );
  INV_X1 U175 ( .I(n341), .ZN(n168) );
  OAI22_X1 U176 ( .A1(n254), .A2(n184), .B1(n183), .B2(n168), .ZN(n135) );
  INV_X1 U177 ( .I(fpnew_operands_1__13_), .ZN(n242) );
  INV_X1 U178 ( .I(n338), .ZN(n169) );
  OAI22_X1 U179 ( .A1(n242), .A2(n184), .B1(n183), .B2(n169), .ZN(n138) );
  INV_X1 U180 ( .I(fpnew_operands_1__9_), .ZN(n248) );
  INV_X1 U181 ( .I(n342), .ZN(n170) );
  OAI22_X1 U182 ( .A1(n248), .A2(n184), .B1(n183), .B2(n170), .ZN(n134) );
  INV_X1 U183 ( .I(fpnew_operands_1__3_), .ZN(n228) );
  INV_X1 U184 ( .I(n348), .ZN(n171) );
  OAI22_X1 U185 ( .A1(n228), .A2(n184), .B1(n183), .B2(n171), .ZN(n128) );
  INV_X1 U186 ( .I(fpnew_operands_1__11_), .ZN(n250) );
  INV_X1 U187 ( .I(n340), .ZN(n172) );
  OAI22_X1 U188 ( .A1(n250), .A2(n184), .B1(n183), .B2(n172), .ZN(n136) );
  INV_X1 U189 ( .I(fpnew_operands_1__0_), .ZN(n224) );
  INV_X1 U190 ( .I(n351), .ZN(n173) );
  OAI22_X1 U191 ( .A1(n224), .A2(n184), .B1(n183), .B2(n173), .ZN(n125) );
  INV_X1 U192 ( .I(fpnew_operands_1__7_), .ZN(n232) );
  INV_X1 U193 ( .I(n344), .ZN(n174) );
  OAI22_X1 U194 ( .A1(n232), .A2(n184), .B1(n183), .B2(n174), .ZN(n132) );
  INV_X1 U195 ( .I(fpnew_operands_1__5_), .ZN(n230) );
  INV_X1 U196 ( .I(n346), .ZN(n175) );
  OAI22_X1 U197 ( .A1(n230), .A2(n184), .B1(n183), .B2(n175), .ZN(n130) );
  INV_X1 U198 ( .I(fpnew_operands_1__4_), .ZN(n236) );
  INV_X1 U199 ( .I(n347), .ZN(n176) );
  OAI22_X1 U200 ( .A1(n236), .A2(n184), .B1(n183), .B2(n176), .ZN(n129) );
  INV_X1 U201 ( .I(fpnew_operands_1__1_), .ZN(n240) );
  INV_X1 U202 ( .I(n350), .ZN(n177) );
  OAI22_X1 U203 ( .A1(n240), .A2(n184), .B1(n183), .B2(n177), .ZN(n126) );
  INV_X1 U204 ( .I(fpnew_operands_1__2_), .ZN(n234) );
  INV_X1 U205 ( .I(n349), .ZN(n178) );
  OAI22_X1 U206 ( .A1(n234), .A2(n184), .B1(n183), .B2(n178), .ZN(n127) );
  INV_X1 U207 ( .I(fpnew_operands_1__6_), .ZN(n238) );
  INV_X1 U208 ( .I(n345), .ZN(n179) );
  OAI22_X1 U209 ( .A1(n238), .A2(n184), .B1(n183), .B2(n179), .ZN(n131) );
  INV_X1 U210 ( .I(fpnew_operands_1__14_), .ZN(n246) );
  INV_X1 U211 ( .I(n337), .ZN(n180) );
  OAI22_X1 U212 ( .A1(n246), .A2(n184), .B1(n183), .B2(n180), .ZN(n139) );
  INV_X1 U213 ( .I(fpnew_operands_1__12_), .ZN(n244) );
  INV_X1 U214 ( .I(n339), .ZN(n181) );
  OAI22_X1 U215 ( .A1(n244), .A2(n184), .B1(n183), .B2(n181), .ZN(n137) );
  INV_X1 U216 ( .I(fpnew_operands_1__8_), .ZN(n226) );
  INV_X1 U217 ( .I(n343), .ZN(n182) );
  OAI22_X1 U218 ( .A1(n226), .A2(n184), .B1(n183), .B2(n182), .ZN(n133) );
  NOR2_X1 U219 ( .A1(reg_clear), .A2(pipeline_en), .ZN(n218) );
  NAND2_X1 U220 ( .A1(pipeline_en), .A2(n185), .ZN(n220) );
  INV_X1 U221 ( .I(n220), .ZN(n219) );
  AOI22_X1 U222 ( .A1(n218), .A2(n304), .B1(n219), .B2(a[15]), .ZN(n186) );
  INV_X1 U223 ( .I(n186), .ZN(n124) );
  AOI22_X1 U224 ( .A1(n218), .A2(n305), .B1(n219), .B2(n166), .ZN(n187) );
  INV_X1 U225 ( .I(n187), .ZN(n123) );
  AOI22_X1 U226 ( .A1(n218), .A2(n306), .B1(n219), .B2(n164), .ZN(n188) );
  INV_X1 U227 ( .I(n188), .ZN(n122) );
  AOI22_X1 U228 ( .A1(n218), .A2(n307), .B1(n219), .B2(a[12]), .ZN(n189) );
  INV_X1 U229 ( .I(n189), .ZN(n121) );
  AOI22_X1 U230 ( .A1(n218), .A2(n308), .B1(n219), .B2(n162), .ZN(n190) );
  INV_X1 U231 ( .I(n190), .ZN(n120) );
  AOI22_X1 U232 ( .A1(n218), .A2(n309), .B1(n219), .B2(n160), .ZN(n191) );
  INV_X1 U233 ( .I(n191), .ZN(n119) );
  AOI22_X1 U234 ( .A1(n218), .A2(n310), .B1(n219), .B2(n158), .ZN(n192) );
  INV_X1 U235 ( .I(n192), .ZN(n118) );
  AOI22_X1 U236 ( .A1(n218), .A2(n311), .B1(n219), .B2(a[8]), .ZN(n193) );
  INV_X1 U237 ( .I(n193), .ZN(n117) );
  AOI22_X1 U238 ( .A1(n218), .A2(n335), .B1(n219), .B2(b[0]), .ZN(n194) );
  INV_X1 U239 ( .I(n194), .ZN(n92) );
  AOI22_X1 U240 ( .A1(n218), .A2(n312), .B1(n219), .B2(a[7]), .ZN(n195) );
  INV_X1 U241 ( .I(n195), .ZN(n116) );
  AOI22_X1 U242 ( .A1(n218), .A2(n313), .B1(n219), .B2(a[6]), .ZN(n196) );
  INV_X1 U243 ( .I(n196), .ZN(n115) );
  AOI22_X1 U244 ( .A1(n218), .A2(n314), .B1(n219), .B2(a[5]), .ZN(n197) );
  INV_X1 U245 ( .I(n197), .ZN(n114) );
  AOI22_X1 U246 ( .A1(n218), .A2(n315), .B1(n219), .B2(a[4]), .ZN(n198) );
  INV_X1 U247 ( .I(n198), .ZN(n113) );
  AOI22_X1 U248 ( .A1(n218), .A2(n316), .B1(n219), .B2(a[3]), .ZN(n199) );
  INV_X1 U249 ( .I(n199), .ZN(n112) );
  AOI22_X1 U250 ( .A1(n218), .A2(n317), .B1(n219), .B2(a[2]), .ZN(n200) );
  INV_X1 U251 ( .I(n200), .ZN(n111) );
  AOI22_X1 U252 ( .A1(n218), .A2(n318), .B1(n219), .B2(a[1]), .ZN(n201) );
  INV_X1 U253 ( .I(n201), .ZN(n110) );
  AOI22_X1 U254 ( .A1(n218), .A2(n319), .B1(n219), .B2(a[0]), .ZN(n202) );
  INV_X1 U255 ( .I(n202), .ZN(n109) );
  AOI22_X1 U256 ( .A1(n218), .A2(n320), .B1(n219), .B2(b[15]), .ZN(n203) );
  INV_X1 U257 ( .I(n203), .ZN(n108) );
  AOI22_X1 U258 ( .A1(n218), .A2(n321), .B1(n219), .B2(b[14]), .ZN(n204) );
  INV_X1 U259 ( .I(n204), .ZN(n107) );
  AOI22_X1 U260 ( .A1(n218), .A2(n322), .B1(n219), .B2(b[13]), .ZN(n205) );
  INV_X1 U261 ( .I(n205), .ZN(n106) );
  AOI22_X1 U262 ( .A1(n218), .A2(n323), .B1(n219), .B2(b[12]), .ZN(n206) );
  INV_X1 U263 ( .I(n206), .ZN(n105) );
  AOI22_X1 U264 ( .A1(n218), .A2(n324), .B1(n219), .B2(b[11]), .ZN(n207) );
  INV_X1 U265 ( .I(n207), .ZN(n104) );
  AOI22_X1 U266 ( .A1(n218), .A2(n325), .B1(n219), .B2(b[10]), .ZN(n208) );
  INV_X1 U267 ( .I(n208), .ZN(n103) );
  AOI22_X1 U268 ( .A1(n218), .A2(n326), .B1(n219), .B2(b[9]), .ZN(n209) );
  INV_X1 U269 ( .I(n209), .ZN(n102) );
  AOI22_X1 U270 ( .A1(n218), .A2(n327), .B1(n219), .B2(b[8]), .ZN(n210) );
  INV_X1 U271 ( .I(n210), .ZN(n101) );
  AOI22_X1 U272 ( .A1(n218), .A2(n328), .B1(n219), .B2(b[7]), .ZN(n211) );
  INV_X1 U273 ( .I(n211), .ZN(n100) );
  AOI22_X1 U274 ( .A1(n218), .A2(n329), .B1(n219), .B2(b[6]), .ZN(n212) );
  INV_X1 U275 ( .I(n212), .ZN(n99) );
  AOI22_X1 U276 ( .A1(n218), .A2(n330), .B1(n219), .B2(b[5]), .ZN(n213) );
  INV_X1 U277 ( .I(n213), .ZN(n98) );
  AOI22_X1 U278 ( .A1(n218), .A2(n331), .B1(n219), .B2(b[4]), .ZN(n214) );
  INV_X1 U279 ( .I(n214), .ZN(n97) );
  AOI22_X1 U280 ( .A1(n218), .A2(n332), .B1(n219), .B2(b[3]), .ZN(n215) );
  INV_X1 U281 ( .I(n215), .ZN(n96) );
  AOI22_X1 U282 ( .A1(n218), .A2(n333), .B1(n219), .B2(b[2]), .ZN(n216) );
  INV_X1 U283 ( .I(n216), .ZN(n95) );
  AOI22_X1 U284 ( .A1(n218), .A2(n334), .B1(n219), .B2(b[1]), .ZN(n217) );
  INV_X1 U285 ( .I(n217), .ZN(n94) );
  INV_X1 U286 ( .I(n218), .ZN(n255) );
  AND2_X1 U287 ( .A1(n219), .A2(preload_en), .Z(n252) );
  NOR2_X1 U288 ( .A1(preload_en), .A2(n220), .ZN(n251) );
  AOI22_X1 U289 ( .A1(n252), .A2(c[15]), .B1(n251), .B2(fpnew_result[15]), 
        .ZN(n221) );
  OAI21_X1 U290 ( .A1(n255), .A2(n222), .B(n221), .ZN(n141) );
  AOI22_X1 U291 ( .A1(n252), .A2(c[0]), .B1(n251), .B2(fpnew_result[0]), .ZN(
        n223) );
  OAI21_X1 U292 ( .A1(n255), .A2(n224), .B(n223), .ZN(n156) );
  AOI22_X1 U293 ( .A1(n252), .A2(c[8]), .B1(n251), .B2(fpnew_result[8]), .ZN(
        n225) );
  OAI21_X1 U294 ( .A1(n255), .A2(n226), .B(n225), .ZN(n148) );
  AOI22_X1 U295 ( .A1(n252), .A2(c[3]), .B1(n251), .B2(fpnew_result[3]), .ZN(
        n227) );
  OAI21_X1 U296 ( .A1(n255), .A2(n228), .B(n227), .ZN(n153) );
  AOI22_X1 U297 ( .A1(n252), .A2(c[5]), .B1(n251), .B2(fpnew_result[5]), .ZN(
        n229) );
  OAI21_X1 U298 ( .A1(n255), .A2(n230), .B(n229), .ZN(n151) );
  AOI22_X1 U299 ( .A1(n252), .A2(c[7]), .B1(n251), .B2(fpnew_result[7]), .ZN(
        n231) );
  OAI21_X1 U300 ( .A1(n255), .A2(n232), .B(n231), .ZN(n149) );
  AOI22_X1 U301 ( .A1(n252), .A2(c[2]), .B1(n251), .B2(fpnew_result[2]), .ZN(
        n233) );
  OAI21_X1 U302 ( .A1(n255), .A2(n234), .B(n233), .ZN(n154) );
  AOI22_X1 U303 ( .A1(n252), .A2(c[4]), .B1(n251), .B2(fpnew_result[4]), .ZN(
        n235) );
  OAI21_X1 U304 ( .A1(n255), .A2(n236), .B(n235), .ZN(n152) );
  AOI22_X1 U305 ( .A1(n252), .A2(c[6]), .B1(n251), .B2(fpnew_result[6]), .ZN(
        n237) );
  OAI21_X1 U306 ( .A1(n255), .A2(n238), .B(n237), .ZN(n150) );
  AOI22_X1 U307 ( .A1(n252), .A2(c[1]), .B1(n251), .B2(fpnew_result[1]), .ZN(
        n239) );
  OAI21_X1 U308 ( .A1(n255), .A2(n240), .B(n239), .ZN(n155) );
  AOI22_X1 U309 ( .A1(n252), .A2(c[13]), .B1(n251), .B2(fpnew_result[13]), 
        .ZN(n241) );
  OAI21_X1 U310 ( .A1(n255), .A2(n242), .B(n241), .ZN(n143) );
  AOI22_X1 U311 ( .A1(n252), .A2(c[12]), .B1(n251), .B2(fpnew_result[12]), 
        .ZN(n243) );
  OAI21_X1 U312 ( .A1(n255), .A2(n244), .B(n243), .ZN(n144) );
  AOI22_X1 U313 ( .A1(n252), .A2(c[14]), .B1(n251), .B2(fpnew_result[14]), 
        .ZN(n245) );
  OAI21_X1 U314 ( .A1(n255), .A2(n246), .B(n245), .ZN(n142) );
  AOI22_X1 U315 ( .A1(n252), .A2(c[9]), .B1(n251), .B2(fpnew_result[9]), .ZN(
        n247) );
  OAI21_X1 U316 ( .A1(n255), .A2(n248), .B(n247), .ZN(n147) );
  AOI22_X1 U317 ( .A1(n252), .A2(c[11]), .B1(n251), .B2(fpnew_result[11]), 
        .ZN(n249) );
  OAI21_X1 U318 ( .A1(n255), .A2(n250), .B(n249), .ZN(n145) );
  AOI22_X1 U319 ( .A1(n252), .A2(c[10]), .B1(n251), .B2(fpnew_result[10]), 
        .ZN(n253) );
  OAI21_X1 U320 ( .A1(n255), .A2(n254), .B(n253), .ZN(n146) );
  BUF_X1 U323 ( .I(n351), .Z(c_out[0]) );
  BUF_X1 U324 ( .I(n350), .Z(c_out[1]) );
  BUF_X1 U325 ( .I(n349), .Z(c_out[2]) );
  BUF_X1 U326 ( .I(n348), .Z(c_out[3]) );
  BUF_X1 U327 ( .I(n347), .Z(c_out[4]) );
  BUF_X1 U328 ( .I(n346), .Z(c_out[5]) );
  BUF_X1 U329 ( .I(n345), .Z(c_out[6]) );
  BUF_X1 U330 ( .I(n344), .Z(c_out[7]) );
  BUF_X1 U331 ( .I(n343), .Z(c_out[8]) );
  BUF_X1 U332 ( .I(n342), .Z(c_out[9]) );
  BUF_X1 U333 ( .I(n341), .Z(c_out[10]) );
  BUF_X1 U334 ( .I(n340), .Z(c_out[11]) );
  BUF_X1 U335 ( .I(n339), .Z(c_out[12]) );
  BUF_X1 U336 ( .I(n338), .Z(c_out[13]) );
  BUF_X1 U337 ( .I(n337), .Z(c_out[14]) );
  BUF_X1 U338 ( .I(n336), .Z(c_out[15]) );
  BUF_X1 U339 ( .I(n335), .Z(b_out[0]) );
  BUF_X1 U340 ( .I(n334), .Z(b_out[1]) );
  BUF_X1 U341 ( .I(n333), .Z(b_out[2]) );
  BUF_X1 U342 ( .I(n332), .Z(b_out[3]) );
  BUF_X1 U343 ( .I(n331), .Z(b_out[4]) );
  BUF_X1 U344 ( .I(n330), .Z(b_out[5]) );
  BUF_X1 U345 ( .I(n329), .Z(b_out[6]) );
  BUF_X1 U346 ( .I(n328), .Z(b_out[7]) );
  BUF_X1 U347 ( .I(n327), .Z(b_out[8]) );
  BUF_X1 U348 ( .I(n326), .Z(b_out[9]) );
  BUF_X1 U349 ( .I(n325), .Z(b_out[10]) );
  BUF_X1 U350 ( .I(n324), .Z(b_out[11]) );
  BUF_X1 U351 ( .I(n323), .Z(b_out[12]) );
  BUF_X1 U352 ( .I(n322), .Z(b_out[13]) );
  BUF_X1 U353 ( .I(n321), .Z(b_out[14]) );
  BUF_X1 U354 ( .I(n320), .Z(b_out[15]) );
  BUF_X1 U355 ( .I(n319), .Z(a_out[0]) );
  BUF_X1 U356 ( .I(n318), .Z(a_out[1]) );
  BUF_X1 U357 ( .I(n317), .Z(a_out[2]) );
  BUF_X1 U358 ( .I(n316), .Z(a_out[3]) );
  BUF_X1 U359 ( .I(n315), .Z(a_out[4]) );
  BUF_X1 U360 ( .I(n314), .Z(a_out[5]) );
  BUF_X1 U361 ( .I(n313), .Z(a_out[6]) );
  BUF_X1 U362 ( .I(n312), .Z(a_out[7]) );
  BUF_X1 U363 ( .I(n311), .Z(a_out[8]) );
  BUF_X1 U364 ( .I(n310), .Z(a_out[9]) );
  BUF_X1 U365 ( .I(n309), .Z(a_out[10]) );
  BUF_X1 U366 ( .I(n308), .Z(a_out[11]) );
  BUF_X1 U367 ( .I(n307), .Z(a_out[12]) );
  BUF_X1 U368 ( .I(n306), .Z(a_out[13]) );
  BUF_X1 U369 ( .I(n305), .Z(a_out[14]) );
  BUF_X1 U370 ( .I(n304), .Z(a_out[15]) );
endmodule

