
########################
# Physical Constraints #
########################

# ZedBoard Switches

# Smoothing and Morphology Selection
# SW0
set_property PACKAGE_PIN F22 [get_ports smth_sel]
set_property IOSTANDARD LVCMOS25 [get_ports smth_sel]
# SW1
set_property PACKAGE_PIN G22 [get_ports morph_sel]
set_property IOSTANDARD LVCMOS25 [get_ports morph_sel]

# Output Source Selection
# SW2, SW3, SW4
set_property PACKAGE_PIN H22 [get_ports {output_source[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {output_source[0]}]

set_property PACKAGE_PIN F21 [get_ports {output_source[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {output_source[1]}]

set_property PACKAGE_PIN H19 [get_ports {output_source[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {output_source[2]}]

set_property PACKAGE_PIN M15 [get_ports {output_source[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {output_source[3]}]

# I2C Chain on FMC-IMAGEON
set_property PACKAGE_PIN J20 [get_ports fmc_imageon_iic_scl_io]
set_property IOSTANDARD LVCMOS25 [get_ports fmc_imageon_iic_scl_io]
set_property SLEW SLOW [get_ports fmc_imageon_iic_scl_io]
set_property DRIVE 8 [get_ports fmc_imageon_iic_scl_io]

set_property PACKAGE_PIN K21 [get_ports fmc_imageon_iic_sda_io]
set_property IOSTANDARD LVCMOS25 [get_ports fmc_imageon_iic_sda_io]
set_property SLEW SLOW [get_ports fmc_imageon_iic_sda_io]
set_property DRIVE 8 [get_ports fmc_imageon_iic_sda_io]

set_property PACKAGE_PIN N20 [get_ports {fmc_imageon_iic_rst_n[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_imageon_iic_rst_n[0]}]
set_property SLEW SLOW [get_ports {fmc_imageon_iic_rst_n[0]}]
set_property DRIVE 8 [get_ports {fmc_imageon_iic_rst_n[0]}]


# HDMI Output (ADV7511) on FMC-IMAGEON
set_property PACKAGE_PIN C19 [get_ports hdmio_io_clk]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_clk]

set_property PACKAGE_PIN G19 [get_ports {hdmio_io_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[0]}]

set_property PACKAGE_PIN G16 [get_ports {hdmio_io_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[1]}]

set_property PACKAGE_PIN D20 [get_ports {hdmio_io_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[2]}]

set_property PACKAGE_PIN B20 [get_ports {hdmio_io_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[3]}]

set_property PACKAGE_PIN G15 [get_ports {hdmio_io_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[4]}]

set_property PACKAGE_PIN G21 [get_ports {hdmio_io_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[5]}]

set_property PACKAGE_PIN B19 [get_ports {hdmio_io_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[6]}]

set_property PACKAGE_PIN G20 [get_ports {hdmio_io_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[7]}]

set_property PACKAGE_PIN C22 [get_ports {hdmio_io_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[8]}]

set_property PACKAGE_PIN D22 [get_ports {hdmio_io_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[9]}]

set_property PACKAGE_PIN E20 [get_ports {hdmio_io_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[10]}]

set_property PACKAGE_PIN D15 [get_ports {hdmio_io_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[11]}]

set_property PACKAGE_PIN E19 [get_ports {hdmio_io_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[12]}]

set_property PACKAGE_PIN F19 [get_ports {hdmio_io_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[13]}]

set_property PACKAGE_PIN C20 [get_ports {hdmio_io_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[14]}]

set_property PACKAGE_PIN E15 [get_ports {hdmio_io_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[15]}]

set_property PACKAGE_PIN A18 [get_ports hdmio_io_spdif]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_spdif]

# HDMI Input (ADV7611) on FMC-IMAGEON
set_property PACKAGE_PIN D18 [get_ports hdmii_clk]
set_property IOSTANDARD LVCMOS25 [get_ports hdmii_clk]

set_property PACKAGE_PIN A22 [get_ports {hdmii_io_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[0]}]

set_property PACKAGE_PIN A21 [get_ports {hdmii_io_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[1]}]

set_property PACKAGE_PIN B22 [get_ports {hdmii_io_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[2]}]

set_property PACKAGE_PIN B21 [get_ports {hdmii_io_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[3]}]

set_property PACKAGE_PIN B15 [get_ports {hdmii_io_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[4]}]

set_property PACKAGE_PIN C15 [get_ports {hdmii_io_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[5]}]

set_property PACKAGE_PIN B17 [get_ports {hdmii_io_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[6]}]

set_property PACKAGE_PIN B16 [get_ports {hdmii_io_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[7]}]

set_property PACKAGE_PIN A17 [get_ports {hdmii_io_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[8]}]

set_property PACKAGE_PIN A16 [get_ports {hdmii_io_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[9]}]

set_property PACKAGE_PIN C18 [get_ports {hdmii_io_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[10]}]

set_property PACKAGE_PIN D21 [get_ports {hdmii_io_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[11]}]

set_property PACKAGE_PIN E18 [get_ports {hdmii_io_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[12]}]

set_property PACKAGE_PIN C17 [get_ports {hdmii_io_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[13]}]

set_property PACKAGE_PIN E21 [get_ports {hdmii_io_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[14]}]

set_property PACKAGE_PIN F18 [get_ports {hdmii_io_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[15]}]

set_property PACKAGE_PIN A19 [get_ports hdmii_io_spdif]
set_property IOSTANDARD LVCMOS25 [get_ports hdmii_io_spdif]

##################
# Primary Clocks #
##################

# The following constraints are already created by the "ZYNQ7 Processing System" core
#create_clock -period 20.000 -name clk_fpga_0 [get_nets -hierarchical FCLK_CLK0]
#create_clock -period 7.000 -name clk_fpga_1 [get_nets -hierarchical FCLK_CLK1]

create_clock -period 10.00000000000000000 -name hdmii_clk [get_ports hdmii_clk]

set_clock_groups -asynchronous -group [get_clocks clk_fpga_0] -group [get_clocks clk_fpga_1] -group [get_clocks -include_generated_clocks hdmii_clk]

create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_FCLK_CLK0]]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[0]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[1]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[2]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[3]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[4]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[5]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[6]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[7]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[8]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[9]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[10]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[11]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[12]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[13]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[14]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[15]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[16]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[17]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[18]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[19]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[20]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[21]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[22]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[23]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[24]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[25]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[26]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[27]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[28]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[29]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[30]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WDATA[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[0]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[1]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[2]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[3]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[4]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[5]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[6]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[7]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[8]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[9]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[10]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[11]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[12]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[13]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[14]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[15]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[16]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[17]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[18]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[19]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[20]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[21]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[22]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[23]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[24]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[25]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[26]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[27]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[28]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[29]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[30]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RDATA[31]}]]
create_debug_port u_ila_0 probe
set_property port_width 9 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[0]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[1]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[2]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[3]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[4]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[5]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[6]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[7]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWADDR[8]}]]
create_debug_port u_ila_0 probe
set_property port_width 9 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[0]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[1]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[2]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[3]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[4]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[5]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[6]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[7]} {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARADDR[8]}]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARREADY]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_ARVALID]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWREADY]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_AWVALID]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_BREADY]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_BVALID]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RREADY]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RVALID]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WREADY]]
create_debug_port u_ila_0 probe
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_WVALID]]
set_property MARK_DEBUG false [get_nets {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_BRESP[1]}]
set_property MARK_DEBUG false [get_nets {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_BRESP[0]}]
set_property MARK_DEBUG false [get_nets {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RRESP[1]}]
set_property MARK_DEBUG false [get_nets {hdmi_directpassthr_woi_i/processing_system7_0_axi_periph_M02_AXI_RRESP[0]}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets u_ila_0_processing_system7_0_FCLK_CLK0]
