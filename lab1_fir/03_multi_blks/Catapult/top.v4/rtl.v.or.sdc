# written for flow package OasysRTL 
set sdc_version 1.7 

set_operating_conditions typical
set_load 11.40290 [all_outputs]
## driver/slew constraints on inputs
set data_inputs [list din_rsc_vld {din_rsc_dat[*]} dout_rsc_rdy {coeffs[*]}]
set_driving_cell -no_design_rule -library NangateOpenCellLibrary -lib_cell DFF_X1 -pin Q $data_inputs
set_units -time ns
# time_factor: 1.0

create_clock -name clk -period 10.0 -waveform { 0.0 5.0 } [get_ports {clk}]
set_clock_uncertainty 0.0 [get_clocks {clk}]

create_clock -name virtual_io_clk -period 10.0
## IO TIMING CONSTRAINTS
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {rst}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {din_rsc_dat[*]}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {din_rsc_vld}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {din_rsc_rdy}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {coeffs[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {dout_rsc_dat[*]}]
set_output_delay -clock [get_clocks {clk}] 0.0 [get_ports {dout_rsc_vld}]
set_input_delay -clock [get_clocks {clk}] 0.0 [get_ports {dout_rsc_rdy}]

