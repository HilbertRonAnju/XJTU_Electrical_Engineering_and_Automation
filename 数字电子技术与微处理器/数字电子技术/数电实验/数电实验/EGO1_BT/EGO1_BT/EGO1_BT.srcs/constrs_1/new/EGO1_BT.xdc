set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports clk];
set_property -dict {PACKAGE_PIN L3 IOSTANDARD LVCMOS33} [get_ports rxd];
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports txd];
set_property -dict {PACKAGE_PIN D18 IOSTANDARD LVCMOS33} [get_ports bt_pw_on];
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports bt_master_slave];
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports bt_rst_n];
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports bt_sw];
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports bt_sw_hw];

set_property -dict {PACKAGE_PIN P5 IOSTANDARD LVCMOS33} [get_ports {sw_pin[0]}];
set_property -dict {PACKAGE_PIN M4 IOSTANDARD LVCMOS33} [get_ports {sw_pin[5]}];
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports {sw_pin[4]}];
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports {sw_pin[3]}];
set_property -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS33} [get_ports {sw_pin[2]}];
set_property -dict {PACKAGE_PIN P4 IOSTANDARD LVCMOS33} [get_ports {sw_pin[1]}];
