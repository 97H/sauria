#set clk_freq 700
#set my_period [expr 1000/ $clk_freq]
#set clk_name clk

set search_path [ list . \
        /home/csarch/tools/syn/V-2023.12-SP5/libraries/syn \
        /home/csarch/workspace/MOSA_RTL/syn/pdk/NanGate_15nm_OCL_v0.1_2014_06_Apache.A/front_end/timing_power_noise/NLDM \
        /home/csarch/workspace/sauria/pulp_platform/common_cells/include]

set target_library "NanGate_15nm_OCL.db"

set synthetic_library [list dw_foundation.sldb ]

set link_library [list * NanGate_15nm_OCL.db \
                         dw_foundation.sldb]

set top_design sa_processing_element
set_svf sa_processing_element.svf
define_design_lib work -path ./work

set rtl [ list \
        ../../pulp_platform/fpnew/src/fpnew_pkg.sv\
        ../src/pulp_fma/fma_wrapper.sv\
        ../src/pulp_fma/fpnew_fma.sv\
        ../src/multiplier/multiplier_generic.sv\
        ../src/multiplier/multiplier_ideal.sv\
        ../src/multiplier/multiplier_booth.sv\
        ../src/multiplier/multiplier_wallace.sv\
        ../src/multiplier/multiplier_bam.sv\
        ../src/multiplier/multiplier_log.sv\
        ../src/multiplier/wallace_4.sv\
        ../src/multiplier/wallace_8.sv\
        ../src/multiplier/wallace_16.sv\
        ../src/multiplier/bam_cell.sv\
        ../src/multiplier/mul_2x2.sv\
        ../src/multiplier/lopd.sv\
        ../src/adder/adder_generic.sv\
        ../src/adder/adder_ideal.sv\
        ../src/adder/adder_gear.sv\
        ../src/adder/adder_gear_2c.sv\
        ../src/adder/adder_loa.sv\
        ../src/adder/adder_trua.sv\
        ../src/adder/adder_truah.sv\
        ../src/sa_processing_element.sv\
]

analyze -format sverilog $rtl
elaborate -architecture verilog $top_design
#uniquify : uniquify is executed automatically

foreach_in_collection design [ get_designs "*" ] {
    current_design $design
    set_fix_multiple_port_nets -all -buffer_constants
}

#read_ddc ./output/pad_TOP_unmapped.ddc
current_design $top_design

set_fix_multiple_port_nets -all -buffer_constants

redirect -tee -file rpt/0_link.rpt {link}
redirect -tee -file rpt/1_check_design.rpt {check_design}
#write -format ddc -hierarchy -out ./output/pad_TOP_unmapped.ddc

#do "dcprocheck" prior to source the below constraint file
#create_clock -period 10 -name clk -waveform {5 10} [get_ports clk]
redirect -tee -file rpt/2_source.rpt {source -echo -verbose cons/TOP.con}

#create_clock -period $my_period -name $clk_name
#set_input_delay 0.1 -clock $clk_name [all_inputs]
#set_output_delay 0.1 -clock $clk_name [all_outputs]
#set_max_delay 10000 -from [all_inputs] -to [all_outputs]
#set_min_delay 0.1 -from [all_inputs] -to [all_outputs]

redirect -tee -file rpt/3_check_timing.rpt {check_timing}
redirect -tee -file rpt/4_report_port.rpt {report_port -verbose}

#set_boundary_optimization $top_design false
#redirect -tee -file rpt/5_compile.rpt {compile_ultra -no_autoungroup -no_seq_output_inversion}
redirect -tee -file rpt/5_compile.rpt {compile_ultra -no_autoungroup}
redirect -tee -file rpt/6_report_constraint.rpt {report_constraint -all_violators}
redirect -tee -file rpt/7_report_timing.rpt {report_timing}
redirect -tee -file rpt/8_report_path_group.rpt {report_path_group}
redirect -tee -file rpt/9_report_area.rpt {report_area}
redirect -tee -file rpt/10_report_clock.rpt {report_clock -skew -attr}; #This is for dc_shell-topo
redirect -tee -file rpt/11_report_power.rpt {report_power};

# "tri" to "wire"
set verilogout_no_tri true
# bus[10] to bus_10_
change_names -rules verilog -hierarchy

write -format verilog -hierarchy -output ./output/$top_design.gate.v
write -format ddc -hierarchy -output ./output/$top_design.mapped.ddc
write_sdc -version 2.1 ./output/$top_design.sdc
write_sdf ./output/$top_design.sdf_dc
set_svf -off

#quit


