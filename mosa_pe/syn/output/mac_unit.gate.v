/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : V-2023.12-SP5
// Date      : Wed Sep 24 09:18:49 2025
/////////////////////////////////////////////////////////////


module mac_unit ( clk, rst, x_new, w_new, x_old, w_old, pe_val );
  input [31:0] x_new;
  input [31:0] w_new;
  output [31:0] x_old;
  output [31:0] w_old;
  output [31:0] pe_val;
  input clk, rst;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71,
         N72, N73, N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85,
         N86, N87, N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99,
         N100, N101, N102, N103, N104, N105, N106, N107, N108, N109, N110,
         N111, N112, N113, N114, N115, N116, N117, N118, N119, N120, N121,
         N122, N123, N124, N125, N126, N127, N128, N129, N130;
  wire   [31:0] partial_sum_reg;

  \**SEQGEN**  x_new_reg_reg_31_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N34), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[31]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_30_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N33), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[30]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_29_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N32), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[29]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_28_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N31), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[28]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_27_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N30), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[27]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_26_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N29), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[26]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_25_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N28), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[25]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_24_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N27), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[24]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_23_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N26), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[23]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_22_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N25), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[22]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_21_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N24), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[21]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_20_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N23), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[20]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_19_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N22), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[19]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_18_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N21), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_17_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N20), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_16_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N19), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_15_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N18), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_14_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N17), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_13_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N16), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_12_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N15), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_11_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N14), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_10_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N13), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_9_ ( .clear(1'b0), .preset(1'b0), .next_state(N12), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[9]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  x_new_reg_reg_8_ ( .clear(1'b0), .preset(1'b0), .next_state(N11), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[8]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  x_new_reg_reg_7_ ( .clear(1'b0), .preset(1'b0), .next_state(N10), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[7]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  x_new_reg_reg_6_ ( .clear(1'b0), .preset(1'b0), .next_state(N9), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_5_ ( .clear(1'b0), .preset(1'b0), .next_state(N8), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_4_ ( .clear(1'b0), .preset(1'b0), .next_state(N7), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_3_ ( .clear(1'b0), .preset(1'b0), .next_state(N6), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_2_ ( .clear(1'b0), .preset(1'b0), .next_state(N5), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_1_ ( .clear(1'b0), .preset(1'b0), .next_state(N4), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_new_reg_reg_0_ ( .clear(1'b0), .preset(1'b0), .next_state(N3), 
        .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(x_old[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_31_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N66), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[31]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_30_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N65), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[30]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_29_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N64), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[29]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_28_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N63), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[28]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_27_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N62), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[27]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_26_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N61), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[26]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_25_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N60), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[25]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_24_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N59), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[24]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_23_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N58), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[23]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_22_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N57), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[22]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_21_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N56), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[21]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_20_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N55), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[20]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_19_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N54), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[19]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_18_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N53), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[18]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_17_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N52), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[17]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_16_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N51), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[16]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_15_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N50), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[15]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_14_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N49), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[14]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_13_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N48), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_12_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N47), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_11_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N46), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_10_ ( .clear(1'b0), .preset(1'b0), .next_state(
        N45), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_new_reg_reg_9_ ( .clear(1'b0), .preset(1'b0), .next_state(N44), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[9]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_8_ ( .clear(1'b0), .preset(1'b0), .next_state(N43), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[8]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_7_ ( .clear(1'b0), .preset(1'b0), .next_state(N42), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[7]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_6_ ( .clear(1'b0), .preset(1'b0), .next_state(N41), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[6]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_5_ ( .clear(1'b0), .preset(1'b0), .next_state(N40), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[5]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_4_ ( .clear(1'b0), .preset(1'b0), .next_state(N39), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[4]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_3_ ( .clear(1'b0), .preset(1'b0), .next_state(N38), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[3]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_2_ ( .clear(1'b0), .preset(1'b0), .next_state(N37), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[2]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_1_ ( .clear(1'b0), .preset(1'b0), .next_state(N36), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[1]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  w_new_reg_reg_0_ ( .clear(1'b0), .preset(1'b0), .next_state(N35), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(w_old[0]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1)
         );
  \**SEQGEN**  partial_sum_reg_reg_31_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N98), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[31]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_30_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N97), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[30]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_29_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N96), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[29]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_28_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N95), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[28]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_27_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N94), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[27]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_26_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N93), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[26]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_25_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N92), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[25]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_24_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N91), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[24]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_23_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N90), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[23]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_22_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N89), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[22]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_21_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N88), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[21]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_20_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N87), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[20]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_19_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N86), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[19]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_18_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N85), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[18]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_17_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N84), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[17]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_16_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N83), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[16]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_15_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N82), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[15]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_14_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N81), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[14]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_13_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N80), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[13]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_12_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N79), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[12]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_11_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N78), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[11]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_10_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N77), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[10]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_9_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N76), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[9]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_8_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N75), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[8]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_7_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N74), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[7]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_6_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N73), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[6]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_5_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N72), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[5]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_4_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N71), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[4]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_3_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N70), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[3]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_2_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N69), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[2]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_1_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N68), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[1]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  partial_sum_reg_reg_0_ ( .clear(1'b0), .preset(1'b0), 
        .next_state(N67), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        partial_sum_reg[0]), .synch_clear(1'b0), .synch_preset(1'b0), 
        .synch_toggle(1'b0), .synch_enable(1'b1) );
  MULT_UNS_OP mult_41 ( .A(x_new), .B(w_new), .Z({N130, N129, N128, N127, N126, 
        N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, N114, 
        N113, N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, 
        N101, N100, N99}) );
  ADD_UNS_OP add_41 ( .A(partial_sum_reg), .B({N130, N129, N128, N127, N126, 
        N125, N124, N123, N122, N121, N120, N119, N118, N117, N116, N115, N114, 
        N113, N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, 
        N101, N100, N99}), .Z(pe_val) );
  SELECT_OP C111 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(x_new), .CONTROL1(N0), .CONTROL2(N1), .Z({N34, N33, N32, N31, N30, 
        N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  GTECH_BUF B_0 ( .A(rst), .Z(N0) );
  GTECH_BUF B_1 ( .A(N2), .Z(N1) );
  SELECT_OP C112 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(w_new), .CONTROL1(N0), .CONTROL2(N1), .Z({N66, N65, N64, N63, N62, 
        N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, 
        N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35}) );
  SELECT_OP C113 ( .DATA1({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .DATA2(pe_val), .CONTROL1(N0), .CONTROL2(N1), .Z({N98, N97, N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, 
        N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N69, N68, N67}) );
  GTECH_NOT I_0 ( .A(rst), .Z(N2) );
endmodule

