#############
# I/O Delay #
#############

#  2ns of output delay for HDMI output
set_output_delay -clock hdmii_clk -min 2.000 [get_ports hdmio_io_data*]

########################
# Physical Constraints #
########################

# 100MHz Oscillator on KC705
set_property PACKAGE_PIN AD12 [get_ports sys_diff_clock_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_diff_clock_clk_p]

set_property PACKAGE_PIN AD11 [get_ports sys_diff_clock_clk_n]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_diff_clock_clk_n]

# RESET on KC705
set_property PACKAGE_PIN AB7  [get_ports {reset}]
set_property IOSTANDARD LVCMOS15 [get_ports {reset}]

# UART on KC705
set_property PACKAGE_PIN M19 [get_ports {RS232_Uart_rxd}]
set_property IOSTANDARD LVCMOS25 [get_ports {RS232_Uart_rxd}]

set_property PACKAGE_PIN K24 [get_ports {RS232_Uart_txd}]
set_property IOSTANDARD LVCMOS25 [get_ports {RS232_Uart_txd}]

# LEDs on KC705
set_property PACKAGE_PIN AB8  [get_ports {LED_8Bits_tri_o[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED_8Bits_tri_o[0]}]

set_property PACKAGE_PIN AA8  [get_ports {LED_8Bits_tri_o[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED_8Bits_tri_o[1]}]

set_property PACKAGE_PIN AC9  [get_ports {LED_8Bits_tri_o[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED_8Bits_tri_o[2]}]

set_property PACKAGE_PIN AB9  [get_ports {LED_8Bits_tri_o[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {LED_8Bits_tri_o[3]}]

set_property PACKAGE_PIN AE26  [get_ports {LED_8Bits_tri_o[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED_8Bits_tri_o[4]}]

set_property PACKAGE_PIN G19  [get_ports {LED_8Bits_tri_o[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED_8Bits_tri_o[5]}]

set_property PACKAGE_PIN E18  [get_ports {LED_8Bits_tri_o[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED_8Bits_tri_o[6]}]

set_property PACKAGE_PIN F16  [get_ports {LED_8Bits_tri_o[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {LED_8Bits_tri_o[7]}]


# I2C Chain on KC705
#set_property PACKAGE_PIN K21 [get_ports {IIC_MAIN_scl_io}]
#set_property IOSTANDARD LVCMOS25 [get_ports {IIC_MAIN_scl_io}]
#set_property SLEW SLOW [get_ports {IIC_MAIN_scl_io}]
#set_property DRIVE 8 [get_ports {IIC_MAIN_scl_io}]
#
#set_property PACKAGE_PIN L21 [get_ports {IIC_MAIN_sda_io}]
#set_property IOSTANDARD LVCMOS25 [get_ports {IIC_MAIN_sda_io}]
#set_property SLEW SLOW [get_ports {IIC_MAIN_sda_io}]
#set_property DRIVE 8 [get_ports {IIC_MAIN_sda_io}]

# I2C Chain on FMC-IMAGEON
set_property PACKAGE_PIN AC22 [get_ports {fmc_imageon_iic_scl_io}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_imageon_iic_scl_io}]
set_property SLEW SLOW [get_ports {fmc_imageon_iic_scl_io}]
set_property DRIVE 8 [get_ports {fmc_imageon_iic_scl_io}]

set_property PACKAGE_PIN AD22 [get_ports {fmc_imageon_iic_sda_io}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_imageon_iic_sda_io}]
set_property SLEW SLOW [get_ports {fmc_imageon_iic_sda_io}]
set_property DRIVE 8 [get_ports {fmc_imageon_iic_sda_io}]

set_property PACKAGE_PIN AF23 [get_ports {fmc_imageon_iic_rst_n}]
set_property IOSTANDARD LVCMOS25 [get_ports {fmc_imageon_iic_rst_n}]
set_property SLEW SLOW [get_ports {fmc_imageon_iic_rst_n}]
set_property DRIVE 8 [get_ports {fmc_imageon_iic_rst_n}]


# HDMI output (ADV7511) on FMC-IMAGEON
set_property PACKAGE_PIN AH29 [get_ports hdmio_io_clk]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_clk]

set_property PACKAGE_PIN AD26  [get_ports {hdmio_io_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[0]}]

set_property PACKAGE_PIN AC26  [get_ports {hdmio_io_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[1]}]

set_property PACKAGE_PIN AG28 [get_ports {hdmio_io_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[2]}]

set_property PACKAGE_PIN AH27  [get_ports {hdmio_io_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[3]}]

set_property PACKAGE_PIN AG27  [get_ports {hdmio_io_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[4]}]

set_property PACKAGE_PIN AK28 [get_ports {hdmio_io_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[5]}]

set_property PACKAGE_PIN AD28  [get_ports {hdmio_io_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[6]}]

set_property PACKAGE_PIN AH26  [get_ports {hdmio_io_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[7]}]

set_property PACKAGE_PIN AJ27  [get_ports {hdmio_io_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[8]}]

set_property PACKAGE_PIN AK26   [get_ports {hdmio_io_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[9]}]

set_property PACKAGE_PIN AD27  [get_ports {hdmio_io_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[10]}]

set_property PACKAGE_PIN AC27  [get_ports {hdmio_io_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[11]}]

set_property PACKAGE_PIN AJ26  [get_ports {hdmio_io_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[12]}]

set_property PACKAGE_PIN AF27  [get_ports {hdmio_io_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[13]}]

set_property PACKAGE_PIN AB27  [get_ports {hdmio_io_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[14]}]

set_property PACKAGE_PIN AF26 [get_ports {hdmio_io_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmio_io_data[15]}]

set_property PACKAGE_PIN AG30 [get_ports hdmio_io_spdif]
set_property IOSTANDARD LVCMOS25 [get_ports hdmio_io_spdif]

# HDMI Input (ADV7611) on FMC-IMAGEON
set_property PACKAGE_PIN AG29 [get_ports hdmii_clk]
set_property IOSTANDARD LVCMOS25 [get_ports hdmii_clk]

set_property PACKAGE_PIN AF30  [get_ports {hdmii_io_data[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[0]}]

set_property PACKAGE_PIN AE30  [get_ports {hdmii_io_data[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[1]}]

set_property PACKAGE_PIN AF28 [get_ports {hdmii_io_data[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[2]}]

set_property PACKAGE_PIN AJ29  [get_ports {hdmii_io_data[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[3]}]

set_property PACKAGE_PIN AK30  [get_ports {hdmii_io_data[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[4]}]

set_property PACKAGE_PIN AE28 [get_ports {hdmii_io_data[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[5]}]

set_property PACKAGE_PIN AJ28  [get_ports {hdmii_io_data[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[6]}]

set_property PACKAGE_PIN AK29  [get_ports {hdmii_io_data[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[7]}]

set_property PACKAGE_PIN AA30  [get_ports {hdmii_io_data[8]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[8]}]

set_property PACKAGE_PIN Y30   [get_ports {hdmii_io_data[9]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[9]}]

set_property PACKAGE_PIN AC30  [get_ports {hdmii_io_data[10]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[10]}]

set_property PACKAGE_PIN AC29  [get_ports {hdmii_io_data[11]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[11]}]

set_property PACKAGE_PIN AB30  [get_ports {hdmii_io_data[12]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[12]}]

set_property PACKAGE_PIN AB29  [get_ports {hdmii_io_data[13]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[13]}]

set_property PACKAGE_PIN AE29  [get_ports {hdmii_io_data[14]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[14]}]

set_property PACKAGE_PIN AD29 [get_ports {hdmii_io_data[15]}]
set_property IOSTANDARD LVCMOS25 [get_ports {hdmii_io_data[15]}]

set_property PACKAGE_PIN AH30 [get_ports hdmii_io_spdif]
set_property IOSTANDARD LVCMOS25 [get_ports hdmii_io_spdif]


##################
# Primary Clocks #
##################

# Differential input clock coming from external oscillator
# Constrained to 100
create_clock -period 10.000 -name sys_diff_clock_clk [get_ports sys_diff_clock_clk_p]

# Single-ended input clock coming from external video source via FMC-IMAGEON
# Constrained to 148.5MHz (1080p60 video resolution)
create_clock -period 6.734 -name hdmii_clk [get_ports hdmii_clk]


set_clock_groups -asynchronous -group [get_clocks -include_generated_clocks "sys_diff_clock_clk" ] -group [get_clocks -include_generated_clocks "hdmii_clk" ]
