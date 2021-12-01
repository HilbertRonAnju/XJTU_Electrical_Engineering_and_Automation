set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports clk ];

set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {dac_data[0]}]

set_property PACKAGE_PIN U9 [get_ports {dac_data[7]}]
set_property PACKAGE_PIN V9 [get_ports {dac_data[6]}]
set_property PACKAGE_PIN U7 [get_ports {dac_data[5]}]
set_property PACKAGE_PIN U6 [get_ports {dac_data[4]}]
set_property PACKAGE_PIN R7 [get_ports {dac_data[3]}]
set_property PACKAGE_PIN T6 [get_ports {dac_data[2]}]
set_property PACKAGE_PIN R8 [get_ports {dac_data[1]}]
set_property PACKAGE_PIN T8 [get_ports {dac_data[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports dac_cs_n]
set_property IOSTANDARD LVCMOS33 [get_ports dac_ile]
set_property IOSTANDARD LVCMOS33 [get_ports dac_wr1_n]
set_property IOSTANDARD LVCMOS33 [get_ports dac_wr2_n]
set_property IOSTANDARD LVCMOS33 [get_ports dac_xfer_n]

set_property PACKAGE_PIN V7 [get_ports dac_xfer_n]
set_property PACKAGE_PIN N6 [get_ports dac_cs_n]
set_property PACKAGE_PIN V6 [get_ports dac_wr1_n]
set_property PACKAGE_PIN R6 [get_ports dac_wr2_n]
set_property PACKAGE_PIN R5 [get_ports dac_ile]

