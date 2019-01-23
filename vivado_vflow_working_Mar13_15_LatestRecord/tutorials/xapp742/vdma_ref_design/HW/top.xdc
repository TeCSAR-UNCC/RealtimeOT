# (c) Copyright 2012 Xilinx, Inc. All rights reserved.
#
# This file contains confidential and proprietary information
# of Xilinx, Inc. and is protected under U.S. and 
# international copyright and other intellectual property
# laws.
#
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# Xilinx, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) Xilinx shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the
# possibility of the same.
#
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of Xilinx products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
#
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
#--------------------------------------------------------------------------
#
# KC705 XDC constraints for IPI Example Design
#

set_property LOC AD11 [ get_ports CLK_IN1_N]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports CLK_IN1_N]

set_property LOC AD12 [ get_ports CLK_IN1_P]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports CLK_IN1_P]

create_clock -period "5" -name CLK_IN1_Pin [get_ports CLK_IN1_P]

set_property LOC K29 [ get_ports EXT_USR_CLK_N]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports EXT_USR_CLK_N]

set_property LOC K28 [ get_ports EXT_USR_CLK_P]
set_property IOSTANDARD DIFF_SSTL15 [ get_ports EXT_USR_CLK_P]

create_clock -period "6.41" -name vid_clk_in [get_ports EXT_USR_CLK_P]

set_property LOC AB7 [ get_ports sys_rst]
set_property IOSTANDARD LVCMOS15 [ get_ports sys_rst]

set_property LOC M19 [ get_ports uart_rxd]
set_property IOSTANDARD LVCMOS25 [ get_ports uart_rxd]

set_property LOC K24 [ get_ports uart_txd]
set_property IOSTANDARD LVCMOS25 [ get_ports uart_txd]

#set_property LOC P24 [ get_ports SPI_0_io0_io]
#set_property IOSTANDARD LVCMOS25 [ get_ports SPI_0_io0_io]
#
#set_property LOC R25 [ get_ports SPI_0_io1_io]
#set_property IOSTANDARD LVCMOS25 [ get_ports SPI_0_io1_io]
#
#set_property LOC R20 [ get_ports SPI_0_io2_io]
#set_property IOSTANDARD LVCMOS25 [ get_ports SPI_0_io2_io]
#
#set_property LOC R21 [ get_ports SPI_0_io3_io]
#set_property IOSTANDARD LVCMOS25 [ get_ports SPI_0_io3_io]
#
#set_property LOC U19 [ get_ports SPI_0_ss_io]
#set_property IOSTANDARD LVCMOS25 [ get_ports SPI_0_ss_io]

set_property slave_banks {32 34} [get_iobanks 33 ]


##--------------------------- Kc705 HDMI OUT pins -------------------------------------------
set_property IOSTANDARD LVCMOS25 [get_ports ext_hdmi*]

set_property LOC K18 [get_ports ext_hdmi_clk]
set_property LOC H17 [get_ports ext_hdmi_de]
set_property LOC J18 [get_ports ext_hdmi_hsync]
set_property LOC H20 [get_ports ext_hdmi_vsync]
#set_property LOC               R15 [ get_ports "HDMI_O_spdif_pin"]
## ADV7511 video input mode YCbCr 4:2:2, separate syncs, 16 bpp (ID = 1 / style 1)
set_property LOC B23 [get_ports {ext_hdmi_data[0]}]
set_property LOC A23 [get_ports {ext_hdmi_data[1]}]
set_property LOC E23 [get_ports {ext_hdmi_data[2]}]
set_property LOC D23 [get_ports {ext_hdmi_data[3]}]
set_property LOC F25 [get_ports {ext_hdmi_data[4]}]
set_property LOC E25 [get_ports {ext_hdmi_data[5]}]
set_property LOC E24 [get_ports {ext_hdmi_data[6]}]
set_property LOC D24 [get_ports {ext_hdmi_data[7]}]
# multiplexed chroma pins (Cr/Cb)
set_property LOC  F26 [get_ports {ext_hdmi_data[8]}]
set_property LOC  E26 [get_ports {ext_hdmi_data[9]}]
set_property LOC  G23 [get_ports {ext_hdmi_data[10]}]
set_property LOC  G24 [get_ports {ext_hdmi_data[11]}]
set_property LOC  J19 [get_ports {ext_hdmi_data[12]}]
set_property LOC  H19 [get_ports {ext_hdmi_data[13]}]
set_property LOC  L17 [get_ports {ext_hdmi_data[14]}]
set_property LOC  L18 [get_ports {ext_hdmi_data[15]}]

set_property IOSTANDARD LVCMOS25 [get_ports iic_*]
set_property SLEW SLOW [get_ports iic_*]
set_property LOC  K21 [get_ports iic_main_scl_io]
set_property LOC  L21 [get_ports iic_main_sda_io]


######### Timing constraints

 set vid_clk   [get_clocks -filter {NAME=~*vid**}]
 set liteclk   [get_clocks -filter {NAME=~*clk_out1*}]


  set_max_delay -from [all_registers -clock [get_clocks -filter {NAME=~*vid*}]] -to [all_registers -clock [get_clocks -filter {NAME=~*clk_out1*}]] -datapath_only [get_property PERIOD $liteclk]
  set_max_delay -from [all_registers -clock [get_clocks -filter {NAME=~*clk_out1*}]] -to [all_registers -clock [get_clocks -filter {NAME=~*vid*}]] -datapath_only [get_property PERIOD $vid_clk]


