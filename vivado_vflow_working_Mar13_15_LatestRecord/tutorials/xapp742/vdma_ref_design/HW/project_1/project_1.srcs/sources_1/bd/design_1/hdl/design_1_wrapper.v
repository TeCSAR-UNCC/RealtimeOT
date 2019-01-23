`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK_IN1_N,
    CLK_IN1_P,
    DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_cs_n,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    EXT_USR_CLK_N,
    EXT_USR_CLK_P,
    ext_hdmi_clk,
    ext_hdmi_data,
    ext_hdmi_de,
    ext_hdmi_hsync,
    ext_hdmi_vsync,
    iic_main_scl_io,
    iic_main_sda_io,
    sys_rst,
    uart_rxd,
    uart_txd);
  input CLK_IN1_N;
  input CLK_IN1_P;
  output [13:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [0:0]DDR3_cs_n;
  output [7:0]DDR3_dm;
  inout [63:0]DDR3_dq;
  inout [7:0]DDR3_dqs_n;
  inout [7:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  input [0:0]EXT_USR_CLK_N;
  input [0:0]EXT_USR_CLK_P;
  output ext_hdmi_clk;
  output [15:0]ext_hdmi_data;
  output ext_hdmi_de;
  output ext_hdmi_hsync;
  output ext_hdmi_vsync;
  inout iic_main_scl_io;
  inout iic_main_sda_io;
  input sys_rst;
  input uart_rxd;
  output uart_txd;

  wire CLK_IN1_N;
  wire CLK_IN1_P;
  wire [13:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [0:0]DDR3_cs_n;
  wire [7:0]DDR3_dm;
  wire [63:0]DDR3_dq;
  wire [7:0]DDR3_dqs_n;
  wire [7:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire [0:0]EXT_USR_CLK_N;
  wire [0:0]EXT_USR_CLK_P;
  wire ext_hdmi_clk;
  wire [15:0]ext_hdmi_data;
  wire ext_hdmi_de;
  wire ext_hdmi_hsync;
  wire ext_hdmi_vsync;
  wire iic_main_scl_i;
  wire iic_main_scl_io;
  wire iic_main_scl_o;
  wire iic_main_scl_t;
  wire iic_main_sda_i;
  wire iic_main_sda_io;
  wire iic_main_sda_o;
  wire iic_main_sda_t;
  wire sys_rst;
  wire uart_rxd;
  wire uart_txd;

design_1 design_1_i
       (.CLK_IN1_N(CLK_IN1_N),
        .CLK_IN1_P(CLK_IN1_P),
        .DDR3_addr(DDR3_addr),
        .DDR3_ba(DDR3_ba),
        .DDR3_cas_n(DDR3_cas_n),
        .DDR3_ck_n(DDR3_ck_n),
        .DDR3_ck_p(DDR3_ck_p),
        .DDR3_cke(DDR3_cke),
        .DDR3_cs_n(DDR3_cs_n),
        .DDR3_dm(DDR3_dm),
        .DDR3_dq(DDR3_dq),
        .DDR3_dqs_n(DDR3_dqs_n),
        .DDR3_dqs_p(DDR3_dqs_p),
        .DDR3_odt(DDR3_odt),
        .DDR3_ras_n(DDR3_ras_n),
        .DDR3_reset_n(DDR3_reset_n),
        .DDR3_we_n(DDR3_we_n),
        .EXT_USR_CLK_N(EXT_USR_CLK_N),
        .EXT_USR_CLK_P(EXT_USR_CLK_P),
        .IIC_MAIN_scl_i(iic_main_scl_i),
        .IIC_MAIN_scl_o(iic_main_scl_o),
        .IIC_MAIN_scl_t(iic_main_scl_t),
        .IIC_MAIN_sda_i(iic_main_sda_i),
        .IIC_MAIN_sda_o(iic_main_sda_o),
        .IIC_MAIN_sda_t(iic_main_sda_t),
        .ext_hdmi_clk(ext_hdmi_clk),
        .ext_hdmi_data(ext_hdmi_data),
        .ext_hdmi_de(ext_hdmi_de),
        .ext_hdmi_hsync(ext_hdmi_hsync),
        .ext_hdmi_vsync(ext_hdmi_vsync),
        .sys_rst(sys_rst),
        .uart_rxd(uart_rxd),
        .uart_txd(uart_txd));
IOBUF iic_main_scl_iobuf
       (.I(iic_main_scl_o),
        .IO(iic_main_scl_io),
        .O(iic_main_scl_i),
        .T(iic_main_scl_t));
IOBUF iic_main_sda_iobuf
       (.I(iic_main_sda_o),
        .IO(iic_main_sda_io),
        .O(iic_main_sda_i),
        .T(iic_main_sda_t));
endmodule
