//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.2 (lin64) Build 1909853 Thu Jun 15 18:39:10 MDT 2017
//Date        : Tue Apr 24 16:27:47 2018
//Host        : work1-station running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target hdmi_directpassthr_woi.bd
//Design      : hdmi_directpassthr_woi
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module bge_unit_imp_1TZLT3B
   (FG_THRESHOLD,
    LEARNING_FACTOR,
    MATCH_THRESHOLD,
    M_AXI_MM2S_araddr,
    M_AXI_MM2S_arburst,
    M_AXI_MM2S_arcache,
    M_AXI_MM2S_arlen,
    M_AXI_MM2S_arprot,
    M_AXI_MM2S_arready,
    M_AXI_MM2S_arsize,
    M_AXI_MM2S_arvalid,
    M_AXI_MM2S_rdata,
    M_AXI_MM2S_rlast,
    M_AXI_MM2S_rready,
    M_AXI_MM2S_rresp,
    M_AXI_MM2S_rvalid,
    M_AXI_S2MM_awaddr,
    M_AXI_S2MM_awburst,
    M_AXI_S2MM_awcache,
    M_AXI_S2MM_awlen,
    M_AXI_S2MM_awprot,
    M_AXI_S2MM_awready,
    M_AXI_S2MM_awsize,
    M_AXI_S2MM_awvalid,
    M_AXI_S2MM_bready,
    M_AXI_S2MM_bresp,
    M_AXI_S2MM_bvalid,
    M_AXI_S2MM_wdata,
    M_AXI_S2MM_wlast,
    M_AXI_S2MM_wready,
    M_AXI_S2MM_wstrb,
    M_AXI_S2MM_wvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    axi_clk,
    axi_lite_clk,
    axi_resetn,
    axis_overflow,
    axis_overflow1,
    axis_overflow2,
    axis_underflow,
    axis_underflow1,
    axis_underflow2,
    grayscale_pixel_in,
    grayscale_pixel_out,
    hdmi_clk,
    is_fg,
    system_reset,
    system_reset_n,
    window_enable,
    window_enable_out);
  input [15:0]FG_THRESHOLD;
  input [15:0]LEARNING_FACTOR;
  input [7:0]MATCH_THRESHOLD;
  output [31:0]M_AXI_MM2S_araddr;
  output [1:0]M_AXI_MM2S_arburst;
  output [3:0]M_AXI_MM2S_arcache;
  output [7:0]M_AXI_MM2S_arlen;
  output [2:0]M_AXI_MM2S_arprot;
  input [0:0]M_AXI_MM2S_arready;
  output [2:0]M_AXI_MM2S_arsize;
  output [0:0]M_AXI_MM2S_arvalid;
  input [127:0]M_AXI_MM2S_rdata;
  input [0:0]M_AXI_MM2S_rlast;
  output [0:0]M_AXI_MM2S_rready;
  input [1:0]M_AXI_MM2S_rresp;
  input [0:0]M_AXI_MM2S_rvalid;
  output [31:0]M_AXI_S2MM_awaddr;
  output [1:0]M_AXI_S2MM_awburst;
  output [3:0]M_AXI_S2MM_awcache;
  output [7:0]M_AXI_S2MM_awlen;
  output [2:0]M_AXI_S2MM_awprot;
  input [0:0]M_AXI_S2MM_awready;
  output [2:0]M_AXI_S2MM_awsize;
  output [0:0]M_AXI_S2MM_awvalid;
  output [0:0]M_AXI_S2MM_bready;
  input [1:0]M_AXI_S2MM_bresp;
  input [0:0]M_AXI_S2MM_bvalid;
  output [127:0]M_AXI_S2MM_wdata;
  output [0:0]M_AXI_S2MM_wlast;
  input [0:0]M_AXI_S2MM_wready;
  output [15:0]M_AXI_S2MM_wstrb;
  output [0:0]M_AXI_S2MM_wvalid;
  input [31:0]S_AXI_LITE_araddr;
  output [0:0]S_AXI_LITE_arready;
  input [0:0]S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output [0:0]S_AXI_LITE_awready;
  input [0:0]S_AXI_LITE_awvalid;
  input [0:0]S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output [0:0]S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input [0:0]S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output [0:0]S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output [0:0]S_AXI_LITE_wready;
  input [0:0]S_AXI_LITE_wvalid;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;
  input axi_clk;
  input axi_lite_clk;
  input [0:0]axi_resetn;
  output axis_overflow;
  output axis_overflow1;
  output axis_overflow2;
  output axis_underflow;
  output axis_underflow1;
  output axis_underflow2;
  input [7:0]grayscale_pixel_in;
  output [7:0]grayscale_pixel_out;
  input hdmi_clk;
  output is_fg;
  input system_reset;
  input system_reset_n;
  input [0:0]window_enable;
  output window_enable_out;

  wire [31:0]Conn1_ARADDR;
  wire [2:0]Conn1_ARPROT;
  wire Conn1_ARREADY;
  wire [0:0]Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire [2:0]Conn1_AWPROT;
  wire Conn1_AWREADY;
  wire [0:0]Conn1_AWVALID;
  wire [0:0]Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire [0:0]Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire [0:0]Conn1_WVALID;
  wire [31:0]MixtureOfGaussians_0_gp_out;
  wire MixtureOfGaussians_0_is_fg;
  wire [31:0]MixtureOfGaussians_0_mean1_up;
  wire [31:0]MixtureOfGaussians_0_mean2_up;
  wire [31:0]MixtureOfGaussians_0_mean3_up;
  wire [31:0]MixtureOfGaussians_0_sd1_up;
  wire [31:0]MixtureOfGaussians_0_sd2_up;
  wire [31:0]MixtureOfGaussians_0_sd3_up;
  wire [31:0]MixtureOfGaussians_0_w1_up;
  wire [31:0]MixtureOfGaussians_0_w2_up;
  wire MixtureOfGuassians_0_window_en_out;
  wire axi_lite_clk_1;
  wire [0:0]axi_resetn_1;
  wire clk_1;
  wire [31:0]mean1_concat_dout;
  wire [31:0]mean2_selection_dout;
  wire [31:0]mean3_selection_dout;
  wire [0:0]mog_async_fifo_rst_aresetn;
  wire [31:0]mog_params_extraction_dout;
  wire [127:0]mog_params_packing_dout;
  wire mog_params_read_async_fifo_axis_overflow;
  wire mog_params_read_async_fifo_axis_underflow;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]mog_params_read_async_fifo_m_axis_tkeep;
  wire mog_params_read_async_fifo_m_axis_tlast;
  wire [0:0]mog_params_read_async_fifo_m_axis_tuser;
  wire mog_params_read_async_fifo_m_axis_tvalid;
  wire mog_params_read_async_fifo_s_axis_tready;
  wire [127:0]mog_params_write_async_fifo_M_AXIS_TDATA;
  wire [15:0]mog_params_write_async_fifo_M_AXIS_TKEEP;
  wire mog_params_write_async_fifo_M_AXIS_TLAST;
  wire mog_params_write_async_fifo_M_AXIS_TREADY;
  wire [0:0]mog_params_write_async_fifo_M_AXIS_TUSER;
  wire mog_params_write_async_fifo_M_AXIS_TVALID;
  wire mog_params_write_async_fifo_axis_overflow;
  wire mog_params_write_async_fifo_axis_underflow;
  wire mog_params_write_async_fifo_s_axis_tready;
  wire [31:0]mog_vdma_M_AXI_MM2S_ARADDR;
  wire [1:0]mog_vdma_M_AXI_MM2S_ARBURST;
  wire [3:0]mog_vdma_M_AXI_MM2S_ARCACHE;
  wire [7:0]mog_vdma_M_AXI_MM2S_ARLEN;
  wire [2:0]mog_vdma_M_AXI_MM2S_ARPROT;
  wire [0:0]mog_vdma_M_AXI_MM2S_ARREADY;
  wire [2:0]mog_vdma_M_AXI_MM2S_ARSIZE;
  wire mog_vdma_M_AXI_MM2S_ARVALID;
  wire [127:0]mog_vdma_M_AXI_MM2S_RDATA;
  wire [0:0]mog_vdma_M_AXI_MM2S_RLAST;
  wire mog_vdma_M_AXI_MM2S_RREADY;
  wire [1:0]mog_vdma_M_AXI_MM2S_RRESP;
  wire [0:0]mog_vdma_M_AXI_MM2S_RVALID;
  wire [31:0]mog_vdma_M_AXI_S2MM_AWADDR;
  wire [1:0]mog_vdma_M_AXI_S2MM_AWBURST;
  wire [3:0]mog_vdma_M_AXI_S2MM_AWCACHE;
  wire [7:0]mog_vdma_M_AXI_S2MM_AWLEN;
  wire [2:0]mog_vdma_M_AXI_S2MM_AWPROT;
  wire [0:0]mog_vdma_M_AXI_S2MM_AWREADY;
  wire [2:0]mog_vdma_M_AXI_S2MM_AWSIZE;
  wire mog_vdma_M_AXI_S2MM_AWVALID;
  wire mog_vdma_M_AXI_S2MM_BREADY;
  wire [1:0]mog_vdma_M_AXI_S2MM_BRESP;
  wire [0:0]mog_vdma_M_AXI_S2MM_BVALID;
  wire [127:0]mog_vdma_M_AXI_S2MM_WDATA;
  wire mog_vdma_M_AXI_S2MM_WLAST;
  wire [0:0]mog_vdma_M_AXI_S2MM_WREADY;
  wire [15:0]mog_vdma_M_AXI_S2MM_WSTRB;
  wire mog_vdma_M_AXI_S2MM_WVALID;
  wire [127:0]mog_vdma_m_axis_mm2s_tdata;
  wire [15:0]mog_vdma_m_axis_mm2s_tkeep;
  wire mog_vdma_m_axis_mm2s_tlast;
  wire [0:0]mog_vdma_m_axis_mm2s_tuser;
  wire mog_vdma_m_axis_mm2s_tvalid;
  wire [7:0]pipe_in1_1;
  wire [15:0]pipeline_registers_1_pipe_out;
  wire processing_system7_0_FCLK_CLK1;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_ARADDR;
  wire processing_system7_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_AWADDR;
  wire processing_system7_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M02_AXI_BRESP;
  wire processing_system7_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M02_AXI_RRESP;
  wire processing_system7_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_WDATA;
  wire processing_system7_0_axi_periph_M02_AXI_WREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_WVALID;
  wire [31:0]sd1_selection_dout;
  wire [31:0]sd2_selection_dout;
  wire [31:0]sd3_selection_dout;
  wire vbb_system_reset_0_system_reset;
  wire vbb_system_reset_0_system_reset_n;
  wire vdma_sync_signals_passing_axis_overflow;
  wire vdma_sync_signals_passing_axis_underflow;
  wire vdma_sync_signals_passing_m_axis_tlast;
  wire [0:0]vdma_sync_signals_passing_m_axis_tuser;
  wire vdma_sync_signals_passing_m_axis_tvalid;
  wire vdma_sync_signals_passing_s_axis_tready;
  wire [31:0]w1_selection_dout;
  wire [31:0]w2_selection_dout;
  wire [0:0]window_en;
  wire [31:0]xlconcat_0_dout;
  wire [23:0]xlconstant_0_dout;
  wire [7:0]xlslice_0_Dout;
  wire xup_and3_0_y;
  wire xup_and3_1_y;
  wire xup_and3_2_y;
  wire xup_and3_3_y;

  assign Conn1_ARADDR = S_AXI_araddr[31:0];
  assign Conn1_ARPROT = S_AXI_arprot[2:0];
  assign Conn1_ARVALID = S_AXI_arvalid[0];
  assign Conn1_AWADDR = S_AXI_awaddr[31:0];
  assign Conn1_AWPROT = S_AXI_awprot[2:0];
  assign Conn1_AWVALID = S_AXI_awvalid[0];
  assign Conn1_BREADY = S_AXI_bready[0];
  assign Conn1_RREADY = S_AXI_rready[0];
  assign Conn1_WDATA = S_AXI_wdata[31:0];
  assign Conn1_WSTRB = S_AXI_wstrb[3:0];
  assign Conn1_WVALID = S_AXI_wvalid[0];
  assign M_AXI_MM2S_araddr[31:0] = mog_vdma_M_AXI_MM2S_ARADDR;
  assign M_AXI_MM2S_arburst[1:0] = mog_vdma_M_AXI_MM2S_ARBURST;
  assign M_AXI_MM2S_arcache[3:0] = mog_vdma_M_AXI_MM2S_ARCACHE;
  assign M_AXI_MM2S_arlen[7:0] = mog_vdma_M_AXI_MM2S_ARLEN;
  assign M_AXI_MM2S_arprot[2:0] = mog_vdma_M_AXI_MM2S_ARPROT;
  assign M_AXI_MM2S_arsize[2:0] = mog_vdma_M_AXI_MM2S_ARSIZE;
  assign M_AXI_MM2S_arvalid[0] = mog_vdma_M_AXI_MM2S_ARVALID;
  assign M_AXI_MM2S_rready[0] = mog_vdma_M_AXI_MM2S_RREADY;
  assign M_AXI_S2MM_awaddr[31:0] = mog_vdma_M_AXI_S2MM_AWADDR;
  assign M_AXI_S2MM_awburst[1:0] = mog_vdma_M_AXI_S2MM_AWBURST;
  assign M_AXI_S2MM_awcache[3:0] = mog_vdma_M_AXI_S2MM_AWCACHE;
  assign M_AXI_S2MM_awlen[7:0] = mog_vdma_M_AXI_S2MM_AWLEN;
  assign M_AXI_S2MM_awprot[2:0] = mog_vdma_M_AXI_S2MM_AWPROT;
  assign M_AXI_S2MM_awsize[2:0] = mog_vdma_M_AXI_S2MM_AWSIZE;
  assign M_AXI_S2MM_awvalid[0] = mog_vdma_M_AXI_S2MM_AWVALID;
  assign M_AXI_S2MM_bready[0] = mog_vdma_M_AXI_S2MM_BREADY;
  assign M_AXI_S2MM_wdata[127:0] = mog_vdma_M_AXI_S2MM_WDATA;
  assign M_AXI_S2MM_wlast[0] = mog_vdma_M_AXI_S2MM_WLAST;
  assign M_AXI_S2MM_wstrb[15:0] = mog_vdma_M_AXI_S2MM_WSTRB;
  assign M_AXI_S2MM_wvalid[0] = mog_vdma_M_AXI_S2MM_WVALID;
  assign S_AXI_LITE_arready[0] = processing_system7_0_axi_periph_M02_AXI_ARREADY;
  assign S_AXI_LITE_awready[0] = processing_system7_0_axi_periph_M02_AXI_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = processing_system7_0_axi_periph_M02_AXI_BRESP;
  assign S_AXI_LITE_bvalid[0] = processing_system7_0_axi_periph_M02_AXI_BVALID;
  assign S_AXI_LITE_rdata[31:0] = processing_system7_0_axi_periph_M02_AXI_RDATA;
  assign S_AXI_LITE_rresp[1:0] = processing_system7_0_axi_periph_M02_AXI_RRESP;
  assign S_AXI_LITE_rvalid[0] = processing_system7_0_axi_periph_M02_AXI_RVALID;
  assign S_AXI_LITE_wready[0] = processing_system7_0_axi_periph_M02_AXI_WREADY;
  assign S_AXI_arready[0] = Conn1_ARREADY;
  assign S_AXI_awready[0] = Conn1_AWREADY;
  assign S_AXI_bresp[1:0] = Conn1_BRESP;
  assign S_AXI_bvalid[0] = Conn1_BVALID;
  assign S_AXI_rdata[31:0] = Conn1_RDATA;
  assign S_AXI_rresp[1:0] = Conn1_RRESP;
  assign S_AXI_rvalid[0] = Conn1_RVALID;
  assign S_AXI_wready[0] = Conn1_WREADY;
  assign axi_lite_clk_1 = axi_lite_clk;
  assign axi_resetn_1 = axi_resetn[0];
  assign axis_overflow = mog_params_read_async_fifo_axis_overflow;
  assign axis_overflow1 = vdma_sync_signals_passing_axis_overflow;
  assign axis_overflow2 = mog_params_write_async_fifo_axis_overflow;
  assign axis_underflow = mog_params_write_async_fifo_axis_underflow;
  assign axis_underflow1 = mog_params_read_async_fifo_axis_underflow;
  assign axis_underflow2 = vdma_sync_signals_passing_axis_underflow;
  assign clk_1 = hdmi_clk;
  assign grayscale_pixel_out[7:0] = xlslice_0_Dout;
  assign is_fg = MixtureOfGaussians_0_is_fg;
  assign mog_vdma_M_AXI_MM2S_ARREADY = M_AXI_MM2S_arready[0];
  assign mog_vdma_M_AXI_MM2S_RDATA = M_AXI_MM2S_rdata[127:0];
  assign mog_vdma_M_AXI_MM2S_RLAST = M_AXI_MM2S_rlast[0];
  assign mog_vdma_M_AXI_MM2S_RRESP = M_AXI_MM2S_rresp[1:0];
  assign mog_vdma_M_AXI_MM2S_RVALID = M_AXI_MM2S_rvalid[0];
  assign mog_vdma_M_AXI_S2MM_AWREADY = M_AXI_S2MM_awready[0];
  assign mog_vdma_M_AXI_S2MM_BRESP = M_AXI_S2MM_bresp[1:0];
  assign mog_vdma_M_AXI_S2MM_BVALID = M_AXI_S2MM_bvalid[0];
  assign mog_vdma_M_AXI_S2MM_WREADY = M_AXI_S2MM_wready[0];
  assign pipe_in1_1 = grayscale_pixel_in[7:0];
  assign processing_system7_0_FCLK_CLK1 = axi_clk;
  assign processing_system7_0_axi_periph_M02_AXI_ARADDR = S_AXI_LITE_araddr[31:0];
  assign processing_system7_0_axi_periph_M02_AXI_ARVALID = S_AXI_LITE_arvalid[0];
  assign processing_system7_0_axi_periph_M02_AXI_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign processing_system7_0_axi_periph_M02_AXI_AWVALID = S_AXI_LITE_awvalid[0];
  assign processing_system7_0_axi_periph_M02_AXI_BREADY = S_AXI_LITE_bready[0];
  assign processing_system7_0_axi_periph_M02_AXI_RREADY = S_AXI_LITE_rready[0];
  assign processing_system7_0_axi_periph_M02_AXI_WDATA = S_AXI_LITE_wdata[31:0];
  assign processing_system7_0_axi_periph_M02_AXI_WVALID = S_AXI_LITE_wvalid[0];
  assign vbb_system_reset_0_system_reset = system_reset;
  assign vbb_system_reset_0_system_reset_n = system_reset_n;
  assign window_en = window_enable[0];
  assign window_enable_out = MixtureOfGuassians_0_window_en_out;
  hdmi_directpassthr_woi_MixtureOfGaussians_0_0 MixtureOfGaussians_0
       (.clk(clk_1),
        .gp(xlconcat_0_dout),
        .gp_out(MixtureOfGaussians_0_gp_out),
        .is_fg(MixtureOfGaussians_0_is_fg),
        .mean1(mean1_concat_dout),
        .mean1_up(MixtureOfGaussians_0_mean1_up),
        .mean2(mean2_selection_dout),
        .mean2_up(MixtureOfGaussians_0_mean2_up),
        .mean3(mean3_selection_dout),
        .mean3_up(MixtureOfGaussians_0_mean3_up),
        .rst(vbb_system_reset_0_system_reset),
        .s_axi_aclk(axi_lite_clk_1),
        .s_axi_araddr(Conn1_ARADDR[3:0]),
        .s_axi_aresetn(axi_resetn_1),
        .s_axi_arprot(Conn1_ARPROT),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR[3:0]),
        .s_axi_awprot(Conn1_AWPROT),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wstrb(Conn1_WSTRB),
        .s_axi_wvalid(Conn1_WVALID),
        .sd1(sd1_selection_dout),
        .sd1_up(MixtureOfGaussians_0_sd1_up),
        .sd2(sd2_selection_dout),
        .sd2_up(MixtureOfGaussians_0_sd2_up),
        .sd3(sd3_selection_dout),
        .sd3_up(MixtureOfGaussians_0_sd3_up),
        .w1(w1_selection_dout),
        .w1_up(MixtureOfGaussians_0_w1_up),
        .w2(w2_selection_dout),
        .w2_up(MixtureOfGaussians_0_w2_up),
        .w3(mog_params_extraction_dout),
        .window_en(window_en),
        .window_en_out(MixtureOfGuassians_0_window_en_out));
  hdmi_directpassthr_woi_xlconcat_0_5 grayscale8to32
       (.In0(xlconstant_0_dout),
        .In1(pipe_in1_1),
        .dout(xlconcat_0_dout));
  mog_async_fifo_rst_imp_TXCJRR mog_async_fifo_rst
       (.aresetn(mog_async_fifo_rst_aresetn),
        .clk(axi_lite_clk_1),
        .tuser(mog_vdma_m_axis_mm2s_tuser));
  mog_params_extraction_imp_MXK2XH mog_params_extraction
       (.mean1(sd3_selection_dout),
        .mean2(sd1_selection_dout),
        .mean3(mean1_concat_dout),
        .params(mog_params_read_async_fifo_m_axis_tdata),
        .sd1(mean3_selection_dout),
        .sd2(mean2_selection_dout),
        .sd3(sd2_selection_dout),
        .w1(w1_selection_dout),
        .w2(w2_selection_dout),
        .w3(mog_params_extraction_dout));
  mog_params_packing_imp_13GR31Q mog_params_packing
       (.dout(mog_params_packing_dout),
        .mean1_up(MixtureOfGaussians_0_mean1_up),
        .mean2_up(MixtureOfGaussians_0_mean2_up),
        .mean3_up(MixtureOfGaussians_0_mean3_up),
        .sd1_up(MixtureOfGaussians_0_sd1_up),
        .sd2_up(MixtureOfGaussians_0_sd2_up),
        .sd3_up(MixtureOfGaussians_0_sd3_up),
        .w1_up(MixtureOfGaussians_0_w1_up),
        .w2_up(MixtureOfGaussians_0_w2_up));
  hdmi_directpassthr_woi_fifo_generator_0_1 mog_params_read_async_fifo
       (.axis_overflow(mog_params_read_async_fifo_axis_overflow),
        .axis_underflow(mog_params_read_async_fifo_axis_underflow),
        .m_aclk(clk_1),
        .m_axis_tdata(mog_params_read_async_fifo_m_axis_tdata),
        .m_axis_tkeep(mog_params_read_async_fifo_m_axis_tkeep),
        .m_axis_tlast(mog_params_read_async_fifo_m_axis_tlast),
        .m_axis_tready(xup_and3_0_y),
        .m_axis_tuser(mog_params_read_async_fifo_m_axis_tuser),
        .m_axis_tvalid(mog_params_read_async_fifo_m_axis_tvalid),
        .s_aclk(processing_system7_0_FCLK_CLK1),
        .s_aresetn(mog_async_fifo_rst_aresetn),
        .s_axis_tdata(mog_vdma_m_axis_mm2s_tdata),
        .s_axis_tkeep(mog_vdma_m_axis_mm2s_tkeep),
        .s_axis_tlast(mog_vdma_m_axis_mm2s_tlast),
        .s_axis_tready(mog_params_read_async_fifo_s_axis_tready),
        .s_axis_tuser(mog_vdma_m_axis_mm2s_tuser),
        .s_axis_tvalid(mog_vdma_m_axis_mm2s_tvalid));
  hdmi_directpassthr_woi_fifo_generator_0_2 mog_params_write_async_fifo
       (.axis_overflow(mog_params_write_async_fifo_axis_overflow),
        .axis_underflow(mog_params_write_async_fifo_axis_underflow),
        .m_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_tdata(mog_params_write_async_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(mog_params_write_async_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(mog_params_write_async_fifo_M_AXIS_TLAST),
        .m_axis_tready(mog_params_write_async_fifo_M_AXIS_TREADY),
        .m_axis_tuser(mog_params_write_async_fifo_M_AXIS_TUSER),
        .m_axis_tvalid(mog_params_write_async_fifo_M_AXIS_TVALID),
        .s_aclk(clk_1),
        .s_aresetn(mog_async_fifo_rst_aresetn),
        .s_axis_tdata(mog_params_packing_dout),
        .s_axis_tkeep(pipeline_registers_1_pipe_out),
        .s_axis_tlast(vdma_sync_signals_passing_m_axis_tlast),
        .s_axis_tready(mog_params_write_async_fifo_s_axis_tready),
        .s_axis_tuser(vdma_sync_signals_passing_m_axis_tuser),
        .s_axis_tvalid(xup_and3_2_y));
  hdmi_directpassthr_woi_axi_vdma_0_1 mog_vdma
       (.axi_resetn(axi_resetn_1),
        .m_axi_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_mm2s_araddr(mog_vdma_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(mog_vdma_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(mog_vdma_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(mog_vdma_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(mog_vdma_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(mog_vdma_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(mog_vdma_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(mog_vdma_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(mog_vdma_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(mog_vdma_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(mog_vdma_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(mog_vdma_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(mog_vdma_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_s2mm_awaddr(mog_vdma_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(mog_vdma_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(mog_vdma_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(mog_vdma_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(mog_vdma_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(mog_vdma_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(mog_vdma_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(mog_vdma_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(mog_vdma_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(mog_vdma_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(mog_vdma_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(mog_vdma_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(mog_vdma_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(mog_vdma_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(mog_vdma_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(mog_vdma_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_mm2s_tdata(mog_vdma_m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(mog_vdma_m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(mog_vdma_m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(mog_params_read_async_fifo_s_axis_tready),
        .m_axis_mm2s_tuser(mog_vdma_m_axis_mm2s_tuser),
        .m_axis_mm2s_tvalid(mog_vdma_m_axis_mm2s_tvalid),
        .s_axi_lite_aclk(axi_lite_clk_1),
        .s_axi_lite_araddr(processing_system7_0_axi_periph_M02_AXI_ARADDR[8:0]),
        .s_axi_lite_arready(processing_system7_0_axi_periph_M02_AXI_ARREADY),
        .s_axi_lite_arvalid(processing_system7_0_axi_periph_M02_AXI_ARVALID),
        .s_axi_lite_awaddr(processing_system7_0_axi_periph_M02_AXI_AWADDR[8:0]),
        .s_axi_lite_awready(processing_system7_0_axi_periph_M02_AXI_AWREADY),
        .s_axi_lite_awvalid(processing_system7_0_axi_periph_M02_AXI_AWVALID),
        .s_axi_lite_bready(processing_system7_0_axi_periph_M02_AXI_BREADY),
        .s_axi_lite_bresp(processing_system7_0_axi_periph_M02_AXI_BRESP),
        .s_axi_lite_bvalid(processing_system7_0_axi_periph_M02_AXI_BVALID),
        .s_axi_lite_rdata(processing_system7_0_axi_periph_M02_AXI_RDATA),
        .s_axi_lite_rready(processing_system7_0_axi_periph_M02_AXI_RREADY),
        .s_axi_lite_rresp(processing_system7_0_axi_periph_M02_AXI_RRESP),
        .s_axi_lite_rvalid(processing_system7_0_axi_periph_M02_AXI_RVALID),
        .s_axi_lite_wdata(processing_system7_0_axi_periph_M02_AXI_WDATA),
        .s_axi_lite_wready(processing_system7_0_axi_periph_M02_AXI_WREADY),
        .s_axi_lite_wvalid(processing_system7_0_axi_periph_M02_AXI_WVALID),
        .s_axis_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .s_axis_s2mm_tdata(mog_params_write_async_fifo_M_AXIS_TDATA),
        .s_axis_s2mm_tkeep(mog_params_write_async_fifo_M_AXIS_TKEEP),
        .s_axis_s2mm_tlast(mog_params_write_async_fifo_M_AXIS_TLAST),
        .s_axis_s2mm_tready(mog_params_write_async_fifo_M_AXIS_TREADY),
        .s_axis_s2mm_tuser(mog_params_write_async_fifo_M_AXIS_TUSER),
        .s_axis_s2mm_tvalid(mog_params_write_async_fifo_M_AXIS_TVALID));
  hdmi_directpassthr_woi_pipeline_registers_1_2 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(mog_params_read_async_fifo_m_axis_tkeep),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(mog_async_fifo_rst_aresetn));
  hdmi_directpassthr_woi_fifo_generator_0_3 vdma_sync_signals_passing
       (.axis_overflow(vdma_sync_signals_passing_axis_overflow),
        .axis_underflow(vdma_sync_signals_passing_axis_underflow),
        .m_axis_tlast(vdma_sync_signals_passing_m_axis_tlast),
        .m_axis_tready(xup_and3_3_y),
        .m_axis_tuser(vdma_sync_signals_passing_m_axis_tuser),
        .m_axis_tvalid(vdma_sync_signals_passing_m_axis_tvalid),
        .s_aclk(clk_1),
        .s_aresetn(mog_async_fifo_rst_aresetn),
        .s_axis_tlast(mog_params_read_async_fifo_m_axis_tlast),
        .s_axis_tready(vdma_sync_signals_passing_s_axis_tready),
        .s_axis_tuser(mog_params_read_async_fifo_m_axis_tuser),
        .s_axis_tvalid(xup_and3_1_y));
  hdmi_directpassthr_woi_xlslice_0_8 xlslice_0
       (.Din(MixtureOfGaussians_0_gp_out),
        .Dout(xlslice_0_Dout));
  hdmi_directpassthr_woi_xup_and3_0_1 xup_and3_0
       (.a(vdma_sync_signals_passing_s_axis_tready),
        .b(window_en),
        .c(vbb_system_reset_0_system_reset_n),
        .y(xup_and3_0_y));
  hdmi_directpassthr_woi_xup_and3_0_2 xup_and3_1
       (.a(mog_params_read_async_fifo_m_axis_tvalid),
        .b(window_en),
        .c(vbb_system_reset_0_system_reset_n),
        .y(xup_and3_1_y));
  hdmi_directpassthr_woi_xup_and3_1_1 xup_and3_2
       (.a(vdma_sync_signals_passing_m_axis_tvalid),
        .b(vbb_system_reset_0_system_reset_n),
        .c(MixtureOfGuassians_0_window_en_out),
        .y(xup_and3_2_y));
  hdmi_directpassthr_woi_xup_and3_2_0 xup_and3_3
       (.a(MixtureOfGuassians_0_window_en_out),
        .b(vbb_system_reset_0_system_reset_n),
        .c(mog_params_write_async_fifo_s_axis_tready),
        .y(xup_and3_3_y));
  hdmi_directpassthr_woi_xlconstant_0_11 zero24
       (.dout(xlconstant_0_dout));
endmodule

module color_video_pass_fifo_rd_en_imp_XBCM2V
   (clk,
    de_in,
    rd_en,
    reset_n);
  input clk;
  input [0:0]de_in;
  output [0:0]rd_en;
  input reset_n;

  wire [0:0]pipeline_registers_10_pipe_out;
  wire processing_system7_0_FCLK_CLK1;
  wire reset_n_1;
  wire [0:0]video_overlay_unit_m_axis_mm2s_tuser;
  wire xup_or2_2_y;

  assign processing_system7_0_FCLK_CLK1 = clk;
  assign rd_en[0] = pipeline_registers_10_pipe_out;
  assign reset_n_1 = reset_n;
  assign video_overlay_unit_m_axis_mm2s_tuser = de_in[0];
  hdmi_directpassthr_woi_pipeline_registers_10_2 pipeline_registers_10
       (.clk(processing_system7_0_FCLK_CLK1),
        .pipe_in(xup_or2_2_y),
        .pipe_out(pipeline_registers_10_pipe_out),
        .reset_n(reset_n_1));
  hdmi_directpassthr_woi_xup_or2_2_2 xup_or2_2
       (.a(video_overlay_unit_m_axis_mm2s_tuser),
        .b(pipeline_registers_10_pipe_out),
        .y(xup_or2_2_y));
endmodule

module color_video_pass_fifo_wr_en_imp_1QSQ80A
   (clk,
    de_in,
    reset_n,
    wr_en);
  input clk;
  input [0:0]de_in;
  input reset_n;
  output [0:0]wr_en;

  wire [0:0]pipeline_registers_10_pipe_out;
  wire processing_system7_0_FCLK_CLK1;
  wire reset_n_1;
  wire [0:0]video_overlay_unit_m_axis_mm2s_tuser;
  wire xup_or2_2_y;

  assign processing_system7_0_FCLK_CLK1 = clk;
  assign reset_n_1 = reset_n;
  assign video_overlay_unit_m_axis_mm2s_tuser = de_in[0];
  assign wr_en[0] = pipeline_registers_10_pipe_out;
  hdmi_directpassthr_woi_pipeline_registers_10_1 pipeline_registers_10
       (.clk(processing_system7_0_FCLK_CLK1),
        .pipe_in(xup_or2_2_y),
        .pipe_out(pipeline_registers_10_pipe_out),
        .reset_n(reset_n_1));
  hdmi_directpassthr_woi_xup_or2_2_1 xup_or2_2
       (.a(video_overlay_unit_m_axis_mm2s_tuser),
        .b(pipeline_registers_10_pipe_out),
        .y(xup_or2_2_y));
endmodule

module color_video_pass_imp_1B6Z6ZF
   (clk,
    de_in_rd,
    de_in_wr,
    empty,
    full,
    reset_n,
    rst,
    ycbcr_orig,
    ycbcr_out);
  input clk;
  input [0:0]de_in_rd;
  input [0:0]de_in_wr;
  output empty;
  output full;
  input reset_n;
  input rst;
  input [15:0]ycbcr_orig;
  output [15:0]ycbcr_out;

  wire [0:0]In2_1;
  wire [0:0]Morphology_0_de_out;
  wire clk_1;
  wire [15:0]color_video_pass_fifo_dout;
  wire color_video_pass_fifo_empty;
  wire color_video_pass_fifo_full;
  wire [0:0]color_video_pass_fifo_wr_en1_rd_en;
  wire [15:0]din1_1;
  wire reset_n_1;
  wire vbb_system_reset_0_system_reset;
  wire [0:0]vovrly_async_fifo_rst_wr_en;

  assign In2_1 = de_in_wr[0];
  assign Morphology_0_de_out = de_in_rd[0];
  assign clk_1 = clk;
  assign din1_1 = ycbcr_orig[15:0];
  assign empty = color_video_pass_fifo_empty;
  assign full = color_video_pass_fifo_full;
  assign reset_n_1 = reset_n;
  assign vbb_system_reset_0_system_reset = rst;
  assign ycbcr_out[15:0] = color_video_pass_fifo_dout;
  hdmi_directpassthr_woi_fifo_generator_0_5 color_video_pass_fifo
       (.clk(clk_1),
        .din(din1_1),
        .dout(color_video_pass_fifo_dout),
        .empty(color_video_pass_fifo_empty),
        .full(color_video_pass_fifo_full),
        .rd_en(color_video_pass_fifo_wr_en1_rd_en),
        .rst(vbb_system_reset_0_system_reset),
        .wr_en(vovrly_async_fifo_rst_wr_en));
  color_video_pass_fifo_rd_en_imp_XBCM2V color_video_pass_fifo_rd_en
       (.clk(clk_1),
        .de_in(Morphology_0_de_out),
        .rd_en(color_video_pass_fifo_wr_en1_rd_en),
        .reset_n(reset_n_1));
  color_video_pass_fifo_wr_en_imp_1QSQ80A color_video_pass_fifo_wr_en
       (.clk(clk_1),
        .de_in(In2_1),
        .reset_n(reset_n_1),
        .wr_en(vovrly_async_fifo_rst_wr_en));
endmodule

module fmc_imageon_hdmi_output_0_imp_DUZT4
   (IO_HDMIO_clk,
    IO_HDMIO_data,
    IO_HDMIO_spdif,
    VID_IO_IN_active_video,
    VID_IO_IN_active_video_1,
    VID_IO_IN_data,
    VID_IO_IN_data_1,
    VID_IO_IN_hblank,
    VID_IO_IN_hblank_1,
    VID_IO_IN_vblank,
    VID_IO_IN_vblank_1,
    audio_spdif,
    clk);
  output IO_HDMIO_clk;
  output [15:0]IO_HDMIO_data;
  output IO_HDMIO_spdif;
  input [0:0]VID_IO_IN_active_video;
  input VID_IO_IN_active_video_1;
  input [15:0]VID_IO_IN_data;
  input VID_IO_IN_data_1;
  input [0:0]VID_IO_IN_hblank;
  input VID_IO_IN_hblank_1;
  input [0:0]VID_IO_IN_vblank;
  input VID_IO_IN_vblank_1;
  input [0:0]audio_spdif;
  input clk;

  wire clk_1;
  wire fmc_imageon_hdmi_in_0_VID_IO_OUT_ACTIVE_VIDEO;
  wire fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA;
  wire fmc_imageon_hdmi_in_0_VID_IO_OUT_HBLANK;
  wire fmc_imageon_hdmi_in_0_VID_IO_OUT_VBLANK;
  wire [0:0]fmc_imageon_hdmi_in_0_audio_spdif;
  wire fmc_imageon_hdmi_out_0_IO_HDMIO_CLK;
  wire [15:0]fmc_imageon_hdmi_out_0_IO_HDMIO_DATA;
  wire fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF;
  wire [0:0]gnd_dout;
  wire [0:0]vcc_dout;

  assign IO_HDMIO_clk = fmc_imageon_hdmi_out_0_IO_HDMIO_CLK;
  assign IO_HDMIO_data[15:0] = fmc_imageon_hdmi_out_0_IO_HDMIO_DATA;
  assign IO_HDMIO_spdif = fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF;
  assign clk_1 = clk;
  assign fmc_imageon_hdmi_in_0_VID_IO_OUT_ACTIVE_VIDEO = VID_IO_IN_active_video_1;
  assign fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA = VID_IO_IN_data_1;
  assign fmc_imageon_hdmi_in_0_VID_IO_OUT_HBLANK = VID_IO_IN_hblank_1;
  assign fmc_imageon_hdmi_in_0_VID_IO_OUT_VBLANK = VID_IO_IN_vblank_1;
  assign fmc_imageon_hdmi_in_0_audio_spdif = audio_spdif[0];
  hdmi_directpassthr_woi_fmc_imageon_hdmi_out_0_0 fmc_imageon_hdmi_out_0
       (.audio_spdif(fmc_imageon_hdmi_in_0_audio_spdif),
        .clk(clk_1),
        .embed_syncs(vcc_dout),
        .io_hdmio_clk(fmc_imageon_hdmi_out_0_IO_HDMIO_CLK),
        .io_hdmio_spdif(fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF),
        .io_hdmio_video(fmc_imageon_hdmi_out_0_IO_HDMIO_DATA),
        .oe(vcc_dout),
        .reset(gnd_dout),
        .video_data({fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA,fmc_imageon_hdmi_in_0_VID_IO_OUT_DATA}),
        .video_de(fmc_imageon_hdmi_in_0_VID_IO_OUT_ACTIVE_VIDEO),
        .video_hblank(fmc_imageon_hdmi_in_0_VID_IO_OUT_HBLANK),
        .video_vblank(fmc_imageon_hdmi_in_0_VID_IO_OUT_VBLANK));
  hdmi_directpassthr_woi_xlconstant_1_0 gnd
       (.dout(gnd_dout));
  hdmi_directpassthr_woi_xlconstant_0_0 vcc
       (.dout(vcc_dout));
endmodule

module four_signal_registering1_imp_1F0B69H
   (Dout,
    Dout1,
    Dout2,
    Dout3,
    clk,
    de,
    hblank,
    reset_n,
    spdif,
    vblank);
  output [0:0]Dout;
  output [0:0]Dout1;
  output [0:0]Dout2;
  output [0:0]Dout3;
  input clk;
  input [0:0]de;
  input [0:0]hblank;
  input reset_n;
  input [0:0]spdif;
  input [0:0]vblank;

  wire clk_1;
  wire [0:0]de_out_Dout;
  wire [0:0]fmc_imageon_hdmi_in_unit0_audio_spdif;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_de;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_hblank;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_vblank;
  wire [0:0]hblank_out_Dout;
  wire [3:0]hdmi_sync_pass_dout;
  wire [3:0]pipeline_registers_1_pipe_out;
  wire [0:0]spdif_out_Dout;
  wire vbb_system_reset_0_system_reset_n;
  wire [0:0]vlbank_out_Dout;

  assign Dout[0] = hblank_out_Dout;
  assign Dout1[0] = vlbank_out_Dout;
  assign Dout2[0] = de_out_Dout;
  assign Dout3[0] = spdif_out_Dout;
  assign clk_1 = clk;
  assign fmc_imageon_hdmi_in_unit0_audio_spdif = spdif[0];
  assign fmc_imageon_hdmi_in_unit0_video_de = de[0];
  assign fmc_imageon_hdmi_in_unit0_video_hblank = hblank[0];
  assign fmc_imageon_hdmi_in_unit0_video_vblank = vblank[0];
  assign vbb_system_reset_0_system_reset_n = reset_n;
  hdmi_directpassthr_woi_de_out_0 de_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(de_out_Dout));
  hdmi_directpassthr_woi_hblank_out_0 hblank_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(hblank_out_Dout));
  hdmi_directpassthr_woi_hdmi_sync_pass_0 hdmi_sync_pass
       (.In0(fmc_imageon_hdmi_in_unit0_video_hblank),
        .In1(fmc_imageon_hdmi_in_unit0_video_vblank),
        .In2(fmc_imageon_hdmi_in_unit0_video_de),
        .In3(fmc_imageon_hdmi_in_unit0_audio_spdif),
        .dout(hdmi_sync_pass_dout));
  hdmi_directpassthr_woi_pipeline_registers_1_1 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(hdmi_sync_pass_dout),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_spdif_out_0 spdif_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(spdif_out_Dout));
  hdmi_directpassthr_woi_vlbank_out_0 vlbank_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(vlbank_out_Dout));
endmodule

module four_signal_registering2_imp_1HLU43S
   (clk,
    de,
    de_out,
    hblank,
    hblank_out,
    reset_n,
    spdif,
    spdif_out,
    vblank,
    vblank_out);
  input clk;
  input [0:0]de;
  output [0:0]de_out;
  input [0:0]hblank;
  output [0:0]hblank_out;
  input reset_n;
  input [0:0]spdif;
  output [0:0]spdif_out;
  input [0:0]vblank;
  output [0:0]vblank_out;

  wire clk_1;
  wire [0:0]de_out_Dout;
  wire [0:0]fmc_imageon_hdmi_in_unit0_audio_spdif;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_de;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_hblank;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_vblank;
  wire [0:0]hblank_out_Dout;
  wire [3:0]hdmi_sync_pass_dout;
  wire [3:0]pipeline_registers_1_pipe_out;
  wire [0:0]spdif_out_Dout;
  wire vbb_system_reset_0_system_reset_n;
  wire [0:0]vlbank_out_Dout;

  assign clk_1 = clk;
  assign de_out[0] = de_out_Dout;
  assign fmc_imageon_hdmi_in_unit0_audio_spdif = spdif[0];
  assign fmc_imageon_hdmi_in_unit0_video_de = de[0];
  assign fmc_imageon_hdmi_in_unit0_video_hblank = hblank[0];
  assign fmc_imageon_hdmi_in_unit0_video_vblank = vblank[0];
  assign hblank_out[0] = hblank_out_Dout;
  assign spdif_out[0] = spdif_out_Dout;
  assign vbb_system_reset_0_system_reset_n = reset_n;
  assign vblank_out[0] = vlbank_out_Dout;
  hdmi_directpassthr_woi_de_out_1 de_out_RnM
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(de_out_Dout));
  hdmi_directpassthr_woi_hblank_out_1 hblank_out_RnM
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(hblank_out_Dout));
  hdmi_directpassthr_woi_hdmi_sync_pass_1 hdmi_sync_pass
       (.In0(fmc_imageon_hdmi_in_unit0_video_hblank),
        .In1(fmc_imageon_hdmi_in_unit0_video_vblank),
        .In2(fmc_imageon_hdmi_in_unit0_video_de),
        .In3(fmc_imageon_hdmi_in_unit0_audio_spdif),
        .dout(hdmi_sync_pass_dout));
  hdmi_directpassthr_woi_pipeline_registers_1_12 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(hdmi_sync_pass_dout),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_spdif_out_1 spdif_out_RnM
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(spdif_out_Dout));
  hdmi_directpassthr_woi_vlbank_out_1 vlbank_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(vlbank_out_Dout));
endmodule

module four_signal_registering_imp_OLD5XR
   (Dout,
    Dout1,
    Dout2,
    Dout3,
    In0,
    In1,
    In2,
    In3,
    clk,
    reset_n);
  output [0:0]Dout;
  output [0:0]Dout1;
  output [0:0]Dout2;
  output [0:0]Dout3;
  input [0:0]In0;
  input [0:0]In1;
  input [0:0]In2;
  input [0:0]In3;
  input clk;
  input reset_n;

  wire clk_1;
  wire [0:0]de_out_Dout;
  wire [0:0]fmc_imageon_hdmi_in_unit0_audio_spdif;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_de;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_hblank;
  wire [0:0]fmc_imageon_hdmi_in_unit0_video_vblank;
  wire [0:0]hblank_out_Dout;
  wire [3:0]hdmi_sync_pass_dout;
  wire [3:0]pipeline_registers_1_pipe_out;
  wire [0:0]spdif_out_Dout;
  wire vbb_system_reset_0_system_reset_n;
  wire [0:0]vlbank_out_Dout;

  assign Dout[0] = hblank_out_Dout;
  assign Dout1[0] = vlbank_out_Dout;
  assign Dout2[0] = de_out_Dout;
  assign Dout3[0] = spdif_out_Dout;
  assign clk_1 = clk;
  assign fmc_imageon_hdmi_in_unit0_audio_spdif = In3[0];
  assign fmc_imageon_hdmi_in_unit0_video_de = In2[0];
  assign fmc_imageon_hdmi_in_unit0_video_hblank = In0[0];
  assign fmc_imageon_hdmi_in_unit0_video_vblank = In1[0];
  assign vbb_system_reset_0_system_reset_n = reset_n;
  hdmi_directpassthr_woi_xlslice_0_5 de_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(de_out_Dout));
  hdmi_directpassthr_woi_xlslice_0_3 hblank_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(hblank_out_Dout));
  hdmi_directpassthr_woi_xlconcat_0_3 hdmi_sync_pass
       (.In0(fmc_imageon_hdmi_in_unit0_video_hblank),
        .In1(fmc_imageon_hdmi_in_unit0_video_vblank),
        .In2(fmc_imageon_hdmi_in_unit0_video_de),
        .In3(fmc_imageon_hdmi_in_unit0_audio_spdif),
        .dout(hdmi_sync_pass_dout));
  hdmi_directpassthr_woi_pipeline_registers_1_0 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(hdmi_sync_pass_dout),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_xlslice_0_6 spdif_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(spdif_out_Dout));
  hdmi_directpassthr_woi_xlslice_0_4 vlbank_out
       (.Din(pipeline_registers_1_pipe_out),
        .Dout(vlbank_out_Dout));
endmodule

(* CORE_GENERATION_INFO = "hdmi_directpassthr_woi,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=hdmi_directpassthr_woi,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=221,numReposBlks=172,numNonXlnxBlks=37,numHierBlks=49,maxHierDepth=3,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=30,da_board_cnt=1,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "hdmi_directpassthr_woi.hwdef" *) 
module hdmi_directpassthr_woi
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    fmc_imageon_iic_rst_n,
    fmc_imageon_iic_scl_i,
    fmc_imageon_iic_scl_o,
    fmc_imageon_iic_scl_t,
    fmc_imageon_iic_sda_i,
    fmc_imageon_iic_sda_o,
    fmc_imageon_iic_sda_t,
    hdmii_clk,
    hdmii_io_data,
    hdmii_io_spdif,
    hdmio_io_clk,
    hdmio_io_data,
    hdmio_io_spdif,
    morph_sel,
    output_source,
    smth_sel);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [0:0]fmc_imageon_iic_rst_n;
  input fmc_imageon_iic_scl_i;
  output fmc_imageon_iic_scl_o;
  output fmc_imageon_iic_scl_t;
  input fmc_imageon_iic_sda_i;
  output fmc_imageon_iic_sda_o;
  output fmc_imageon_iic_sda_t;
  input hdmii_clk;
  input [15:0]hdmii_io_data;
  input hdmii_io_spdif;
  output hdmio_io_clk;
  output [15:0]hdmio_io_data;
  output hdmio_io_spdif;
  input morph_sel;
  input [3:0]output_source;
  input smth_sel;

  wire [15:0]Din_1;
  wire [15:0]FG_THRESHOLD_dout;
  wire [15:0]IO_HDMII_1_DATA;
  wire IO_HDMII_1_SPDIF;
  wire [0:0]In2_1;
  wire [0:0]In3_1;
  wire [15:0]LEARNING_FACTOR_dout;
  wire [7:0]MATCH_THRESHOLD_dout;
  wire MixtureOfGuassians_0_is_fg;
  wire MixtureOfGuassians_0_window_en_out;
  wire Morphology_0_Hblank_out;
  wire Morphology_0_Vblank_out;
  wire Morphology_0_de_out;
  wire Morphology_0_output_data_bit;
  wire Morphology_0_win_enable_out;
  wire [31:0]S00_AXI_1_ARADDR;
  wire [1:0]S00_AXI_1_ARBURST;
  wire [3:0]S00_AXI_1_ARCACHE;
  wire [7:0]S00_AXI_1_ARLEN;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [0:0]S00_AXI_1_ARREADY;
  wire [2:0]S00_AXI_1_ARSIZE;
  wire [0:0]S00_AXI_1_ARVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [0:0]S00_AXI_1_RLAST;
  wire [0:0]S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire [0:0]S00_AXI_1_RVALID;
  wire [31:0]axi_mem_intercon_1_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_1_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_1_M00_AXI_ARCACHE;
  wire [3:0]axi_mem_intercon_1_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_1_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_1_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_1_M00_AXI_ARQOS;
  wire axi_mem_intercon_1_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_1_M00_AXI_ARSIZE;
  wire axi_mem_intercon_1_M00_AXI_ARVALID;
  wire [31:0]axi_mem_intercon_1_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_1_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_1_M00_AXI_AWCACHE;
  wire [3:0]axi_mem_intercon_1_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_1_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_1_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_1_M00_AXI_AWQOS;
  wire axi_mem_intercon_1_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_1_M00_AXI_AWSIZE;
  wire axi_mem_intercon_1_M00_AXI_AWVALID;
  wire axi_mem_intercon_1_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_1_M00_AXI_BRESP;
  wire axi_mem_intercon_1_M00_AXI_BVALID;
  wire [63:0]axi_mem_intercon_1_M00_AXI_RDATA;
  wire axi_mem_intercon_1_M00_AXI_RLAST;
  wire axi_mem_intercon_1_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_1_M00_AXI_RRESP;
  wire axi_mem_intercon_1_M00_AXI_RVALID;
  wire [63:0]axi_mem_intercon_1_M00_AXI_WDATA;
  wire axi_mem_intercon_1_M00_AXI_WLAST;
  wire axi_mem_intercon_1_M00_AXI_WREADY;
  wire [7:0]axi_mem_intercon_1_M00_AXI_WSTRB;
  wire axi_mem_intercon_1_M00_AXI_WVALID;
  wire [31:0]axi_mem_intercon_2_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_2_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_2_M00_AXI_ARCACHE;
  wire [0:0]axi_mem_intercon_2_M00_AXI_ARID;
  wire [3:0]axi_mem_intercon_2_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_2_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_2_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_2_M00_AXI_ARQOS;
  wire axi_mem_intercon_2_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_2_M00_AXI_ARSIZE;
  wire axi_mem_intercon_2_M00_AXI_ARVALID;
  wire [31:0]axi_mem_intercon_2_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_2_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_2_M00_AXI_AWCACHE;
  wire [0:0]axi_mem_intercon_2_M00_AXI_AWID;
  wire [3:0]axi_mem_intercon_2_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_2_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_2_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_2_M00_AXI_AWQOS;
  wire axi_mem_intercon_2_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_2_M00_AXI_AWSIZE;
  wire axi_mem_intercon_2_M00_AXI_AWVALID;
  wire [5:0]axi_mem_intercon_2_M00_AXI_BID;
  wire axi_mem_intercon_2_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_2_M00_AXI_BRESP;
  wire axi_mem_intercon_2_M00_AXI_BVALID;
  wire [63:0]axi_mem_intercon_2_M00_AXI_RDATA;
  wire [5:0]axi_mem_intercon_2_M00_AXI_RID;
  wire axi_mem_intercon_2_M00_AXI_RLAST;
  wire axi_mem_intercon_2_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_2_M00_AXI_RRESP;
  wire axi_mem_intercon_2_M00_AXI_RVALID;
  wire [63:0]axi_mem_intercon_2_M00_AXI_WDATA;
  wire [0:0]axi_mem_intercon_2_M00_AXI_WID;
  wire axi_mem_intercon_2_M00_AXI_WLAST;
  wire axi_mem_intercon_2_M00_AXI_WREADY;
  wire [7:0]axi_mem_intercon_2_M00_AXI_WSTRB;
  wire axi_mem_intercon_2_M00_AXI_WVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_ARADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_ARBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_ARCACHE;
  wire [0:0]axi_mem_intercon_M00_AXI_ARID;
  wire [3:0]axi_mem_intercon_M00_AXI_ARLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_ARLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_ARPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_ARQOS;
  wire axi_mem_intercon_M00_AXI_ARREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_ARSIZE;
  wire axi_mem_intercon_M00_AXI_ARVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_AWADDR;
  wire [1:0]axi_mem_intercon_M00_AXI_AWBURST;
  wire [3:0]axi_mem_intercon_M00_AXI_AWCACHE;
  wire [0:0]axi_mem_intercon_M00_AXI_AWID;
  wire [3:0]axi_mem_intercon_M00_AXI_AWLEN;
  wire [1:0]axi_mem_intercon_M00_AXI_AWLOCK;
  wire [2:0]axi_mem_intercon_M00_AXI_AWPROT;
  wire [3:0]axi_mem_intercon_M00_AXI_AWQOS;
  wire axi_mem_intercon_M00_AXI_AWREADY;
  wire [2:0]axi_mem_intercon_M00_AXI_AWSIZE;
  wire axi_mem_intercon_M00_AXI_AWVALID;
  wire [5:0]axi_mem_intercon_M00_AXI_BID;
  wire axi_mem_intercon_M00_AXI_BREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_BRESP;
  wire axi_mem_intercon_M00_AXI_BVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_RDATA;
  wire [5:0]axi_mem_intercon_M00_AXI_RID;
  wire axi_mem_intercon_M00_AXI_RLAST;
  wire axi_mem_intercon_M00_AXI_RREADY;
  wire [1:0]axi_mem_intercon_M00_AXI_RRESP;
  wire axi_mem_intercon_M00_AXI_RVALID;
  wire [31:0]axi_mem_intercon_M00_AXI_WDATA;
  wire [0:0]axi_mem_intercon_M00_AXI_WID;
  wire axi_mem_intercon_M00_AXI_WLAST;
  wire axi_mem_intercon_M00_AXI_WREADY;
  wire [3:0]axi_mem_intercon_M00_AXI_WSTRB;
  wire axi_mem_intercon_M00_AXI_WVALID;
  wire clk_1;
  wire [0:0]de_in_1;
  wire fmc_imageon_hdmi_in_unit0_audio_spdif;
  wire fmc_imageon_hdmi_in_unit0_video_de;
  wire fmc_imageon_hdmi_in_unit0_video_hblank;
  wire fmc_imageon_hdmi_in_unit0_video_vblank;
  wire fmc_imageon_hdmi_out_0_IO_HDMIO_CLK;
  wire [15:0]fmc_imageon_hdmi_out_0_IO_HDMIO_DATA;
  wire fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF;
  wire fmc_imageon_iic_0_IIC_SCL_I;
  wire fmc_imageon_iic_0_IIC_SCL_O;
  wire fmc_imageon_iic_0_IIC_SCL_T;
  wire fmc_imageon_iic_0_IIC_SDA_I;
  wire fmc_imageon_iic_0_IIC_SDA_O;
  wire fmc_imageon_iic_0_IIC_SDA_T;
  wire [0:0]fmc_imageon_iic_0_gpo;
  wire fmc_imageon_iic_0_iic2intc_irpt;
  wire [0:0]four_signal_registering1_Dout;
  wire [0:0]four_signal_registering1_Dout1;
  wire [0:0]four_signal_registering1_Dout2;
  wire [0:0]four_signal_registering1_Dout3;
  wire [0:0]four_signal_registering2_de_out;
  wire [0:0]four_signal_registering2_hblank_out;
  wire [0:0]four_signal_registering2_spdif_out;
  wire [0:0]four_signal_registering2_vblank_out;
  wire [0:0]hblank_in_1;
  wire image_smoothing_1_Hblank_out;
  wire image_smoothing_1_Vblank_out;
  wire [15:0]image_smoothing_1_data_out;
  wire image_smoothing_1_de_out;
  wire image_smoothing_1_spdif_out;
  wire image_smoothing_1_win_enable_out;
  wire [0:0]image_smoothing_full_version_0_Hblank_out;
  wire [0:0]image_smoothing_full_version_0_Vblank_out;
  wire [31:0]mog_vdma_M_AXI_MM2S_ARADDR;
  wire [1:0]mog_vdma_M_AXI_MM2S_ARBURST;
  wire [3:0]mog_vdma_M_AXI_MM2S_ARCACHE;
  wire [7:0]mog_vdma_M_AXI_MM2S_ARLEN;
  wire [2:0]mog_vdma_M_AXI_MM2S_ARPROT;
  wire [0:0]mog_vdma_M_AXI_MM2S_ARREADY;
  wire [2:0]mog_vdma_M_AXI_MM2S_ARSIZE;
  wire [0:0]mog_vdma_M_AXI_MM2S_ARVALID;
  wire [127:0]mog_vdma_M_AXI_MM2S_RDATA;
  wire [0:0]mog_vdma_M_AXI_MM2S_RLAST;
  wire [0:0]mog_vdma_M_AXI_MM2S_RREADY;
  wire [1:0]mog_vdma_M_AXI_MM2S_RRESP;
  wire [0:0]mog_vdma_M_AXI_MM2S_RVALID;
  wire [31:0]mog_vdma_M_AXI_S2MM_AWADDR;
  wire [1:0]mog_vdma_M_AXI_S2MM_AWBURST;
  wire [3:0]mog_vdma_M_AXI_S2MM_AWCACHE;
  wire [7:0]mog_vdma_M_AXI_S2MM_AWLEN;
  wire [2:0]mog_vdma_M_AXI_S2MM_AWPROT;
  wire [0:0]mog_vdma_M_AXI_S2MM_AWREADY;
  wire [2:0]mog_vdma_M_AXI_S2MM_AWSIZE;
  wire [0:0]mog_vdma_M_AXI_S2MM_AWVALID;
  wire [0:0]mog_vdma_M_AXI_S2MM_BREADY;
  wire [1:0]mog_vdma_M_AXI_S2MM_BRESP;
  wire [0:0]mog_vdma_M_AXI_S2MM_BVALID;
  wire [127:0]mog_vdma_M_AXI_S2MM_WDATA;
  wire [0:0]mog_vdma_M_AXI_S2MM_WLAST;
  wire [0:0]mog_vdma_M_AXI_S2MM_WREADY;
  wire [15:0]mog_vdma_M_AXI_S2MM_WSTRB;
  wire [0:0]mog_vdma_M_AXI_S2MM_WVALID;
  wire mog_woi_det_window_enable;
  wire [0:0]morph_pass_sel_Dout;
  wire [0:0]morph_pass_sel_de_smth_sel;
  wire [0:0]morph_pass_sel_hblank_smth_sel;
  wire [0:0]morph_pass_sel_spdif_smth_sel;
  wire [0:0]morph_pass_sel_vblank_smth_sel;
  wire [0:0]morph_pass_sel_windown_en_smth_sel;
  wire [3:0]output_source_1;
  wire [0:0]pipeline_registers_1_pipe_out;
  wire [15:0]pipeline_registers_1_pipe_out1;
  wire [0:0]pipeline_registers_2_pipe_out;
  wire [0:0]pipeline_registers_2_pipe_out1;
  wire [0:0]pipeline_registers_3_pipe_out;
  wire [0:0]pipeline_registers_4_pipe_out;
  wire [0:0]pipeline_registers_5_pipe_out;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_CLK1;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FCLK_RESET2_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_ARADDR;
  wire processing_system7_0_axi_periph_M00_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_AWADDR;
  wire processing_system7_0_axi_periph_M00_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M00_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M00_AXI_BRESP;
  wire processing_system7_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M00_AXI_RRESP;
  wire processing_system7_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_WDATA;
  wire processing_system7_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]processing_system7_0_axi_periph_M00_AXI_WSTRB;
  wire [0:0]processing_system7_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M01_AXI_ARADDR;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M01_AXI_AWADDR;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M01_AXI_BRESP;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M01_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M01_AXI_RRESP;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M01_AXI_WDATA;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_WREADY;
  wire [0:0]processing_system7_0_axi_periph_M01_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_ARADDR;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_AWADDR;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M02_AXI_BRESP;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M02_AXI_RRESP;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M02_AXI_WDATA;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_WREADY;
  wire [0:0]processing_system7_0_axi_periph_M02_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_ARADDR;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_AWADDR;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M03_AXI_BRESP;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M03_AXI_RRESP;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_WDATA;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_WREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M04_AXI_ARADDR;
  wire [2:0]processing_system7_0_axi_periph_M04_AXI_ARPROT;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M04_AXI_AWADDR;
  wire [2:0]processing_system7_0_axi_periph_M04_AXI_AWPROT;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M04_AXI_BRESP;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M04_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M04_AXI_RRESP;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M04_AXI_WDATA;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_WREADY;
  wire [3:0]processing_system7_0_axi_periph_M04_AXI_WSTRB;
  wire [0:0]processing_system7_0_axi_periph_M04_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M05_AXI_ARADDR;
  wire [2:0]processing_system7_0_axi_periph_M05_AXI_ARPROT;
  wire processing_system7_0_axi_periph_M05_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M05_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M05_AXI_AWADDR;
  wire [2:0]processing_system7_0_axi_periph_M05_AXI_AWPROT;
  wire processing_system7_0_axi_periph_M05_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M05_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M05_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M05_AXI_BRESP;
  wire processing_system7_0_axi_periph_M05_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M05_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M05_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M05_AXI_RRESP;
  wire processing_system7_0_axi_periph_M05_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M05_AXI_WDATA;
  wire processing_system7_0_axi_periph_M05_AXI_WREADY;
  wire [3:0]processing_system7_0_axi_periph_M05_AXI_WSTRB;
  wire [0:0]processing_system7_0_axi_periph_M05_AXI_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M06_AXI_ARADDR;
  wire [2:0]processing_system7_0_axi_periph_M06_AXI_ARPROT;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M06_AXI_AWADDR;
  wire [2:0]processing_system7_0_axi_periph_M06_AXI_AWPROT;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M06_AXI_BRESP;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M06_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M06_AXI_RRESP;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M06_AXI_WDATA;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_WREADY;
  wire [3:0]processing_system7_0_axi_periph_M06_AXI_WSTRB;
  wire [0:0]processing_system7_0_axi_periph_M06_AXI_WVALID;
  wire [0:0]rst_processing_system7_0_100M_interconnect_aresetn;
  wire [0:0]rst_processing_system7_0_100M_peripheral_aresetn;
  wire [0:0]rst_processing_system7_0_150M_interconnect_aresetn;
  wire [0:0]rst_processing_system7_0_150M_peripheral_aresetn;
  wire sel_1;
  wire smth_sel_1;
  wire spdif_1;
  wire [0:0]spdif_in_1;
  wire [15:0]swap_dout;
  wire vbb_system_reset_0_system_reset;
  wire vbb_system_reset_0_system_reset_n;
  wire [0:0]vblank_in_1;
  wire [15:0]video_overlay_0_video_data_out;
  wire [31:0]video_overlay_unit_M_AXI_S2MM_AWADDR;
  wire [1:0]video_overlay_unit_M_AXI_S2MM_AWBURST;
  wire [3:0]video_overlay_unit_M_AXI_S2MM_AWCACHE;
  wire [7:0]video_overlay_unit_M_AXI_S2MM_AWLEN;
  wire [2:0]video_overlay_unit_M_AXI_S2MM_AWPROT;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_AWREADY;
  wire [2:0]video_overlay_unit_M_AXI_S2MM_AWSIZE;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_AWVALID;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_BREADY;
  wire [1:0]video_overlay_unit_M_AXI_S2MM_BRESP;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_BVALID;
  wire [31:0]video_overlay_unit_M_AXI_S2MM_WDATA;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_WLAST;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_WREADY;
  wire [3:0]video_overlay_unit_M_AXI_S2MM_WSTRB;
  wire [0:0]video_overlay_unit_M_AXI_S2MM_WVALID;
  wire video_overlay_unit_mm2s_introut;
  wire video_overlay_unit_s2mm_introut;
  wire [0:0]window_enable_1;
  wire [2:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [7:0]xlslice_0_Dout;
  wire [7:0]ycbcr2gray_Dout;
  wire [15:0]ycbcr_orig_rebuild_dout;
  wire [31:0]ycbcr_vdma_M_AXI_MM2S_ARADDR;
  wire [1:0]ycbcr_vdma_M_AXI_MM2S_ARBURST;
  wire [3:0]ycbcr_vdma_M_AXI_MM2S_ARCACHE;
  wire [7:0]ycbcr_vdma_M_AXI_MM2S_ARLEN;
  wire [2:0]ycbcr_vdma_M_AXI_MM2S_ARPROT;
  wire ycbcr_vdma_M_AXI_MM2S_ARREADY;
  wire [2:0]ycbcr_vdma_M_AXI_MM2S_ARSIZE;
  wire ycbcr_vdma_M_AXI_MM2S_ARVALID;
  wire [31:0]ycbcr_vdma_M_AXI_MM2S_RDATA;
  wire ycbcr_vdma_M_AXI_MM2S_RLAST;
  wire ycbcr_vdma_M_AXI_MM2S_RREADY;
  wire [1:0]ycbcr_vdma_M_AXI_MM2S_RRESP;
  wire ycbcr_vdma_M_AXI_MM2S_RVALID;
  wire [31:0]ycbcr_vdma_M_AXI_S2MM_AWADDR;
  wire [1:0]ycbcr_vdma_M_AXI_S2MM_AWBURST;
  wire [3:0]ycbcr_vdma_M_AXI_S2MM_AWCACHE;
  wire [7:0]ycbcr_vdma_M_AXI_S2MM_AWLEN;
  wire [2:0]ycbcr_vdma_M_AXI_S2MM_AWPROT;
  wire ycbcr_vdma_M_AXI_S2MM_AWREADY;
  wire [2:0]ycbcr_vdma_M_AXI_S2MM_AWSIZE;
  wire ycbcr_vdma_M_AXI_S2MM_AWVALID;
  wire ycbcr_vdma_M_AXI_S2MM_BREADY;
  wire [1:0]ycbcr_vdma_M_AXI_S2MM_BRESP;
  wire ycbcr_vdma_M_AXI_S2MM_BVALID;
  wire [31:0]ycbcr_vdma_M_AXI_S2MM_WDATA;
  wire ycbcr_vdma_M_AXI_S2MM_WLAST;
  wire ycbcr_vdma_M_AXI_S2MM_WREADY;
  wire [3:0]ycbcr_vdma_M_AXI_S2MM_WSTRB;
  wire ycbcr_vdma_M_AXI_S2MM_WVALID;

  assign IO_HDMII_1_DATA = hdmii_io_data[15:0];
  assign IO_HDMII_1_SPDIF = hdmii_io_spdif;
  assign clk_1 = hdmii_clk;
  assign fmc_imageon_iic_0_IIC_SCL_I = fmc_imageon_iic_scl_i;
  assign fmc_imageon_iic_0_IIC_SDA_I = fmc_imageon_iic_sda_i;
  assign fmc_imageon_iic_rst_n[0] = fmc_imageon_iic_0_gpo;
  assign fmc_imageon_iic_scl_o = fmc_imageon_iic_0_IIC_SCL_O;
  assign fmc_imageon_iic_scl_t = fmc_imageon_iic_0_IIC_SCL_T;
  assign fmc_imageon_iic_sda_o = fmc_imageon_iic_0_IIC_SDA_O;
  assign fmc_imageon_iic_sda_t = fmc_imageon_iic_0_IIC_SDA_T;
  assign hdmio_io_clk = fmc_imageon_hdmi_out_0_IO_HDMIO_CLK;
  assign hdmio_io_data[15:0] = fmc_imageon_hdmi_out_0_IO_HDMIO_DATA;
  assign hdmio_io_spdif = fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF;
  assign output_source_1 = output_source[3:0];
  assign sel_1 = morph_sel;
  assign smth_sel_1 = smth_sel;
  hdmi_directpassthr_woi_xlconstant_0_5 FG_THRESHOLD
       (.dout(FG_THRESHOLD_dout));
  hdmi_directpassthr_woi_xlconstant_0_4 LEARNING_FACTOR
       (.dout(LEARNING_FACTOR_dout));
  hdmi_directpassthr_woi_xlconstant_0_6 MATCH_THRESHOLD
       (.dout(MATCH_THRESHOLD_dout));
  hdmi_directpassthr_woi_Morphology_1_0 Morphology_0
       (.clk(clk_1),
        .de_in(pipeline_registers_1_pipe_out),
        .de_out(Morphology_0_de_out),
        .hblank_in(pipeline_registers_4_pipe_out),
        .hblank_out(Morphology_0_Hblank_out),
        .input_data_bit(MixtureOfGuassians_0_is_fg),
        .output_data_bit(Morphology_0_output_data_bit),
        .rst(vbb_system_reset_0_system_reset),
        .spdif_in(pipeline_registers_5_pipe_out),
        .spdif_out(spdif_1),
        .vblank_in(pipeline_registers_2_pipe_out),
        .vblank_out(Morphology_0_Vblank_out),
        .win_enable_in(MixtureOfGuassians_0_window_en_out),
        .win_enable_out(Morphology_0_win_enable_out));
  hdmi_directpassthr_woi_axi_mem_intercon_0 axi_mem_intercon
       (.ACLK(processing_system7_0_FCLK_CLK1),
        .ARESETN(rst_processing_system7_0_150M_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_FCLK_CLK1),
        .M00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .M00_AXI_araddr(axi_mem_intercon_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_mem_intercon_M00_AXI_ARID),
        .M00_AXI_arlen(axi_mem_intercon_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_mem_intercon_M00_AXI_AWID),
        .M00_AXI_awlen(axi_mem_intercon_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_mem_intercon_M00_AXI_BID),
        .M00_AXI_bready(axi_mem_intercon_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_M00_AXI_RDATA),
        .M00_AXI_rid(axi_mem_intercon_M00_AXI_RID),
        .M00_AXI_rlast(axi_mem_intercon_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_M00_AXI_WDATA),
        .M00_AXI_wid(axi_mem_intercon_M00_AXI_WID),
        .M00_AXI_wlast(axi_mem_intercon_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_M00_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK1),
        .S00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arburst(S00_AXI_1_ARBURST),
        .S00_AXI_arcache(S00_AXI_1_ARCACHE),
        .S00_AXI_arlen(S00_AXI_1_ARLEN),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arsize(S00_AXI_1_ARSIZE),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rlast(S00_AXI_1_RLAST),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S01_ACLK(processing_system7_0_FCLK_CLK1),
        .S01_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S01_AXI_awaddr(video_overlay_unit_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(video_overlay_unit_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(video_overlay_unit_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(video_overlay_unit_M_AXI_S2MM_AWLEN),
        .S01_AXI_awprot(video_overlay_unit_M_AXI_S2MM_AWPROT),
        .S01_AXI_awready(video_overlay_unit_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(video_overlay_unit_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(video_overlay_unit_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(video_overlay_unit_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(video_overlay_unit_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(video_overlay_unit_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(video_overlay_unit_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(video_overlay_unit_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(video_overlay_unit_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(video_overlay_unit_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(video_overlay_unit_M_AXI_S2MM_WVALID));
  hdmi_directpassthr_woi_axi_mem_intercon_1_0 axi_mem_intercon_1
       (.ACLK(processing_system7_0_FCLK_CLK1),
        .ARESETN(rst_processing_system7_0_150M_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_FCLK_CLK1),
        .M00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .M00_AXI_araddr(axi_mem_intercon_1_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_1_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_1_M00_AXI_ARCACHE),
        .M00_AXI_arlen(axi_mem_intercon_1_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_1_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_1_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_1_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_1_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_1_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_1_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_1_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_1_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_1_M00_AXI_AWCACHE),
        .M00_AXI_awlen(axi_mem_intercon_1_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_1_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_1_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_1_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_1_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_1_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_1_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_mem_intercon_1_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_1_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_1_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_1_M00_AXI_RDATA),
        .M00_AXI_rlast(axi_mem_intercon_1_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_1_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_1_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_1_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_1_M00_AXI_WDATA),
        .M00_AXI_wlast(axi_mem_intercon_1_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_1_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_1_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_1_M00_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK1),
        .S00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S00_AXI_araddr(mog_vdma_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(mog_vdma_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(mog_vdma_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(mog_vdma_M_AXI_MM2S_ARLEN),
        .S00_AXI_arprot(mog_vdma_M_AXI_MM2S_ARPROT),
        .S00_AXI_arready(mog_vdma_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(mog_vdma_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(mog_vdma_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(mog_vdma_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(mog_vdma_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(mog_vdma_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(mog_vdma_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(mog_vdma_M_AXI_MM2S_RVALID),
        .S01_ACLK(processing_system7_0_FCLK_CLK1),
        .S01_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S01_AXI_awaddr(mog_vdma_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(mog_vdma_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(mog_vdma_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(mog_vdma_M_AXI_S2MM_AWLEN),
        .S01_AXI_awprot(mog_vdma_M_AXI_S2MM_AWPROT),
        .S01_AXI_awready(mog_vdma_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(mog_vdma_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(mog_vdma_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(mog_vdma_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(mog_vdma_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(mog_vdma_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(mog_vdma_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(mog_vdma_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(mog_vdma_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(mog_vdma_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(mog_vdma_M_AXI_S2MM_WVALID));
  hdmi_directpassthr_woi_axi_mem_intercon_2_0 axi_mem_intercon_2
       (.ACLK(processing_system7_0_FCLK_CLK1),
        .ARESETN(rst_processing_system7_0_150M_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_FCLK_CLK1),
        .M00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .M00_AXI_araddr(axi_mem_intercon_2_M00_AXI_ARADDR),
        .M00_AXI_arburst(axi_mem_intercon_2_M00_AXI_ARBURST),
        .M00_AXI_arcache(axi_mem_intercon_2_M00_AXI_ARCACHE),
        .M00_AXI_arid(axi_mem_intercon_2_M00_AXI_ARID),
        .M00_AXI_arlen(axi_mem_intercon_2_M00_AXI_ARLEN),
        .M00_AXI_arlock(axi_mem_intercon_2_M00_AXI_ARLOCK),
        .M00_AXI_arprot(axi_mem_intercon_2_M00_AXI_ARPROT),
        .M00_AXI_arqos(axi_mem_intercon_2_M00_AXI_ARQOS),
        .M00_AXI_arready(axi_mem_intercon_2_M00_AXI_ARREADY),
        .M00_AXI_arsize(axi_mem_intercon_2_M00_AXI_ARSIZE),
        .M00_AXI_arvalid(axi_mem_intercon_2_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_mem_intercon_2_M00_AXI_AWADDR),
        .M00_AXI_awburst(axi_mem_intercon_2_M00_AXI_AWBURST),
        .M00_AXI_awcache(axi_mem_intercon_2_M00_AXI_AWCACHE),
        .M00_AXI_awid(axi_mem_intercon_2_M00_AXI_AWID),
        .M00_AXI_awlen(axi_mem_intercon_2_M00_AXI_AWLEN),
        .M00_AXI_awlock(axi_mem_intercon_2_M00_AXI_AWLOCK),
        .M00_AXI_awprot(axi_mem_intercon_2_M00_AXI_AWPROT),
        .M00_AXI_awqos(axi_mem_intercon_2_M00_AXI_AWQOS),
        .M00_AXI_awready(axi_mem_intercon_2_M00_AXI_AWREADY),
        .M00_AXI_awsize(axi_mem_intercon_2_M00_AXI_AWSIZE),
        .M00_AXI_awvalid(axi_mem_intercon_2_M00_AXI_AWVALID),
        .M00_AXI_bid(axi_mem_intercon_2_M00_AXI_BID),
        .M00_AXI_bready(axi_mem_intercon_2_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_mem_intercon_2_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_mem_intercon_2_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_mem_intercon_2_M00_AXI_RDATA),
        .M00_AXI_rid(axi_mem_intercon_2_M00_AXI_RID),
        .M00_AXI_rlast(axi_mem_intercon_2_M00_AXI_RLAST),
        .M00_AXI_rready(axi_mem_intercon_2_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_mem_intercon_2_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_mem_intercon_2_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_mem_intercon_2_M00_AXI_WDATA),
        .M00_AXI_wid(axi_mem_intercon_2_M00_AXI_WID),
        .M00_AXI_wlast(axi_mem_intercon_2_M00_AXI_WLAST),
        .M00_AXI_wready(axi_mem_intercon_2_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_mem_intercon_2_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_mem_intercon_2_M00_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK1),
        .S00_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S00_AXI_araddr(ycbcr_vdma_M_AXI_MM2S_ARADDR),
        .S00_AXI_arburst(ycbcr_vdma_M_AXI_MM2S_ARBURST),
        .S00_AXI_arcache(ycbcr_vdma_M_AXI_MM2S_ARCACHE),
        .S00_AXI_arlen(ycbcr_vdma_M_AXI_MM2S_ARLEN),
        .S00_AXI_arprot(ycbcr_vdma_M_AXI_MM2S_ARPROT),
        .S00_AXI_arready(ycbcr_vdma_M_AXI_MM2S_ARREADY),
        .S00_AXI_arsize(ycbcr_vdma_M_AXI_MM2S_ARSIZE),
        .S00_AXI_arvalid(ycbcr_vdma_M_AXI_MM2S_ARVALID),
        .S00_AXI_rdata(ycbcr_vdma_M_AXI_MM2S_RDATA),
        .S00_AXI_rlast(ycbcr_vdma_M_AXI_MM2S_RLAST),
        .S00_AXI_rready(ycbcr_vdma_M_AXI_MM2S_RREADY),
        .S00_AXI_rresp(ycbcr_vdma_M_AXI_MM2S_RRESP),
        .S00_AXI_rvalid(ycbcr_vdma_M_AXI_MM2S_RVALID),
        .S01_ACLK(processing_system7_0_FCLK_CLK1),
        .S01_ARESETN(rst_processing_system7_0_150M_peripheral_aresetn),
        .S01_AXI_awaddr(ycbcr_vdma_M_AXI_S2MM_AWADDR),
        .S01_AXI_awburst(ycbcr_vdma_M_AXI_S2MM_AWBURST),
        .S01_AXI_awcache(ycbcr_vdma_M_AXI_S2MM_AWCACHE),
        .S01_AXI_awlen(ycbcr_vdma_M_AXI_S2MM_AWLEN),
        .S01_AXI_awprot(ycbcr_vdma_M_AXI_S2MM_AWPROT),
        .S01_AXI_awready(ycbcr_vdma_M_AXI_S2MM_AWREADY),
        .S01_AXI_awsize(ycbcr_vdma_M_AXI_S2MM_AWSIZE),
        .S01_AXI_awvalid(ycbcr_vdma_M_AXI_S2MM_AWVALID),
        .S01_AXI_bready(ycbcr_vdma_M_AXI_S2MM_BREADY),
        .S01_AXI_bresp(ycbcr_vdma_M_AXI_S2MM_BRESP),
        .S01_AXI_bvalid(ycbcr_vdma_M_AXI_S2MM_BVALID),
        .S01_AXI_wdata(ycbcr_vdma_M_AXI_S2MM_WDATA),
        .S01_AXI_wlast(ycbcr_vdma_M_AXI_S2MM_WLAST),
        .S01_AXI_wready(ycbcr_vdma_M_AXI_S2MM_WREADY),
        .S01_AXI_wstrb(ycbcr_vdma_M_AXI_S2MM_WSTRB),
        .S01_AXI_wvalid(ycbcr_vdma_M_AXI_S2MM_WVALID));
  bge_unit_imp_1TZLT3B bge_unit
       (.FG_THRESHOLD(FG_THRESHOLD_dout),
        .LEARNING_FACTOR(LEARNING_FACTOR_dout),
        .MATCH_THRESHOLD(MATCH_THRESHOLD_dout),
        .M_AXI_MM2S_araddr(mog_vdma_M_AXI_MM2S_ARADDR),
        .M_AXI_MM2S_arburst(mog_vdma_M_AXI_MM2S_ARBURST),
        .M_AXI_MM2S_arcache(mog_vdma_M_AXI_MM2S_ARCACHE),
        .M_AXI_MM2S_arlen(mog_vdma_M_AXI_MM2S_ARLEN),
        .M_AXI_MM2S_arprot(mog_vdma_M_AXI_MM2S_ARPROT),
        .M_AXI_MM2S_arready(mog_vdma_M_AXI_MM2S_ARREADY),
        .M_AXI_MM2S_arsize(mog_vdma_M_AXI_MM2S_ARSIZE),
        .M_AXI_MM2S_arvalid(mog_vdma_M_AXI_MM2S_ARVALID),
        .M_AXI_MM2S_rdata(mog_vdma_M_AXI_MM2S_RDATA),
        .M_AXI_MM2S_rlast(mog_vdma_M_AXI_MM2S_RLAST),
        .M_AXI_MM2S_rready(mog_vdma_M_AXI_MM2S_RREADY),
        .M_AXI_MM2S_rresp(mog_vdma_M_AXI_MM2S_RRESP),
        .M_AXI_MM2S_rvalid(mog_vdma_M_AXI_MM2S_RVALID),
        .M_AXI_S2MM_awaddr(mog_vdma_M_AXI_S2MM_AWADDR),
        .M_AXI_S2MM_awburst(mog_vdma_M_AXI_S2MM_AWBURST),
        .M_AXI_S2MM_awcache(mog_vdma_M_AXI_S2MM_AWCACHE),
        .M_AXI_S2MM_awlen(mog_vdma_M_AXI_S2MM_AWLEN),
        .M_AXI_S2MM_awprot(mog_vdma_M_AXI_S2MM_AWPROT),
        .M_AXI_S2MM_awready(mog_vdma_M_AXI_S2MM_AWREADY),
        .M_AXI_S2MM_awsize(mog_vdma_M_AXI_S2MM_AWSIZE),
        .M_AXI_S2MM_awvalid(mog_vdma_M_AXI_S2MM_AWVALID),
        .M_AXI_S2MM_bready(mog_vdma_M_AXI_S2MM_BREADY),
        .M_AXI_S2MM_bresp(mog_vdma_M_AXI_S2MM_BRESP),
        .M_AXI_S2MM_bvalid(mog_vdma_M_AXI_S2MM_BVALID),
        .M_AXI_S2MM_wdata(mog_vdma_M_AXI_S2MM_WDATA),
        .M_AXI_S2MM_wlast(mog_vdma_M_AXI_S2MM_WLAST),
        .M_AXI_S2MM_wready(mog_vdma_M_AXI_S2MM_WREADY),
        .M_AXI_S2MM_wstrb(mog_vdma_M_AXI_S2MM_WSTRB),
        .M_AXI_S2MM_wvalid(mog_vdma_M_AXI_S2MM_WVALID),
        .S_AXI_LITE_araddr(processing_system7_0_axi_periph_M02_AXI_ARADDR),
        .S_AXI_LITE_arready(processing_system7_0_axi_periph_M02_AXI_ARREADY),
        .S_AXI_LITE_arvalid(processing_system7_0_axi_periph_M02_AXI_ARVALID),
        .S_AXI_LITE_awaddr(processing_system7_0_axi_periph_M02_AXI_AWADDR),
        .S_AXI_LITE_awready(processing_system7_0_axi_periph_M02_AXI_AWREADY),
        .S_AXI_LITE_awvalid(processing_system7_0_axi_periph_M02_AXI_AWVALID),
        .S_AXI_LITE_bready(processing_system7_0_axi_periph_M02_AXI_BREADY),
        .S_AXI_LITE_bresp(processing_system7_0_axi_periph_M02_AXI_BRESP),
        .S_AXI_LITE_bvalid(processing_system7_0_axi_periph_M02_AXI_BVALID),
        .S_AXI_LITE_rdata(processing_system7_0_axi_periph_M02_AXI_RDATA),
        .S_AXI_LITE_rready(processing_system7_0_axi_periph_M02_AXI_RREADY),
        .S_AXI_LITE_rresp(processing_system7_0_axi_periph_M02_AXI_RRESP),
        .S_AXI_LITE_rvalid(processing_system7_0_axi_periph_M02_AXI_RVALID),
        .S_AXI_LITE_wdata(processing_system7_0_axi_periph_M02_AXI_WDATA),
        .S_AXI_LITE_wready(processing_system7_0_axi_periph_M02_AXI_WREADY),
        .S_AXI_LITE_wvalid(processing_system7_0_axi_periph_M02_AXI_WVALID),
        .S_AXI_araddr(processing_system7_0_axi_periph_M04_AXI_ARADDR),
        .S_AXI_arprot(processing_system7_0_axi_periph_M04_AXI_ARPROT),
        .S_AXI_arready(processing_system7_0_axi_periph_M04_AXI_ARREADY),
        .S_AXI_arvalid(processing_system7_0_axi_periph_M04_AXI_ARVALID),
        .S_AXI_awaddr(processing_system7_0_axi_periph_M04_AXI_AWADDR),
        .S_AXI_awprot(processing_system7_0_axi_periph_M04_AXI_AWPROT),
        .S_AXI_awready(processing_system7_0_axi_periph_M04_AXI_AWREADY),
        .S_AXI_awvalid(processing_system7_0_axi_periph_M04_AXI_AWVALID),
        .S_AXI_bready(processing_system7_0_axi_periph_M04_AXI_BREADY),
        .S_AXI_bresp(processing_system7_0_axi_periph_M04_AXI_BRESP),
        .S_AXI_bvalid(processing_system7_0_axi_periph_M04_AXI_BVALID),
        .S_AXI_rdata(processing_system7_0_axi_periph_M04_AXI_RDATA),
        .S_AXI_rready(processing_system7_0_axi_periph_M04_AXI_RREADY),
        .S_AXI_rresp(processing_system7_0_axi_periph_M04_AXI_RRESP),
        .S_AXI_rvalid(processing_system7_0_axi_periph_M04_AXI_RVALID),
        .S_AXI_wdata(processing_system7_0_axi_periph_M04_AXI_WDATA),
        .S_AXI_wready(processing_system7_0_axi_periph_M04_AXI_WREADY),
        .S_AXI_wstrb(processing_system7_0_axi_periph_M04_AXI_WSTRB),
        .S_AXI_wvalid(processing_system7_0_axi_periph_M04_AXI_WVALID),
        .axi_clk(processing_system7_0_FCLK_CLK1),
        .axi_lite_clk(processing_system7_0_FCLK_CLK0),
        .axi_resetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .grayscale_pixel_in(ycbcr2gray_Dout),
        .hdmi_clk(clk_1),
        .is_fg(MixtureOfGuassians_0_is_fg),
        .system_reset(vbb_system_reset_0_system_reset),
        .system_reset_n(vbb_system_reset_0_system_reset_n),
        .window_enable(window_enable_1),
        .window_enable_out(MixtureOfGuassians_0_window_en_out));
  color_video_pass_imp_1B6Z6ZF color_video_pass
       (.clk(clk_1),
        .de_in_rd(morph_pass_sel_de_smth_sel),
        .de_in_wr(In2_1),
        .reset_n(vbb_system_reset_0_system_reset_n),
        .rst(vbb_system_reset_0_system_reset),
        .ycbcr_orig(pipeline_registers_1_pipe_out1),
        .ycbcr_out(ycbcr_orig_rebuild_dout));
  hdmi_directpassthr_woi_xlconcat_0_2 concat_interrupt
       (.In0(video_overlay_unit_mm2s_introut),
        .In1(video_overlay_unit_s2mm_introut),
        .In2(fmc_imageon_iic_0_iic2intc_irpt),
        .dout(xlconcat_0_dout));
  hdmi_directpassthr_woi_fmc_imageon_hdmi_in_0_0 fmc_imageon_hdmi_input_0
       (.audio_spdif(fmc_imageon_hdmi_in_unit0_audio_spdif),
        .clk(clk_1),
        .io_hdmii_spdif(IO_HDMII_1_SPDIF),
        .io_hdmii_video(IO_HDMII_1_DATA),
        .video_data(swap_dout),
        .video_de(fmc_imageon_hdmi_in_unit0_video_de),
        .video_hblank(fmc_imageon_hdmi_in_unit0_video_hblank),
        .video_vblank(fmc_imageon_hdmi_in_unit0_video_vblank));
  fmc_imageon_hdmi_output_0_imp_DUZT4 fmc_imageon_hdmi_output_0
       (.IO_HDMIO_clk(fmc_imageon_hdmi_out_0_IO_HDMIO_CLK),
        .IO_HDMIO_data(fmc_imageon_hdmi_out_0_IO_HDMIO_DATA),
        .IO_HDMIO_spdif(fmc_imageon_hdmi_out_0_IO_HDMIO_SPDIF),
        .VID_IO_IN_active_video(four_signal_registering1_Dout2),
        .VID_IO_IN_active_video_1(1'b0),
        .VID_IO_IN_data(video_overlay_0_video_data_out),
        .VID_IO_IN_data_1(1'b0),
        .VID_IO_IN_hblank(four_signal_registering1_Dout),
        .VID_IO_IN_hblank_1(1'b0),
        .VID_IO_IN_vblank(four_signal_registering1_Dout1),
        .VID_IO_IN_vblank_1(1'b0),
        .audio_spdif(four_signal_registering1_Dout3),
        .clk(clk_1));
  hdmi_directpassthr_woi_axi_iic_0_0 fmc_imageon_iic_0
       (.gpo(fmc_imageon_iic_0_gpo),
        .iic2intc_irpt(fmc_imageon_iic_0_iic2intc_irpt),
        .s_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s_axi_araddr(processing_system7_0_axi_periph_M00_AXI_ARADDR[8:0]),
        .s_axi_aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .s_axi_arready(processing_system7_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(processing_system7_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(processing_system7_0_axi_periph_M00_AXI_AWADDR[8:0]),
        .s_axi_awready(processing_system7_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(processing_system7_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(processing_system7_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(processing_system7_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(processing_system7_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(processing_system7_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(processing_system7_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(processing_system7_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(processing_system7_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(processing_system7_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(processing_system7_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(processing_system7_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(processing_system7_0_axi_periph_M00_AXI_WVALID),
        .scl_i(fmc_imageon_iic_0_IIC_SCL_I),
        .scl_o(fmc_imageon_iic_0_IIC_SCL_O),
        .scl_t(fmc_imageon_iic_0_IIC_SCL_T),
        .sda_i(fmc_imageon_iic_0_IIC_SDA_I),
        .sda_o(fmc_imageon_iic_0_IIC_SDA_O),
        .sda_t(fmc_imageon_iic_0_IIC_SDA_T));
  four_signal_registering_imp_OLD5XR four_signal_registering
       (.Dout(image_smoothing_full_version_0_Hblank_out),
        .Dout1(image_smoothing_full_version_0_Vblank_out),
        .Dout2(In2_1),
        .Dout3(In3_1),
        .In0(fmc_imageon_hdmi_in_unit0_video_hblank),
        .In1(fmc_imageon_hdmi_in_unit0_video_vblank),
        .In2(fmc_imageon_hdmi_in_unit0_video_de),
        .In3(fmc_imageon_hdmi_in_unit0_audio_spdif),
        .clk(clk_1),
        .reset_n(vbb_system_reset_0_system_reset_n));
  four_signal_registering1_imp_1F0B69H four_signal_registering1
       (.Dout(four_signal_registering1_Dout),
        .Dout1(four_signal_registering1_Dout1),
        .Dout2(four_signal_registering1_Dout2),
        .Dout3(four_signal_registering1_Dout3),
        .clk(clk_1),
        .de(four_signal_registering2_de_out),
        .hblank(four_signal_registering2_hblank_out),
        .reset_n(vbb_system_reset_0_system_reset_n),
        .spdif(four_signal_registering2_spdif_out),
        .vblank(four_signal_registering2_vblank_out));
  four_signal_registering2_imp_1HLU43S four_signal_registering2
       (.clk(clk_1),
        .de(morph_pass_sel_de_smth_sel),
        .de_out(four_signal_registering2_de_out),
        .hblank(morph_pass_sel_hblank_smth_sel),
        .hblank_out(four_signal_registering2_hblank_out),
        .reset_n(vbb_system_reset_0_system_reset_n),
        .spdif(morph_pass_sel_spdif_smth_sel),
        .spdif_out(four_signal_registering2_spdif_out),
        .vblank(morph_pass_sel_vblank_smth_sel),
        .vblank_out(four_signal_registering2_vblank_out));
  hdmi_sync_signals_passing_imp_18KNOZO hdmi_sync_signals_passing
       (.clk(clk_1),
        .de(pipeline_registers_1_pipe_out),
        .de_in(de_in_1),
        .hblank(pipeline_registers_4_pipe_out),
        .hblank_in(hblank_in_1),
        .reset_n(vbb_system_reset_0_system_reset_n),
        .spdif(pipeline_registers_5_pipe_out),
        .spdif_in(spdif_in_1),
        .vblank(pipeline_registers_2_pipe_out),
        .vblank_in(vblank_in_1));
  hdmi_directpassthr_woi_image_smoothing_1_0 image_smoothing_0
       (.Hblank_in(image_smoothing_full_version_0_Hblank_out),
        .Hblank_out(image_smoothing_1_Hblank_out),
        .Vblank_in(image_smoothing_full_version_0_Vblank_out),
        .Vblank_out(image_smoothing_1_Vblank_out),
        .clk(clk_1),
        .data_in(pipeline_registers_1_pipe_out1),
        .data_out(image_smoothing_1_data_out),
        .de_in(In2_1),
        .de_out(image_smoothing_1_de_out),
        .reset(vbb_system_reset_0_system_reset),
        .spdif_in(In3_1),
        .spdif_out(image_smoothing_1_spdif_out),
        .win_enable_in(mog_woi_det_window_enable),
        .win_enable_out(image_smoothing_1_win_enable_out));
  hdmi_directpassthr_woi_axi_window_of_interest_detection_0_0 mog_woi_det
       (.clk(clk_1),
        .input_video_hblank(fmc_imageon_hdmi_in_unit0_video_hblank),
        .input_video_vblank(fmc_imageon_hdmi_in_unit0_video_vblank),
        .rst(vbb_system_reset_0_system_reset),
        .s_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s_axi_araddr(processing_system7_0_axi_periph_M05_AXI_ARADDR[3:0]),
        .s_axi_aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .s_axi_arprot(processing_system7_0_axi_periph_M05_AXI_ARPROT),
        .s_axi_arready(processing_system7_0_axi_periph_M05_AXI_ARREADY),
        .s_axi_arvalid(processing_system7_0_axi_periph_M05_AXI_ARVALID),
        .s_axi_awaddr(processing_system7_0_axi_periph_M05_AXI_AWADDR[3:0]),
        .s_axi_awprot(processing_system7_0_axi_periph_M05_AXI_AWPROT),
        .s_axi_awready(processing_system7_0_axi_periph_M05_AXI_AWREADY),
        .s_axi_awvalid(processing_system7_0_axi_periph_M05_AXI_AWVALID),
        .s_axi_bready(processing_system7_0_axi_periph_M05_AXI_BREADY),
        .s_axi_bresp(processing_system7_0_axi_periph_M05_AXI_BRESP),
        .s_axi_bvalid(processing_system7_0_axi_periph_M05_AXI_BVALID),
        .s_axi_rdata(processing_system7_0_axi_periph_M05_AXI_RDATA),
        .s_axi_rready(processing_system7_0_axi_periph_M05_AXI_RREADY),
        .s_axi_rresp(processing_system7_0_axi_periph_M05_AXI_RRESP),
        .s_axi_rvalid(processing_system7_0_axi_periph_M05_AXI_RVALID),
        .s_axi_wdata(processing_system7_0_axi_periph_M05_AXI_WDATA),
        .s_axi_wready(processing_system7_0_axi_periph_M05_AXI_WREADY),
        .s_axi_wstrb(processing_system7_0_axi_periph_M05_AXI_WSTRB),
        .s_axi_wvalid(processing_system7_0_axi_periph_M05_AXI_WVALID),
        .window_enable(mog_woi_det_window_enable));
  morph_pass_sel_imp_15CC6XI morph_pass_sel
       (.de_after(Morphology_0_de_out),
        .de_before(pipeline_registers_1_pipe_out),
        .de_morph_sel(morph_pass_sel_de_smth_sel),
        .fg_after(Morphology_0_output_data_bit),
        .fg_before(MixtureOfGuassians_0_is_fg),
        .fg_morph_sel(morph_pass_sel_Dout),
        .hblank_after(Morphology_0_Hblank_out),
        .hblank_before(pipeline_registers_4_pipe_out),
        .hblank_morph_sel(morph_pass_sel_hblank_smth_sel),
        .sel(sel_1),
        .spdif_after(spdif_1),
        .spdif_before(pipeline_registers_5_pipe_out),
        .spdif_morph_sel(morph_pass_sel_spdif_smth_sel),
        .vblank_after(Morphology_0_Vblank_out),
        .vblank_before(pipeline_registers_2_pipe_out),
        .vblank_morph_sel(morph_pass_sel_vblank_smth_sel),
        .window_en_after(Morphology_0_win_enable_out),
        .window_en_before(MixtureOfGuassians_0_window_en_out),
        .windown_en_morph_sel(morph_pass_sel_windown_en_smth_sel));
  hdmi_directpassthr_woi_pipeline_registers_1_9 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(swap_dout),
        .pipe_out(pipeline_registers_1_pipe_out1),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_2_0 pipeline_registers_2
       (.clk(clk_1),
        .pipe_in(morph_pass_sel_windown_en_smth_sel),
        .pipe_out(pipeline_registers_2_pipe_out1),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_3_0 pipeline_registers_3
       (.clk(clk_1),
        .pipe_in(morph_pass_sel_Dout),
        .pipe_out(pipeline_registers_3_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_CLK1(processing_system7_0_FCLK_CLK1),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .FCLK_RESET2_N(processing_system7_0_FCLK_RESET2_N),
        .IRQ_F2P(xlconcat_0_dout),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(processing_system7_0_FCLK_CLK1),
        .S_AXI_HP0_ARADDR(axi_mem_intercon_M00_AXI_ARADDR),
        .S_AXI_HP0_ARBURST(axi_mem_intercon_M00_AXI_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_mem_intercon_M00_AXI_ARCACHE),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_ARID}),
        .S_AXI_HP0_ARLEN(axi_mem_intercon_M00_AXI_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_mem_intercon_M00_AXI_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_mem_intercon_M00_AXI_ARPROT),
        .S_AXI_HP0_ARQOS(axi_mem_intercon_M00_AXI_ARQOS),
        .S_AXI_HP0_ARREADY(axi_mem_intercon_M00_AXI_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_mem_intercon_M00_AXI_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_mem_intercon_M00_AXI_ARVALID),
        .S_AXI_HP0_AWADDR(axi_mem_intercon_M00_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axi_mem_intercon_M00_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_mem_intercon_M00_AXI_AWCACHE),
        .S_AXI_HP0_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_AWID}),
        .S_AXI_HP0_AWLEN(axi_mem_intercon_M00_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_mem_intercon_M00_AXI_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_mem_intercon_M00_AXI_AWPROT),
        .S_AXI_HP0_AWQOS(axi_mem_intercon_M00_AXI_AWQOS),
        .S_AXI_HP0_AWREADY(axi_mem_intercon_M00_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_mem_intercon_M00_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_mem_intercon_M00_AXI_AWVALID),
        .S_AXI_HP0_BID(axi_mem_intercon_M00_AXI_BID),
        .S_AXI_HP0_BREADY(axi_mem_intercon_M00_AXI_BREADY),
        .S_AXI_HP0_BRESP(axi_mem_intercon_M00_AXI_BRESP),
        .S_AXI_HP0_BVALID(axi_mem_intercon_M00_AXI_BVALID),
        .S_AXI_HP0_RDATA(axi_mem_intercon_M00_AXI_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RID(axi_mem_intercon_M00_AXI_RID),
        .S_AXI_HP0_RLAST(axi_mem_intercon_M00_AXI_RLAST),
        .S_AXI_HP0_RREADY(axi_mem_intercon_M00_AXI_RREADY),
        .S_AXI_HP0_RRESP(axi_mem_intercon_M00_AXI_RRESP),
        .S_AXI_HP0_RVALID(axi_mem_intercon_M00_AXI_RVALID),
        .S_AXI_HP0_WDATA(axi_mem_intercon_M00_AXI_WDATA),
        .S_AXI_HP0_WID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_M00_AXI_WID}),
        .S_AXI_HP0_WLAST(axi_mem_intercon_M00_AXI_WLAST),
        .S_AXI_HP0_WREADY(axi_mem_intercon_M00_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axi_mem_intercon_M00_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axi_mem_intercon_M00_AXI_WVALID),
        .S_AXI_HP1_ACLK(processing_system7_0_FCLK_CLK1),
        .S_AXI_HP1_ARADDR(axi_mem_intercon_1_M00_AXI_ARADDR),
        .S_AXI_HP1_ARBURST(axi_mem_intercon_1_M00_AXI_ARBURST),
        .S_AXI_HP1_ARCACHE(axi_mem_intercon_1_M00_AXI_ARCACHE),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN(axi_mem_intercon_1_M00_AXI_ARLEN),
        .S_AXI_HP1_ARLOCK(axi_mem_intercon_1_M00_AXI_ARLOCK),
        .S_AXI_HP1_ARPROT(axi_mem_intercon_1_M00_AXI_ARPROT),
        .S_AXI_HP1_ARQOS(axi_mem_intercon_1_M00_AXI_ARQOS),
        .S_AXI_HP1_ARREADY(axi_mem_intercon_1_M00_AXI_ARREADY),
        .S_AXI_HP1_ARSIZE(axi_mem_intercon_1_M00_AXI_ARSIZE),
        .S_AXI_HP1_ARVALID(axi_mem_intercon_1_M00_AXI_ARVALID),
        .S_AXI_HP1_AWADDR(axi_mem_intercon_1_M00_AXI_AWADDR),
        .S_AXI_HP1_AWBURST(axi_mem_intercon_1_M00_AXI_AWBURST),
        .S_AXI_HP1_AWCACHE(axi_mem_intercon_1_M00_AXI_AWCACHE),
        .S_AXI_HP1_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWLEN(axi_mem_intercon_1_M00_AXI_AWLEN),
        .S_AXI_HP1_AWLOCK(axi_mem_intercon_1_M00_AXI_AWLOCK),
        .S_AXI_HP1_AWPROT(axi_mem_intercon_1_M00_AXI_AWPROT),
        .S_AXI_HP1_AWQOS(axi_mem_intercon_1_M00_AXI_AWQOS),
        .S_AXI_HP1_AWREADY(axi_mem_intercon_1_M00_AXI_AWREADY),
        .S_AXI_HP1_AWSIZE(axi_mem_intercon_1_M00_AXI_AWSIZE),
        .S_AXI_HP1_AWVALID(axi_mem_intercon_1_M00_AXI_AWVALID),
        .S_AXI_HP1_BREADY(axi_mem_intercon_1_M00_AXI_BREADY),
        .S_AXI_HP1_BRESP(axi_mem_intercon_1_M00_AXI_BRESP),
        .S_AXI_HP1_BVALID(axi_mem_intercon_1_M00_AXI_BVALID),
        .S_AXI_HP1_RDATA(axi_mem_intercon_1_M00_AXI_RDATA),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RLAST(axi_mem_intercon_1_M00_AXI_RLAST),
        .S_AXI_HP1_RREADY(axi_mem_intercon_1_M00_AXI_RREADY),
        .S_AXI_HP1_RRESP(axi_mem_intercon_1_M00_AXI_RRESP),
        .S_AXI_HP1_RVALID(axi_mem_intercon_1_M00_AXI_RVALID),
        .S_AXI_HP1_WDATA(axi_mem_intercon_1_M00_AXI_WDATA),
        .S_AXI_HP1_WID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_WLAST(axi_mem_intercon_1_M00_AXI_WLAST),
        .S_AXI_HP1_WREADY(axi_mem_intercon_1_M00_AXI_WREADY),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB(axi_mem_intercon_1_M00_AXI_WSTRB),
        .S_AXI_HP1_WVALID(axi_mem_intercon_1_M00_AXI_WVALID),
        .S_AXI_HP2_ACLK(processing_system7_0_FCLK_CLK1),
        .S_AXI_HP2_ARADDR(axi_mem_intercon_2_M00_AXI_ARADDR),
        .S_AXI_HP2_ARBURST(axi_mem_intercon_2_M00_AXI_ARBURST),
        .S_AXI_HP2_ARCACHE(axi_mem_intercon_2_M00_AXI_ARCACHE),
        .S_AXI_HP2_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_2_M00_AXI_ARID}),
        .S_AXI_HP2_ARLEN(axi_mem_intercon_2_M00_AXI_ARLEN),
        .S_AXI_HP2_ARLOCK(axi_mem_intercon_2_M00_AXI_ARLOCK),
        .S_AXI_HP2_ARPROT(axi_mem_intercon_2_M00_AXI_ARPROT),
        .S_AXI_HP2_ARQOS(axi_mem_intercon_2_M00_AXI_ARQOS),
        .S_AXI_HP2_ARREADY(axi_mem_intercon_2_M00_AXI_ARREADY),
        .S_AXI_HP2_ARSIZE(axi_mem_intercon_2_M00_AXI_ARSIZE),
        .S_AXI_HP2_ARVALID(axi_mem_intercon_2_M00_AXI_ARVALID),
        .S_AXI_HP2_AWADDR(axi_mem_intercon_2_M00_AXI_AWADDR),
        .S_AXI_HP2_AWBURST(axi_mem_intercon_2_M00_AXI_AWBURST),
        .S_AXI_HP2_AWCACHE(axi_mem_intercon_2_M00_AXI_AWCACHE),
        .S_AXI_HP2_AWID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_2_M00_AXI_AWID}),
        .S_AXI_HP2_AWLEN(axi_mem_intercon_2_M00_AXI_AWLEN),
        .S_AXI_HP2_AWLOCK(axi_mem_intercon_2_M00_AXI_AWLOCK),
        .S_AXI_HP2_AWPROT(axi_mem_intercon_2_M00_AXI_AWPROT),
        .S_AXI_HP2_AWQOS(axi_mem_intercon_2_M00_AXI_AWQOS),
        .S_AXI_HP2_AWREADY(axi_mem_intercon_2_M00_AXI_AWREADY),
        .S_AXI_HP2_AWSIZE(axi_mem_intercon_2_M00_AXI_AWSIZE),
        .S_AXI_HP2_AWVALID(axi_mem_intercon_2_M00_AXI_AWVALID),
        .S_AXI_HP2_BID(axi_mem_intercon_2_M00_AXI_BID),
        .S_AXI_HP2_BREADY(axi_mem_intercon_2_M00_AXI_BREADY),
        .S_AXI_HP2_BRESP(axi_mem_intercon_2_M00_AXI_BRESP),
        .S_AXI_HP2_BVALID(axi_mem_intercon_2_M00_AXI_BVALID),
        .S_AXI_HP2_RDATA(axi_mem_intercon_2_M00_AXI_RDATA),
        .S_AXI_HP2_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP2_RID(axi_mem_intercon_2_M00_AXI_RID),
        .S_AXI_HP2_RLAST(axi_mem_intercon_2_M00_AXI_RLAST),
        .S_AXI_HP2_RREADY(axi_mem_intercon_2_M00_AXI_RREADY),
        .S_AXI_HP2_RRESP(axi_mem_intercon_2_M00_AXI_RRESP),
        .S_AXI_HP2_RVALID(axi_mem_intercon_2_M00_AXI_RVALID),
        .S_AXI_HP2_WDATA(axi_mem_intercon_2_M00_AXI_WDATA),
        .S_AXI_HP2_WID({1'b0,1'b0,1'b0,1'b0,1'b0,axi_mem_intercon_2_M00_AXI_WID}),
        .S_AXI_HP2_WLAST(axi_mem_intercon_2_M00_AXI_WLAST),
        .S_AXI_HP2_WREADY(axi_mem_intercon_2_M00_AXI_WREADY),
        .S_AXI_HP2_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP2_WSTRB(axi_mem_intercon_2_M00_AXI_WSTRB),
        .S_AXI_HP2_WVALID(axi_mem_intercon_2_M00_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  hdmi_directpassthr_woi_processing_system7_0_axi_periph_0 processing_system7_0_axi_periph
       (.ACLK(processing_system7_0_FCLK_CLK0),
        .ARESETN(rst_processing_system7_0_100M_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_FCLK_CLK0),
        .M00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M00_AXI_araddr(processing_system7_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(processing_system7_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(processing_system7_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(processing_system7_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(processing_system7_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(processing_system7_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(processing_system7_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(processing_system7_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(processing_system7_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(processing_system7_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(processing_system7_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(processing_system7_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(processing_system7_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(processing_system7_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(processing_system7_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(processing_system7_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(processing_system7_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(processing_system7_0_FCLK_CLK0),
        .M01_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M01_AXI_araddr(processing_system7_0_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(processing_system7_0_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(processing_system7_0_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(processing_system7_0_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(processing_system7_0_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(processing_system7_0_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(processing_system7_0_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(processing_system7_0_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(processing_system7_0_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(processing_system7_0_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(processing_system7_0_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(processing_system7_0_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(processing_system7_0_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(processing_system7_0_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(processing_system7_0_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(processing_system7_0_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(processing_system7_0_FCLK_CLK0),
        .M02_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M02_AXI_araddr(processing_system7_0_axi_periph_M02_AXI_ARADDR),
        .M02_AXI_arready(processing_system7_0_axi_periph_M02_AXI_ARREADY),
        .M02_AXI_arvalid(processing_system7_0_axi_periph_M02_AXI_ARVALID),
        .M02_AXI_awaddr(processing_system7_0_axi_periph_M02_AXI_AWADDR),
        .M02_AXI_awready(processing_system7_0_axi_periph_M02_AXI_AWREADY),
        .M02_AXI_awvalid(processing_system7_0_axi_periph_M02_AXI_AWVALID),
        .M02_AXI_bready(processing_system7_0_axi_periph_M02_AXI_BREADY),
        .M02_AXI_bresp(processing_system7_0_axi_periph_M02_AXI_BRESP),
        .M02_AXI_bvalid(processing_system7_0_axi_periph_M02_AXI_BVALID),
        .M02_AXI_rdata(processing_system7_0_axi_periph_M02_AXI_RDATA),
        .M02_AXI_rready(processing_system7_0_axi_periph_M02_AXI_RREADY),
        .M02_AXI_rresp(processing_system7_0_axi_periph_M02_AXI_RRESP),
        .M02_AXI_rvalid(processing_system7_0_axi_periph_M02_AXI_RVALID),
        .M02_AXI_wdata(processing_system7_0_axi_periph_M02_AXI_WDATA),
        .M02_AXI_wready(processing_system7_0_axi_periph_M02_AXI_WREADY),
        .M02_AXI_wvalid(processing_system7_0_axi_periph_M02_AXI_WVALID),
        .M03_ACLK(processing_system7_0_FCLK_CLK0),
        .M03_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M03_AXI_araddr(processing_system7_0_axi_periph_M03_AXI_ARADDR),
        .M03_AXI_arready(processing_system7_0_axi_periph_M03_AXI_ARREADY),
        .M03_AXI_arvalid(processing_system7_0_axi_periph_M03_AXI_ARVALID),
        .M03_AXI_awaddr(processing_system7_0_axi_periph_M03_AXI_AWADDR),
        .M03_AXI_awready(processing_system7_0_axi_periph_M03_AXI_AWREADY),
        .M03_AXI_awvalid(processing_system7_0_axi_periph_M03_AXI_AWVALID),
        .M03_AXI_bready(processing_system7_0_axi_periph_M03_AXI_BREADY),
        .M03_AXI_bresp(processing_system7_0_axi_periph_M03_AXI_BRESP),
        .M03_AXI_bvalid(processing_system7_0_axi_periph_M03_AXI_BVALID),
        .M03_AXI_rdata(processing_system7_0_axi_periph_M03_AXI_RDATA),
        .M03_AXI_rready(processing_system7_0_axi_periph_M03_AXI_RREADY),
        .M03_AXI_rresp(processing_system7_0_axi_periph_M03_AXI_RRESP),
        .M03_AXI_rvalid(processing_system7_0_axi_periph_M03_AXI_RVALID),
        .M03_AXI_wdata(processing_system7_0_axi_periph_M03_AXI_WDATA),
        .M03_AXI_wready(processing_system7_0_axi_periph_M03_AXI_WREADY),
        .M03_AXI_wvalid(processing_system7_0_axi_periph_M03_AXI_WVALID),
        .M04_ACLK(processing_system7_0_FCLK_CLK0),
        .M04_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M04_AXI_araddr(processing_system7_0_axi_periph_M04_AXI_ARADDR),
        .M04_AXI_arprot(processing_system7_0_axi_periph_M04_AXI_ARPROT),
        .M04_AXI_arready(processing_system7_0_axi_periph_M04_AXI_ARREADY),
        .M04_AXI_arvalid(processing_system7_0_axi_periph_M04_AXI_ARVALID),
        .M04_AXI_awaddr(processing_system7_0_axi_periph_M04_AXI_AWADDR),
        .M04_AXI_awprot(processing_system7_0_axi_periph_M04_AXI_AWPROT),
        .M04_AXI_awready(processing_system7_0_axi_periph_M04_AXI_AWREADY),
        .M04_AXI_awvalid(processing_system7_0_axi_periph_M04_AXI_AWVALID),
        .M04_AXI_bready(processing_system7_0_axi_periph_M04_AXI_BREADY),
        .M04_AXI_bresp(processing_system7_0_axi_periph_M04_AXI_BRESP),
        .M04_AXI_bvalid(processing_system7_0_axi_periph_M04_AXI_BVALID),
        .M04_AXI_rdata(processing_system7_0_axi_periph_M04_AXI_RDATA),
        .M04_AXI_rready(processing_system7_0_axi_periph_M04_AXI_RREADY),
        .M04_AXI_rresp(processing_system7_0_axi_periph_M04_AXI_RRESP),
        .M04_AXI_rvalid(processing_system7_0_axi_periph_M04_AXI_RVALID),
        .M04_AXI_wdata(processing_system7_0_axi_periph_M04_AXI_WDATA),
        .M04_AXI_wready(processing_system7_0_axi_periph_M04_AXI_WREADY),
        .M04_AXI_wstrb(processing_system7_0_axi_periph_M04_AXI_WSTRB),
        .M04_AXI_wvalid(processing_system7_0_axi_periph_M04_AXI_WVALID),
        .M05_ACLK(processing_system7_0_FCLK_CLK0),
        .M05_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M05_AXI_araddr(processing_system7_0_axi_periph_M05_AXI_ARADDR),
        .M05_AXI_arprot(processing_system7_0_axi_periph_M05_AXI_ARPROT),
        .M05_AXI_arready(processing_system7_0_axi_periph_M05_AXI_ARREADY),
        .M05_AXI_arvalid(processing_system7_0_axi_periph_M05_AXI_ARVALID),
        .M05_AXI_awaddr(processing_system7_0_axi_periph_M05_AXI_AWADDR),
        .M05_AXI_awprot(processing_system7_0_axi_periph_M05_AXI_AWPROT),
        .M05_AXI_awready(processing_system7_0_axi_periph_M05_AXI_AWREADY),
        .M05_AXI_awvalid(processing_system7_0_axi_periph_M05_AXI_AWVALID),
        .M05_AXI_bready(processing_system7_0_axi_periph_M05_AXI_BREADY),
        .M05_AXI_bresp(processing_system7_0_axi_periph_M05_AXI_BRESP),
        .M05_AXI_bvalid(processing_system7_0_axi_periph_M05_AXI_BVALID),
        .M05_AXI_rdata(processing_system7_0_axi_periph_M05_AXI_RDATA),
        .M05_AXI_rready(processing_system7_0_axi_periph_M05_AXI_RREADY),
        .M05_AXI_rresp(processing_system7_0_axi_periph_M05_AXI_RRESP),
        .M05_AXI_rvalid(processing_system7_0_axi_periph_M05_AXI_RVALID),
        .M05_AXI_wdata(processing_system7_0_axi_periph_M05_AXI_WDATA),
        .M05_AXI_wready(processing_system7_0_axi_periph_M05_AXI_WREADY),
        .M05_AXI_wstrb(processing_system7_0_axi_periph_M05_AXI_WSTRB),
        .M05_AXI_wvalid(processing_system7_0_axi_periph_M05_AXI_WVALID),
        .M06_ACLK(processing_system7_0_FCLK_CLK0),
        .M06_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .M06_AXI_araddr(processing_system7_0_axi_periph_M06_AXI_ARADDR),
        .M06_AXI_arprot(processing_system7_0_axi_periph_M06_AXI_ARPROT),
        .M06_AXI_arready(processing_system7_0_axi_periph_M06_AXI_ARREADY),
        .M06_AXI_arvalid(processing_system7_0_axi_periph_M06_AXI_ARVALID),
        .M06_AXI_awaddr(processing_system7_0_axi_periph_M06_AXI_AWADDR),
        .M06_AXI_awprot(processing_system7_0_axi_periph_M06_AXI_AWPROT),
        .M06_AXI_awready(processing_system7_0_axi_periph_M06_AXI_AWREADY),
        .M06_AXI_awvalid(processing_system7_0_axi_periph_M06_AXI_AWVALID),
        .M06_AXI_bready(processing_system7_0_axi_periph_M06_AXI_BREADY),
        .M06_AXI_bresp(processing_system7_0_axi_periph_M06_AXI_BRESP),
        .M06_AXI_bvalid(processing_system7_0_axi_periph_M06_AXI_BVALID),
        .M06_AXI_rdata(processing_system7_0_axi_periph_M06_AXI_RDATA),
        .M06_AXI_rready(processing_system7_0_axi_periph_M06_AXI_RREADY),
        .M06_AXI_rresp(processing_system7_0_axi_periph_M06_AXI_RRESP),
        .M06_AXI_rvalid(processing_system7_0_axi_periph_M06_AXI_RVALID),
        .M06_AXI_wdata(processing_system7_0_axi_periph_M06_AXI_WDATA),
        .M06_AXI_wready(processing_system7_0_axi_periph_M06_AXI_WREADY),
        .M06_AXI_wstrb(processing_system7_0_axi_periph_M06_AXI_WSTRB),
        .M06_AXI_wvalid(processing_system7_0_axi_periph_M06_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK0),
        .S00_ARESETN(rst_processing_system7_0_100M_peripheral_aresetn),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  hdmi_directpassthr_woi_rst_processing_system7_0_100M_0 rst_processing_system7_0_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_processing_system7_0_100M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK0));
  hdmi_directpassthr_woi_rst_processing_system7_0_150M_0 rst_processing_system7_0_150M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_processing_system7_0_150M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_processing_system7_0_150M_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK1));
  smth_pass_sel_imp_1J0MEQD smth_pass_sel
       (.de_after(image_smoothing_1_de_out),
        .de_before(In2_1),
        .de_smth_sel(de_in_1),
        .hblank_after(image_smoothing_1_Hblank_out),
        .hblank_before(image_smoothing_full_version_0_Hblank_out),
        .hblank_smth_sel(hblank_in_1),
        .sel(smth_sel_1),
        .spdif_after(image_smoothing_1_spdif_out),
        .spdif_before(In3_1),
        .spdif_smth_sel(spdif_in_1),
        .vblank_after(image_smoothing_1_Vblank_out),
        .vblank_before(image_smoothing_full_version_0_Vblank_out),
        .vblank_smth_sel(vblank_in_1),
        .window_en_after(image_smoothing_1_win_enable_out),
        .window_en_before(mog_woi_det_window_enable),
        .windown_en_smth_sel(window_enable_1),
        .ycbcr_after(image_smoothing_1_data_out),
        .ycbcr_before(pipeline_registers_1_pipe_out1),
        .ycbcr_smth_sel(Din_1));
  hdmi_directpassthr_woi_vbb_system_reset_0_1 vbb_system_reset_0
       (.clk(clk_1),
        .ext_reset(xlconstant_0_dout),
        .ext_reset_n(processing_system7_0_FCLK_RESET2_N),
        .system_reset(vbb_system_reset_0_system_reset),
        .system_reset_n(vbb_system_reset_0_system_reset_n),
        .vblank(fmc_imageon_hdmi_in_unit0_video_vblank));
  video_overlay_unit_imp_15COLBP video_overlay_unit
       (.M_AXI_MM2S_araddr(S00_AXI_1_ARADDR),
        .M_AXI_MM2S_arburst(S00_AXI_1_ARBURST),
        .M_AXI_MM2S_arcache(S00_AXI_1_ARCACHE),
        .M_AXI_MM2S_arlen(S00_AXI_1_ARLEN),
        .M_AXI_MM2S_arprot(S00_AXI_1_ARPROT),
        .M_AXI_MM2S_arready(S00_AXI_1_ARREADY),
        .M_AXI_MM2S_arsize(S00_AXI_1_ARSIZE),
        .M_AXI_MM2S_arvalid(S00_AXI_1_ARVALID),
        .M_AXI_MM2S_rdata(S00_AXI_1_RDATA),
        .M_AXI_MM2S_rlast(S00_AXI_1_RLAST),
        .M_AXI_MM2S_rready(S00_AXI_1_RREADY),
        .M_AXI_MM2S_rresp(S00_AXI_1_RRESP),
        .M_AXI_MM2S_rvalid(S00_AXI_1_RVALID),
        .M_AXI_S2MM_awaddr(video_overlay_unit_M_AXI_S2MM_AWADDR),
        .M_AXI_S2MM_awburst(video_overlay_unit_M_AXI_S2MM_AWBURST),
        .M_AXI_S2MM_awcache(video_overlay_unit_M_AXI_S2MM_AWCACHE),
        .M_AXI_S2MM_awlen(video_overlay_unit_M_AXI_S2MM_AWLEN),
        .M_AXI_S2MM_awprot(video_overlay_unit_M_AXI_S2MM_AWPROT),
        .M_AXI_S2MM_awready(video_overlay_unit_M_AXI_S2MM_AWREADY),
        .M_AXI_S2MM_awsize(video_overlay_unit_M_AXI_S2MM_AWSIZE),
        .M_AXI_S2MM_awvalid(video_overlay_unit_M_AXI_S2MM_AWVALID),
        .M_AXI_S2MM_bready(video_overlay_unit_M_AXI_S2MM_BREADY),
        .M_AXI_S2MM_bresp(video_overlay_unit_M_AXI_S2MM_BRESP),
        .M_AXI_S2MM_bvalid(video_overlay_unit_M_AXI_S2MM_BVALID),
        .M_AXI_S2MM_wdata(video_overlay_unit_M_AXI_S2MM_WDATA),
        .M_AXI_S2MM_wlast(video_overlay_unit_M_AXI_S2MM_WLAST),
        .M_AXI_S2MM_wready(video_overlay_unit_M_AXI_S2MM_WREADY),
        .M_AXI_S2MM_wstrb(video_overlay_unit_M_AXI_S2MM_WSTRB),
        .M_AXI_S2MM_wvalid(video_overlay_unit_M_AXI_S2MM_WVALID),
        .S_AXI_LITE_araddr(processing_system7_0_axi_periph_M01_AXI_ARADDR),
        .S_AXI_LITE_arready(processing_system7_0_axi_periph_M01_AXI_ARREADY),
        .S_AXI_LITE_arvalid(processing_system7_0_axi_periph_M01_AXI_ARVALID),
        .S_AXI_LITE_awaddr(processing_system7_0_axi_periph_M01_AXI_AWADDR),
        .S_AXI_LITE_awready(processing_system7_0_axi_periph_M01_AXI_AWREADY),
        .S_AXI_LITE_awvalid(processing_system7_0_axi_periph_M01_AXI_AWVALID),
        .S_AXI_LITE_bready(processing_system7_0_axi_periph_M01_AXI_BREADY),
        .S_AXI_LITE_bresp(processing_system7_0_axi_periph_M01_AXI_BRESP),
        .S_AXI_LITE_bvalid(processing_system7_0_axi_periph_M01_AXI_BVALID),
        .S_AXI_LITE_rdata(processing_system7_0_axi_periph_M01_AXI_RDATA),
        .S_AXI_LITE_rready(processing_system7_0_axi_periph_M01_AXI_RREADY),
        .S_AXI_LITE_rresp(processing_system7_0_axi_periph_M01_AXI_RRESP),
        .S_AXI_LITE_rvalid(processing_system7_0_axi_periph_M01_AXI_RVALID),
        .S_AXI_LITE_wdata(processing_system7_0_axi_periph_M01_AXI_WDATA),
        .S_AXI_LITE_wready(processing_system7_0_axi_periph_M01_AXI_WREADY),
        .S_AXI_LITE_wvalid(processing_system7_0_axi_periph_M01_AXI_WVALID),
        .S_AXI_araddr(processing_system7_0_axi_periph_M06_AXI_ARADDR),
        .S_AXI_arprot(processing_system7_0_axi_periph_M06_AXI_ARPROT),
        .S_AXI_arready(processing_system7_0_axi_periph_M06_AXI_ARREADY),
        .S_AXI_arvalid(processing_system7_0_axi_periph_M06_AXI_ARVALID),
        .S_AXI_awaddr(processing_system7_0_axi_periph_M06_AXI_AWADDR),
        .S_AXI_awprot(processing_system7_0_axi_periph_M06_AXI_AWPROT),
        .S_AXI_awready(processing_system7_0_axi_periph_M06_AXI_AWREADY),
        .S_AXI_awvalid(processing_system7_0_axi_periph_M06_AXI_AWVALID),
        .S_AXI_bready(processing_system7_0_axi_periph_M06_AXI_BREADY),
        .S_AXI_bresp(processing_system7_0_axi_periph_M06_AXI_BRESP),
        .S_AXI_bvalid(processing_system7_0_axi_periph_M06_AXI_BVALID),
        .S_AXI_rdata(processing_system7_0_axi_periph_M06_AXI_RDATA),
        .S_AXI_rready(processing_system7_0_axi_periph_M06_AXI_RREADY),
        .S_AXI_rresp(processing_system7_0_axi_periph_M06_AXI_RRESP),
        .S_AXI_rvalid(processing_system7_0_axi_periph_M06_AXI_RVALID),
        .S_AXI_wdata(processing_system7_0_axi_periph_M06_AXI_WDATA),
        .S_AXI_wready(processing_system7_0_axi_periph_M06_AXI_WREADY),
        .S_AXI_wstrb(processing_system7_0_axi_periph_M06_AXI_WSTRB),
        .S_AXI_wvalid(processing_system7_0_axi_periph_M06_AXI_WVALID),
        .axi_clk(processing_system7_0_FCLK_CLK1),
        .axi_resetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .grayscale_pixel_in_orig(xlslice_0_Dout),
        .hdmi_clk(clk_1),
        .input_video_hblank(four_signal_registering2_hblank_out),
        .input_video_vblank(four_signal_registering2_vblank_out),
        .is_fg(pipeline_registers_3_pipe_out),
        .mm2s_introut(video_overlay_unit_mm2s_introut),
        .mog_window_enable(pipeline_registers_2_pipe_out1),
        .output_source(output_source_1),
        .s2mm_introut(video_overlay_unit_s2mm_introut),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0),
        .system_reset(vbb_system_reset_0_system_reset),
        .system_reset_n(vbb_system_reset_0_system_reset_n),
        .video_color_data_smth({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .video_data_out(video_overlay_0_video_data_out),
        .video_grayscale_data_smth({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ycbcr_data_in_orig(ycbcr_orig_rebuild_dout));
  hdmi_directpassthr_woi_xlconstant_0_10 xlconstant_0
       (.dout(xlconstant_0_dout));
  ycbcr2gray_imp_17699X5 ycbcr2gray
       (.Din(Din_1),
        .Dout(ycbcr2gray_Dout));
  ycbcr2mem_unit_imp_19QCTOK ycbcr2mem_unit
       (.M_AXI_MM2S_araddr(ycbcr_vdma_M_AXI_MM2S_ARADDR),
        .M_AXI_MM2S_arburst(ycbcr_vdma_M_AXI_MM2S_ARBURST),
        .M_AXI_MM2S_arcache(ycbcr_vdma_M_AXI_MM2S_ARCACHE),
        .M_AXI_MM2S_arlen(ycbcr_vdma_M_AXI_MM2S_ARLEN),
        .M_AXI_MM2S_arprot(ycbcr_vdma_M_AXI_MM2S_ARPROT),
        .M_AXI_MM2S_arready(ycbcr_vdma_M_AXI_MM2S_ARREADY),
        .M_AXI_MM2S_arsize(ycbcr_vdma_M_AXI_MM2S_ARSIZE),
        .M_AXI_MM2S_arvalid(ycbcr_vdma_M_AXI_MM2S_ARVALID),
        .M_AXI_MM2S_rdata(ycbcr_vdma_M_AXI_MM2S_RDATA),
        .M_AXI_MM2S_rlast(ycbcr_vdma_M_AXI_MM2S_RLAST),
        .M_AXI_MM2S_rready(ycbcr_vdma_M_AXI_MM2S_RREADY),
        .M_AXI_MM2S_rresp(ycbcr_vdma_M_AXI_MM2S_RRESP),
        .M_AXI_MM2S_rvalid(ycbcr_vdma_M_AXI_MM2S_RVALID),
        .M_AXI_S2MM_awaddr(ycbcr_vdma_M_AXI_S2MM_AWADDR),
        .M_AXI_S2MM_awburst(ycbcr_vdma_M_AXI_S2MM_AWBURST),
        .M_AXI_S2MM_awcache(ycbcr_vdma_M_AXI_S2MM_AWCACHE),
        .M_AXI_S2MM_awlen(ycbcr_vdma_M_AXI_S2MM_AWLEN),
        .M_AXI_S2MM_awprot(ycbcr_vdma_M_AXI_S2MM_AWPROT),
        .M_AXI_S2MM_awready(ycbcr_vdma_M_AXI_S2MM_AWREADY),
        .M_AXI_S2MM_awsize(ycbcr_vdma_M_AXI_S2MM_AWSIZE),
        .M_AXI_S2MM_awvalid(ycbcr_vdma_M_AXI_S2MM_AWVALID),
        .M_AXI_S2MM_bready(ycbcr_vdma_M_AXI_S2MM_BREADY),
        .M_AXI_S2MM_bresp(ycbcr_vdma_M_AXI_S2MM_BRESP),
        .M_AXI_S2MM_bvalid(ycbcr_vdma_M_AXI_S2MM_BVALID),
        .M_AXI_S2MM_wdata(ycbcr_vdma_M_AXI_S2MM_WDATA),
        .M_AXI_S2MM_wlast(ycbcr_vdma_M_AXI_S2MM_WLAST),
        .M_AXI_S2MM_wready(ycbcr_vdma_M_AXI_S2MM_WREADY),
        .M_AXI_S2MM_wstrb(ycbcr_vdma_M_AXI_S2MM_WSTRB),
        .M_AXI_S2MM_wvalid(ycbcr_vdma_M_AXI_S2MM_WVALID),
        .S_AXI_LITE_araddr(processing_system7_0_axi_periph_M03_AXI_ARADDR),
        .S_AXI_LITE_arready(processing_system7_0_axi_periph_M03_AXI_ARREADY),
        .S_AXI_LITE_arvalid(processing_system7_0_axi_periph_M03_AXI_ARVALID),
        .S_AXI_LITE_awaddr(processing_system7_0_axi_periph_M03_AXI_AWADDR),
        .S_AXI_LITE_awready(processing_system7_0_axi_periph_M03_AXI_AWREADY),
        .S_AXI_LITE_awvalid(processing_system7_0_axi_periph_M03_AXI_AWVALID),
        .S_AXI_LITE_bready(processing_system7_0_axi_periph_M03_AXI_BREADY),
        .S_AXI_LITE_bresp(processing_system7_0_axi_periph_M03_AXI_BRESP),
        .S_AXI_LITE_bvalid(processing_system7_0_axi_periph_M03_AXI_BVALID),
        .S_AXI_LITE_rdata(processing_system7_0_axi_periph_M03_AXI_RDATA),
        .S_AXI_LITE_rready(processing_system7_0_axi_periph_M03_AXI_RREADY),
        .S_AXI_LITE_rresp(processing_system7_0_axi_periph_M03_AXI_RRESP),
        .S_AXI_LITE_rvalid(processing_system7_0_axi_periph_M03_AXI_RVALID),
        .S_AXI_LITE_wdata(processing_system7_0_axi_periph_M03_AXI_WDATA),
        .S_AXI_LITE_wready(processing_system7_0_axi_periph_M03_AXI_WREADY),
        .S_AXI_LITE_wvalid(processing_system7_0_axi_periph_M03_AXI_WVALID),
        .axi_resetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .clk(clk_1),
        .m_axi_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .rst(vbb_system_reset_0_system_reset),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0),
        .system_resetn(vbb_system_reset_0_system_reset_n),
        .window_en(pipeline_registers_2_pipe_out1),
        .ycbcr_data(ycbcr_orig_rebuild_dout));
  hdmi_directpassthr_woi_xlslice_0_9 ycbcr_to_grayscale
       (.Din(ycbcr_orig_rebuild_dout),
        .Dout(xlslice_0_Dout));
endmodule

module hdmi_directpassthr_woi_axi_mem_intercon_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [0:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  output [31:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awprot;
  output [0:0]S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input [0:0]S01_AXI_awvalid;
  input [0:0]S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_bvalid;
  input [31:0]S01_AXI_wdata;
  input [0:0]S01_AXI_wlast;
  output [0:0]S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire axi_mem_intercon_ACLK_net;
  wire axi_mem_intercon_ARESETN_net;
  wire [31:0]axi_mem_intercon_to_s00_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_to_s00_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mem_intercon_to_s00_couplers_ARLEN;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARPROT;
  wire [0:0]axi_mem_intercon_to_s00_couplers_ARREADY;
  wire [2:0]axi_mem_intercon_to_s00_couplers_ARSIZE;
  wire [0:0]axi_mem_intercon_to_s00_couplers_ARVALID;
  wire [31:0]axi_mem_intercon_to_s00_couplers_RDATA;
  wire [0:0]axi_mem_intercon_to_s00_couplers_RLAST;
  wire [0:0]axi_mem_intercon_to_s00_couplers_RREADY;
  wire [1:0]axi_mem_intercon_to_s00_couplers_RRESP;
  wire [0:0]axi_mem_intercon_to_s00_couplers_RVALID;
  wire [31:0]axi_mem_intercon_to_s01_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_to_s01_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_to_s01_couplers_AWCACHE;
  wire [7:0]axi_mem_intercon_to_s01_couplers_AWLEN;
  wire [2:0]axi_mem_intercon_to_s01_couplers_AWPROT;
  wire [0:0]axi_mem_intercon_to_s01_couplers_AWREADY;
  wire [2:0]axi_mem_intercon_to_s01_couplers_AWSIZE;
  wire [0:0]axi_mem_intercon_to_s01_couplers_AWVALID;
  wire [0:0]axi_mem_intercon_to_s01_couplers_BREADY;
  wire [1:0]axi_mem_intercon_to_s01_couplers_BRESP;
  wire [0:0]axi_mem_intercon_to_s01_couplers_BVALID;
  wire [31:0]axi_mem_intercon_to_s01_couplers_WDATA;
  wire [0:0]axi_mem_intercon_to_s01_couplers_WLAST;
  wire [0:0]axi_mem_intercon_to_s01_couplers_WREADY;
  wire [3:0]axi_mem_intercon_to_s01_couplers_WSTRB;
  wire [0:0]axi_mem_intercon_to_s01_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_ARADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_ARBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARCACHE;
  wire [0:0]m00_couplers_to_axi_mem_intercon_ARID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_ARLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_ARPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_ARQOS;
  wire m00_couplers_to_axi_mem_intercon_ARREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_ARSIZE;
  wire m00_couplers_to_axi_mem_intercon_ARVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_AWADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_AWBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWCACHE;
  wire [0:0]m00_couplers_to_axi_mem_intercon_AWID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_AWLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_AWPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_AWQOS;
  wire m00_couplers_to_axi_mem_intercon_AWREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_AWSIZE;
  wire m00_couplers_to_axi_mem_intercon_AWVALID;
  wire [5:0]m00_couplers_to_axi_mem_intercon_BID;
  wire m00_couplers_to_axi_mem_intercon_BREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_BRESP;
  wire m00_couplers_to_axi_mem_intercon_BVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_RDATA;
  wire [5:0]m00_couplers_to_axi_mem_intercon_RID;
  wire m00_couplers_to_axi_mem_intercon_RLAST;
  wire m00_couplers_to_axi_mem_intercon_RREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_RRESP;
  wire m00_couplers_to_axi_mem_intercon_RVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_WDATA;
  wire [0:0]m00_couplers_to_axi_mem_intercon_WID;
  wire m00_couplers_to_axi_mem_intercon_WLAST;
  wire m00_couplers_to_axi_mem_intercon_WREADY;
  wire [3:0]m00_couplers_to_axi_mem_intercon_WSTRB;
  wire m00_couplers_to_axi_mem_intercon_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire [0:0]s01_couplers_to_xbar_AWVALID;
  wire [0:0]s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [31:0]s01_couplers_to_xbar_WDATA;
  wire [0:0]s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [3:0]s01_couplers_to_xbar_WSTRB;
  wire [0:0]s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [0:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [0:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [1:0]NLW_xbar_s_axi_awready_UNCONNECTED;
  wire [3:0]NLW_xbar_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_bvalid_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_wready_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_mem_intercon_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_mem_intercon_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_mem_intercon_ARCACHE;
  assign M00_AXI_arid[0] = m00_couplers_to_axi_mem_intercon_ARID;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_mem_intercon_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_mem_intercon_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_mem_intercon_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_mem_intercon_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_mem_intercon_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_mem_intercon_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_mem_intercon_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_mem_intercon_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_mem_intercon_AWCACHE;
  assign M00_AXI_awid[0] = m00_couplers_to_axi_mem_intercon_AWID;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_mem_intercon_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_mem_intercon_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_mem_intercon_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_mem_intercon_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_mem_intercon_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_mem_intercon_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_mem_intercon_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_mem_intercon_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_mem_intercon_WDATA;
  assign M00_AXI_wid[0] = m00_couplers_to_axi_mem_intercon_WID;
  assign M00_AXI_wlast = m00_couplers_to_axi_mem_intercon_WLAST;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_mem_intercon_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_mem_intercon_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = axi_mem_intercon_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[31:0] = axi_mem_intercon_to_s00_couplers_RDATA;
  assign S00_AXI_rlast[0] = axi_mem_intercon_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mem_intercon_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = axi_mem_intercon_to_s00_couplers_RVALID;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_awready[0] = axi_mem_intercon_to_s01_couplers_AWREADY;
  assign S01_AXI_bresp[1:0] = axi_mem_intercon_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid[0] = axi_mem_intercon_to_s01_couplers_BVALID;
  assign S01_AXI_wready[0] = axi_mem_intercon_to_s01_couplers_WREADY;
  assign axi_mem_intercon_ACLK_net = ACLK;
  assign axi_mem_intercon_ARESETN_net = ARESETN;
  assign axi_mem_intercon_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mem_intercon_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mem_intercon_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mem_intercon_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mem_intercon_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mem_intercon_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign axi_mem_intercon_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign axi_mem_intercon_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_mem_intercon_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_mem_intercon_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_mem_intercon_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_mem_intercon_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_mem_intercon_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_mem_intercon_to_s01_couplers_AWVALID = S01_AXI_awvalid[0];
  assign axi_mem_intercon_to_s01_couplers_BREADY = S01_AXI_bready[0];
  assign axi_mem_intercon_to_s01_couplers_WDATA = S01_AXI_wdata[31:0];
  assign axi_mem_intercon_to_s01_couplers_WLAST = S01_AXI_wlast[0];
  assign axi_mem_intercon_to_s01_couplers_WSTRB = S01_AXI_wstrb[3:0];
  assign axi_mem_intercon_to_s01_couplers_WVALID = S01_AXI_wvalid[0];
  assign m00_couplers_to_axi_mem_intercon_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_mem_intercon_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_mem_intercon_BID = M00_AXI_bid[5:0];
  assign m00_couplers_to_axi_mem_intercon_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_mem_intercon_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_mem_intercon_RID = M00_AXI_rid[5:0];
  assign m00_couplers_to_axi_mem_intercon_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_mem_intercon_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_mem_intercon_WREADY = M00_AXI_wready;
  m00_couplers_imp_3QZOB7 m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_mem_intercon_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_mem_intercon_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_mem_intercon_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_mem_intercon_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_mem_intercon_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_mem_intercon_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_mem_intercon_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_mem_intercon_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_mem_intercon_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_mem_intercon_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_mem_intercon_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_mem_intercon_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_mem_intercon_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_mem_intercon_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_mem_intercon_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_mem_intercon_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_mem_intercon_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_mem_intercon_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_mem_intercon_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_mem_intercon_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_mem_intercon_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_mem_intercon_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_mem_intercon_BID),
        .M_AXI_bready(m00_couplers_to_axi_mem_intercon_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_mem_intercon_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_mem_intercon_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_mem_intercon_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_mem_intercon_RID),
        .M_AXI_rlast(m00_couplers_to_axi_mem_intercon_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_mem_intercon_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_mem_intercon_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_mem_intercon_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_mem_intercon_WDATA),
        .M_AXI_wid(m00_couplers_to_axi_mem_intercon_WID),
        .M_AXI_wlast(m00_couplers_to_axi_mem_intercon_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_mem_intercon_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_mem_intercon_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_mem_intercon_WVALID),
        .S_ACLK(axi_mem_intercon_ACLK_net),
        .S_ARESETN(axi_mem_intercon_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_3FG5KL s00_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mem_intercon_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mem_intercon_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mem_intercon_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mem_intercon_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mem_intercon_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mem_intercon_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mem_intercon_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_to_s00_couplers_RVALID));
  s01_couplers_imp_1YC7P27 s01_couplers
       (.M_ACLK(axi_mem_intercon_ACLK_net),
        .M_ARESETN(axi_mem_intercon_ARESETN_net),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_awaddr(axi_mem_intercon_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_to_s01_couplers_AWCACHE),
        .S_AXI_awlen(axi_mem_intercon_to_s01_couplers_AWLEN),
        .S_AXI_awprot(axi_mem_intercon_to_s01_couplers_AWPROT),
        .S_AXI_awready(axi_mem_intercon_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_mem_intercon_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(axi_mem_intercon_to_s01_couplers_AWVALID),
        .S_AXI_bready(axi_mem_intercon_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_to_s01_couplers_BVALID),
        .S_AXI_wdata(axi_mem_intercon_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_to_s01_couplers_WVALID));
  hdmi_directpassthr_woi_xbar_2 xbar
       (.aclk(axi_mem_intercon_ACLK_net),
        .aresetn(axi_mem_intercon_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({1'b0,1'b0,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({1'b0,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,1'b0,1'b0}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,NLW_xbar_s_axi_awready_UNCONNECTED[0]}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,1'b0,1'b0,1'b0}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,1'b0}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,1'b0}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,NLW_xbar_s_axi_bresp_UNCONNECTED[1:0]}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,NLW_xbar_s_axi_bvalid_UNCONNECTED[0]}),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready({1'b0,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,1'b1}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,NLW_xbar_s_axi_wready_UNCONNECTED[0]}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,1'b0}));
endmodule

module hdmi_directpassthr_woi_axi_mem_intercon_1_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input [0:0]S00_AXI_arvalid;
  output [127:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rlast;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awprot;
  output [0:0]S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input [0:0]S01_AXI_awvalid;
  input [0:0]S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output [0:0]S01_AXI_bvalid;
  input [127:0]S01_AXI_wdata;
  input [0:0]S01_AXI_wlast;
  output [0:0]S01_AXI_wready;
  input [15:0]S01_AXI_wstrb;
  input [0:0]S01_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire axi_mem_intercon_1_ACLK_net;
  wire axi_mem_intercon_1_ARESETN_net;
  wire [31:0]axi_mem_intercon_1_to_s00_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_1_to_s00_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_1_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mem_intercon_1_to_s00_couplers_ARLEN;
  wire [2:0]axi_mem_intercon_1_to_s00_couplers_ARPROT;
  wire [0:0]axi_mem_intercon_1_to_s00_couplers_ARREADY;
  wire [2:0]axi_mem_intercon_1_to_s00_couplers_ARSIZE;
  wire [0:0]axi_mem_intercon_1_to_s00_couplers_ARVALID;
  wire [127:0]axi_mem_intercon_1_to_s00_couplers_RDATA;
  wire [0:0]axi_mem_intercon_1_to_s00_couplers_RLAST;
  wire [0:0]axi_mem_intercon_1_to_s00_couplers_RREADY;
  wire [1:0]axi_mem_intercon_1_to_s00_couplers_RRESP;
  wire [0:0]axi_mem_intercon_1_to_s00_couplers_RVALID;
  wire [31:0]axi_mem_intercon_1_to_s01_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_1_to_s01_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_1_to_s01_couplers_AWCACHE;
  wire [7:0]axi_mem_intercon_1_to_s01_couplers_AWLEN;
  wire [2:0]axi_mem_intercon_1_to_s01_couplers_AWPROT;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_AWREADY;
  wire [2:0]axi_mem_intercon_1_to_s01_couplers_AWSIZE;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_AWVALID;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_BREADY;
  wire [1:0]axi_mem_intercon_1_to_s01_couplers_BRESP;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_BVALID;
  wire [127:0]axi_mem_intercon_1_to_s01_couplers_WDATA;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_WLAST;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_WREADY;
  wire [15:0]axi_mem_intercon_1_to_s01_couplers_WSTRB;
  wire [0:0]axi_mem_intercon_1_to_s01_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_1_ARADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_ARBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_ARCACHE;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_ARLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_ARLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_1_ARPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_ARQOS;
  wire m00_couplers_to_axi_mem_intercon_1_ARREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_1_ARSIZE;
  wire m00_couplers_to_axi_mem_intercon_1_ARVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_1_AWADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_AWBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_AWCACHE;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_AWLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_AWLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_1_AWPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_1_AWQOS;
  wire m00_couplers_to_axi_mem_intercon_1_AWREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_1_AWSIZE;
  wire m00_couplers_to_axi_mem_intercon_1_AWVALID;
  wire m00_couplers_to_axi_mem_intercon_1_BREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_BRESP;
  wire m00_couplers_to_axi_mem_intercon_1_BVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_1_RDATA;
  wire m00_couplers_to_axi_mem_intercon_1_RLAST;
  wire m00_couplers_to_axi_mem_intercon_1_RREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_1_RRESP;
  wire m00_couplers_to_axi_mem_intercon_1_RVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_1_WDATA;
  wire m00_couplers_to_axi_mem_intercon_1_WLAST;
  wire m00_couplers_to_axi_mem_intercon_1_WREADY;
  wire [7:0]m00_couplers_to_axi_mem_intercon_1_WSTRB;
  wire m00_couplers_to_axi_mem_intercon_1_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [127:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire [0:0]s01_couplers_to_xbar_AWVALID;
  wire [0:0]s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [127:0]s01_couplers_to_xbar_WDATA;
  wire [0:0]s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [15:0]s01_couplers_to_xbar_WSTRB;
  wire [0:0]s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [0:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [0:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [127:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [127:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [15:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [1:0]NLW_xbar_s_axi_awready_UNCONNECTED;
  wire [3:0]NLW_xbar_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_bvalid_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_wready_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_mem_intercon_1_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_mem_intercon_1_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_mem_intercon_1_ARCACHE;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_mem_intercon_1_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_mem_intercon_1_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_mem_intercon_1_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_mem_intercon_1_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_mem_intercon_1_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_mem_intercon_1_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_mem_intercon_1_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_mem_intercon_1_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_mem_intercon_1_AWCACHE;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_mem_intercon_1_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_mem_intercon_1_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_mem_intercon_1_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_mem_intercon_1_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_mem_intercon_1_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_mem_intercon_1_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_mem_intercon_1_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_mem_intercon_1_RREADY;
  assign M00_AXI_wdata[63:0] = m00_couplers_to_axi_mem_intercon_1_WDATA;
  assign M00_AXI_wlast = m00_couplers_to_axi_mem_intercon_1_WLAST;
  assign M00_AXI_wstrb[7:0] = m00_couplers_to_axi_mem_intercon_1_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_mem_intercon_1_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = axi_mem_intercon_1_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[127:0] = axi_mem_intercon_1_to_s00_couplers_RDATA;
  assign S00_AXI_rlast[0] = axi_mem_intercon_1_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mem_intercon_1_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = axi_mem_intercon_1_to_s00_couplers_RVALID;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_awready[0] = axi_mem_intercon_1_to_s01_couplers_AWREADY;
  assign S01_AXI_bresp[1:0] = axi_mem_intercon_1_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid[0] = axi_mem_intercon_1_to_s01_couplers_BVALID;
  assign S01_AXI_wready[0] = axi_mem_intercon_1_to_s01_couplers_WREADY;
  assign axi_mem_intercon_1_ACLK_net = ACLK;
  assign axi_mem_intercon_1_ARESETN_net = ARESETN;
  assign axi_mem_intercon_1_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mem_intercon_1_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign axi_mem_intercon_1_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign axi_mem_intercon_1_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_mem_intercon_1_to_s01_couplers_AWVALID = S01_AXI_awvalid[0];
  assign axi_mem_intercon_1_to_s01_couplers_BREADY = S01_AXI_bready[0];
  assign axi_mem_intercon_1_to_s01_couplers_WDATA = S01_AXI_wdata[127:0];
  assign axi_mem_intercon_1_to_s01_couplers_WLAST = S01_AXI_wlast[0];
  assign axi_mem_intercon_1_to_s01_couplers_WSTRB = S01_AXI_wstrb[15:0];
  assign axi_mem_intercon_1_to_s01_couplers_WVALID = S01_AXI_wvalid[0];
  assign m00_couplers_to_axi_mem_intercon_1_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_mem_intercon_1_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_mem_intercon_1_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_1_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_mem_intercon_1_RDATA = M00_AXI_rdata[63:0];
  assign m00_couplers_to_axi_mem_intercon_1_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_mem_intercon_1_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_1_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_mem_intercon_1_WREADY = M00_AXI_wready;
  m00_couplers_imp_OXQXPK m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_mem_intercon_1_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_mem_intercon_1_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_mem_intercon_1_ARCACHE),
        .M_AXI_arlen(m00_couplers_to_axi_mem_intercon_1_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_mem_intercon_1_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_mem_intercon_1_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_mem_intercon_1_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_mem_intercon_1_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_mem_intercon_1_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_mem_intercon_1_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_mem_intercon_1_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_mem_intercon_1_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_mem_intercon_1_AWCACHE),
        .M_AXI_awlen(m00_couplers_to_axi_mem_intercon_1_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_mem_intercon_1_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_mem_intercon_1_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_mem_intercon_1_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_mem_intercon_1_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_mem_intercon_1_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_mem_intercon_1_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_mem_intercon_1_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_mem_intercon_1_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_mem_intercon_1_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_mem_intercon_1_RDATA),
        .M_AXI_rlast(m00_couplers_to_axi_mem_intercon_1_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_mem_intercon_1_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_mem_intercon_1_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_mem_intercon_1_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_mem_intercon_1_WDATA),
        .M_AXI_wlast(m00_couplers_to_axi_mem_intercon_1_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_mem_intercon_1_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_mem_intercon_1_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_mem_intercon_1_WVALID),
        .S_ACLK(axi_mem_intercon_1_ACLK_net),
        .S_ARESETN(axi_mem_intercon_1_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_OH79VY s00_couplers
       (.M_ACLK(axi_mem_intercon_1_ACLK_net),
        .M_ARESETN(axi_mem_intercon_1_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mem_intercon_1_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_1_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_1_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mem_intercon_1_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mem_intercon_1_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mem_intercon_1_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mem_intercon_1_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_1_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mem_intercon_1_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mem_intercon_1_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_1_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_1_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_1_to_s00_couplers_RVALID));
  s01_couplers_imp_1B4X5R8 s01_couplers
       (.M_ACLK(axi_mem_intercon_1_ACLK_net),
        .M_ARESETN(axi_mem_intercon_1_ARESETN_net),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_awaddr(axi_mem_intercon_1_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_1_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_1_to_s01_couplers_AWCACHE),
        .S_AXI_awlen(axi_mem_intercon_1_to_s01_couplers_AWLEN),
        .S_AXI_awprot(axi_mem_intercon_1_to_s01_couplers_AWPROT),
        .S_AXI_awready(axi_mem_intercon_1_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_mem_intercon_1_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(axi_mem_intercon_1_to_s01_couplers_AWVALID),
        .S_AXI_bready(axi_mem_intercon_1_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_1_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_1_to_s01_couplers_BVALID),
        .S_AXI_wdata(axi_mem_intercon_1_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_1_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_1_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_1_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_1_to_s01_couplers_WVALID));
  hdmi_directpassthr_woi_xbar_1 xbar
       (.aclk(axi_mem_intercon_1_ACLK_net),
        .aresetn(axi_mem_intercon_1_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({1'b0,1'b0,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({1'b0,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,1'b0,1'b0}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,NLW_xbar_s_axi_awready_UNCONNECTED[0]}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,1'b0,1'b0,1'b0}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,1'b0}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,1'b0}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,NLW_xbar_s_axi_bresp_UNCONNECTED[1:0]}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,NLW_xbar_s_axi_bvalid_UNCONNECTED[0]}),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready({1'b0,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,1'b1}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,NLW_xbar_s_axi_wready_UNCONNECTED[0]}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,1'b0}));
endmodule

module hdmi_directpassthr_woi_axi_mem_intercon_2_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arlen,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_rdata,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S01_ACLK,
    S01_ARESETN,
    S01_AXI_awaddr,
    S01_AXI_awburst,
    S01_AXI_awcache,
    S01_AXI_awlen,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awsize,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_wdata,
    S01_AXI_wlast,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [0:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [0:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output [0:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [7:0]S00_AXI_arlen;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  output [31:0]S00_AXI_rdata;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input S01_ACLK;
  input S01_ARESETN;
  input [31:0]S01_AXI_awaddr;
  input [1:0]S01_AXI_awburst;
  input [3:0]S01_AXI_awcache;
  input [7:0]S01_AXI_awlen;
  input [2:0]S01_AXI_awprot;
  output S01_AXI_awready;
  input [2:0]S01_AXI_awsize;
  input S01_AXI_awvalid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  input [31:0]S01_AXI_wdata;
  input S01_AXI_wlast;
  output S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire S01_ACLK_1;
  wire S01_ARESETN_1;
  wire axi_mem_intercon_2_ACLK_net;
  wire axi_mem_intercon_2_ARESETN_net;
  wire [31:0]axi_mem_intercon_2_to_s00_couplers_ARADDR;
  wire [1:0]axi_mem_intercon_2_to_s00_couplers_ARBURST;
  wire [3:0]axi_mem_intercon_2_to_s00_couplers_ARCACHE;
  wire [7:0]axi_mem_intercon_2_to_s00_couplers_ARLEN;
  wire [2:0]axi_mem_intercon_2_to_s00_couplers_ARPROT;
  wire axi_mem_intercon_2_to_s00_couplers_ARREADY;
  wire [2:0]axi_mem_intercon_2_to_s00_couplers_ARSIZE;
  wire axi_mem_intercon_2_to_s00_couplers_ARVALID;
  wire [31:0]axi_mem_intercon_2_to_s00_couplers_RDATA;
  wire axi_mem_intercon_2_to_s00_couplers_RLAST;
  wire axi_mem_intercon_2_to_s00_couplers_RREADY;
  wire [1:0]axi_mem_intercon_2_to_s00_couplers_RRESP;
  wire axi_mem_intercon_2_to_s00_couplers_RVALID;
  wire [31:0]axi_mem_intercon_2_to_s01_couplers_AWADDR;
  wire [1:0]axi_mem_intercon_2_to_s01_couplers_AWBURST;
  wire [3:0]axi_mem_intercon_2_to_s01_couplers_AWCACHE;
  wire [7:0]axi_mem_intercon_2_to_s01_couplers_AWLEN;
  wire [2:0]axi_mem_intercon_2_to_s01_couplers_AWPROT;
  wire axi_mem_intercon_2_to_s01_couplers_AWREADY;
  wire [2:0]axi_mem_intercon_2_to_s01_couplers_AWSIZE;
  wire axi_mem_intercon_2_to_s01_couplers_AWVALID;
  wire axi_mem_intercon_2_to_s01_couplers_BREADY;
  wire [1:0]axi_mem_intercon_2_to_s01_couplers_BRESP;
  wire axi_mem_intercon_2_to_s01_couplers_BVALID;
  wire [31:0]axi_mem_intercon_2_to_s01_couplers_WDATA;
  wire axi_mem_intercon_2_to_s01_couplers_WLAST;
  wire axi_mem_intercon_2_to_s01_couplers_WREADY;
  wire [3:0]axi_mem_intercon_2_to_s01_couplers_WSTRB;
  wire axi_mem_intercon_2_to_s01_couplers_WVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_2_ARADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_ARBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_ARCACHE;
  wire [0:0]m00_couplers_to_axi_mem_intercon_2_ARID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_ARLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_ARLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_2_ARPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_ARQOS;
  wire m00_couplers_to_axi_mem_intercon_2_ARREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_2_ARSIZE;
  wire m00_couplers_to_axi_mem_intercon_2_ARVALID;
  wire [31:0]m00_couplers_to_axi_mem_intercon_2_AWADDR;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_AWBURST;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_AWCACHE;
  wire [0:0]m00_couplers_to_axi_mem_intercon_2_AWID;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_AWLEN;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_AWLOCK;
  wire [2:0]m00_couplers_to_axi_mem_intercon_2_AWPROT;
  wire [3:0]m00_couplers_to_axi_mem_intercon_2_AWQOS;
  wire m00_couplers_to_axi_mem_intercon_2_AWREADY;
  wire [2:0]m00_couplers_to_axi_mem_intercon_2_AWSIZE;
  wire m00_couplers_to_axi_mem_intercon_2_AWVALID;
  wire [5:0]m00_couplers_to_axi_mem_intercon_2_BID;
  wire m00_couplers_to_axi_mem_intercon_2_BREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_BRESP;
  wire m00_couplers_to_axi_mem_intercon_2_BVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_2_RDATA;
  wire [5:0]m00_couplers_to_axi_mem_intercon_2_RID;
  wire m00_couplers_to_axi_mem_intercon_2_RLAST;
  wire m00_couplers_to_axi_mem_intercon_2_RREADY;
  wire [1:0]m00_couplers_to_axi_mem_intercon_2_RRESP;
  wire m00_couplers_to_axi_mem_intercon_2_RVALID;
  wire [63:0]m00_couplers_to_axi_mem_intercon_2_WDATA;
  wire [0:0]m00_couplers_to_axi_mem_intercon_2_WID;
  wire m00_couplers_to_axi_mem_intercon_2_WLAST;
  wire m00_couplers_to_axi_mem_intercon_2_WREADY;
  wire [7:0]m00_couplers_to_axi_mem_intercon_2_WSTRB;
  wire m00_couplers_to_axi_mem_intercon_2_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [1:0]s00_couplers_to_xbar_ARBURST;
  wire [3:0]s00_couplers_to_xbar_ARCACHE;
  wire [7:0]s00_couplers_to_xbar_ARLEN;
  wire [0:0]s00_couplers_to_xbar_ARLOCK;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [3:0]s00_couplers_to_xbar_ARQOS;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [2:0]s00_couplers_to_xbar_ARSIZE;
  wire s00_couplers_to_xbar_ARVALID;
  wire [63:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RLAST;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s01_couplers_to_xbar_AWADDR;
  wire [1:0]s01_couplers_to_xbar_AWBURST;
  wire [3:0]s01_couplers_to_xbar_AWCACHE;
  wire [7:0]s01_couplers_to_xbar_AWLEN;
  wire [0:0]s01_couplers_to_xbar_AWLOCK;
  wire [2:0]s01_couplers_to_xbar_AWPROT;
  wire [3:0]s01_couplers_to_xbar_AWQOS;
  wire [1:1]s01_couplers_to_xbar_AWREADY;
  wire [2:0]s01_couplers_to_xbar_AWSIZE;
  wire s01_couplers_to_xbar_AWVALID;
  wire s01_couplers_to_xbar_BREADY;
  wire [3:2]s01_couplers_to_xbar_BRESP;
  wire [1:1]s01_couplers_to_xbar_BVALID;
  wire [63:0]s01_couplers_to_xbar_WDATA;
  wire s01_couplers_to_xbar_WLAST;
  wire [1:1]s01_couplers_to_xbar_WREADY;
  wire [7:0]s01_couplers_to_xbar_WSTRB;
  wire s01_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [1:0]xbar_to_m00_couplers_ARBURST;
  wire [3:0]xbar_to_m00_couplers_ARCACHE;
  wire [0:0]xbar_to_m00_couplers_ARID;
  wire [7:0]xbar_to_m00_couplers_ARLEN;
  wire [0:0]xbar_to_m00_couplers_ARLOCK;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire [3:0]xbar_to_m00_couplers_ARQOS;
  wire xbar_to_m00_couplers_ARREADY;
  wire [3:0]xbar_to_m00_couplers_ARREGION;
  wire [2:0]xbar_to_m00_couplers_ARSIZE;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [1:0]xbar_to_m00_couplers_AWBURST;
  wire [3:0]xbar_to_m00_couplers_AWCACHE;
  wire [0:0]xbar_to_m00_couplers_AWID;
  wire [7:0]xbar_to_m00_couplers_AWLEN;
  wire [0:0]xbar_to_m00_couplers_AWLOCK;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire [3:0]xbar_to_m00_couplers_AWQOS;
  wire xbar_to_m00_couplers_AWREADY;
  wire [3:0]xbar_to_m00_couplers_AWREGION;
  wire [2:0]xbar_to_m00_couplers_AWSIZE;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [63:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RID;
  wire xbar_to_m00_couplers_RLAST;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [63:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WLAST;
  wire xbar_to_m00_couplers_WREADY;
  wire [7:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [1:0]NLW_xbar_s_axi_awready_UNCONNECTED;
  wire [3:0]NLW_xbar_s_axi_bresp_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_bvalid_UNCONNECTED;
  wire [1:0]NLW_xbar_s_axi_wready_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_axi_mem_intercon_2_ARADDR;
  assign M00_AXI_arburst[1:0] = m00_couplers_to_axi_mem_intercon_2_ARBURST;
  assign M00_AXI_arcache[3:0] = m00_couplers_to_axi_mem_intercon_2_ARCACHE;
  assign M00_AXI_arid[0] = m00_couplers_to_axi_mem_intercon_2_ARID;
  assign M00_AXI_arlen[3:0] = m00_couplers_to_axi_mem_intercon_2_ARLEN;
  assign M00_AXI_arlock[1:0] = m00_couplers_to_axi_mem_intercon_2_ARLOCK;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_mem_intercon_2_ARPROT;
  assign M00_AXI_arqos[3:0] = m00_couplers_to_axi_mem_intercon_2_ARQOS;
  assign M00_AXI_arsize[2:0] = m00_couplers_to_axi_mem_intercon_2_ARSIZE;
  assign M00_AXI_arvalid = m00_couplers_to_axi_mem_intercon_2_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_axi_mem_intercon_2_AWADDR;
  assign M00_AXI_awburst[1:0] = m00_couplers_to_axi_mem_intercon_2_AWBURST;
  assign M00_AXI_awcache[3:0] = m00_couplers_to_axi_mem_intercon_2_AWCACHE;
  assign M00_AXI_awid[0] = m00_couplers_to_axi_mem_intercon_2_AWID;
  assign M00_AXI_awlen[3:0] = m00_couplers_to_axi_mem_intercon_2_AWLEN;
  assign M00_AXI_awlock[1:0] = m00_couplers_to_axi_mem_intercon_2_AWLOCK;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_mem_intercon_2_AWPROT;
  assign M00_AXI_awqos[3:0] = m00_couplers_to_axi_mem_intercon_2_AWQOS;
  assign M00_AXI_awsize[2:0] = m00_couplers_to_axi_mem_intercon_2_AWSIZE;
  assign M00_AXI_awvalid = m00_couplers_to_axi_mem_intercon_2_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_mem_intercon_2_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_mem_intercon_2_RREADY;
  assign M00_AXI_wdata[63:0] = m00_couplers_to_axi_mem_intercon_2_WDATA;
  assign M00_AXI_wid[0] = m00_couplers_to_axi_mem_intercon_2_WID;
  assign M00_AXI_wlast = m00_couplers_to_axi_mem_intercon_2_WLAST;
  assign M00_AXI_wstrb[7:0] = m00_couplers_to_axi_mem_intercon_2_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_mem_intercon_2_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_mem_intercon_2_to_s00_couplers_ARREADY;
  assign S00_AXI_rdata[31:0] = axi_mem_intercon_2_to_s00_couplers_RDATA;
  assign S00_AXI_rlast = axi_mem_intercon_2_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_mem_intercon_2_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_mem_intercon_2_to_s00_couplers_RVALID;
  assign S01_ACLK_1 = S01_ACLK;
  assign S01_ARESETN_1 = S01_ARESETN;
  assign S01_AXI_awready = axi_mem_intercon_2_to_s01_couplers_AWREADY;
  assign S01_AXI_bresp[1:0] = axi_mem_intercon_2_to_s01_couplers_BRESP;
  assign S01_AXI_bvalid = axi_mem_intercon_2_to_s01_couplers_BVALID;
  assign S01_AXI_wready = axi_mem_intercon_2_to_s01_couplers_WREADY;
  assign axi_mem_intercon_2_ACLK_net = ACLK;
  assign axi_mem_intercon_2_ARESETN_net = ARESETN;
  assign axi_mem_intercon_2_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARLEN = S00_AXI_arlen[7:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_mem_intercon_2_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_mem_intercon_2_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_mem_intercon_2_to_s01_couplers_AWADDR = S01_AXI_awaddr[31:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWBURST = S01_AXI_awburst[1:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWCACHE = S01_AXI_awcache[3:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWLEN = S01_AXI_awlen[7:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWPROT = S01_AXI_awprot[2:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWSIZE = S01_AXI_awsize[2:0];
  assign axi_mem_intercon_2_to_s01_couplers_AWVALID = S01_AXI_awvalid;
  assign axi_mem_intercon_2_to_s01_couplers_BREADY = S01_AXI_bready;
  assign axi_mem_intercon_2_to_s01_couplers_WDATA = S01_AXI_wdata[31:0];
  assign axi_mem_intercon_2_to_s01_couplers_WLAST = S01_AXI_wlast;
  assign axi_mem_intercon_2_to_s01_couplers_WSTRB = S01_AXI_wstrb[3:0];
  assign axi_mem_intercon_2_to_s01_couplers_WVALID = S01_AXI_wvalid;
  assign m00_couplers_to_axi_mem_intercon_2_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_mem_intercon_2_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_mem_intercon_2_BID = M00_AXI_bid[5:0];
  assign m00_couplers_to_axi_mem_intercon_2_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_2_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_mem_intercon_2_RDATA = M00_AXI_rdata[63:0];
  assign m00_couplers_to_axi_mem_intercon_2_RID = M00_AXI_rid[5:0];
  assign m00_couplers_to_axi_mem_intercon_2_RLAST = M00_AXI_rlast;
  assign m00_couplers_to_axi_mem_intercon_2_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_mem_intercon_2_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_mem_intercon_2_WREADY = M00_AXI_wready;
  m00_couplers_imp_GXBIZA m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_mem_intercon_2_ARADDR),
        .M_AXI_arburst(m00_couplers_to_axi_mem_intercon_2_ARBURST),
        .M_AXI_arcache(m00_couplers_to_axi_mem_intercon_2_ARCACHE),
        .M_AXI_arid(m00_couplers_to_axi_mem_intercon_2_ARID),
        .M_AXI_arlen(m00_couplers_to_axi_mem_intercon_2_ARLEN),
        .M_AXI_arlock(m00_couplers_to_axi_mem_intercon_2_ARLOCK),
        .M_AXI_arprot(m00_couplers_to_axi_mem_intercon_2_ARPROT),
        .M_AXI_arqos(m00_couplers_to_axi_mem_intercon_2_ARQOS),
        .M_AXI_arready(m00_couplers_to_axi_mem_intercon_2_ARREADY),
        .M_AXI_arsize(m00_couplers_to_axi_mem_intercon_2_ARSIZE),
        .M_AXI_arvalid(m00_couplers_to_axi_mem_intercon_2_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_mem_intercon_2_AWADDR),
        .M_AXI_awburst(m00_couplers_to_axi_mem_intercon_2_AWBURST),
        .M_AXI_awcache(m00_couplers_to_axi_mem_intercon_2_AWCACHE),
        .M_AXI_awid(m00_couplers_to_axi_mem_intercon_2_AWID),
        .M_AXI_awlen(m00_couplers_to_axi_mem_intercon_2_AWLEN),
        .M_AXI_awlock(m00_couplers_to_axi_mem_intercon_2_AWLOCK),
        .M_AXI_awprot(m00_couplers_to_axi_mem_intercon_2_AWPROT),
        .M_AXI_awqos(m00_couplers_to_axi_mem_intercon_2_AWQOS),
        .M_AXI_awready(m00_couplers_to_axi_mem_intercon_2_AWREADY),
        .M_AXI_awsize(m00_couplers_to_axi_mem_intercon_2_AWSIZE),
        .M_AXI_awvalid(m00_couplers_to_axi_mem_intercon_2_AWVALID),
        .M_AXI_bid(m00_couplers_to_axi_mem_intercon_2_BID),
        .M_AXI_bready(m00_couplers_to_axi_mem_intercon_2_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_mem_intercon_2_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_mem_intercon_2_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_mem_intercon_2_RDATA),
        .M_AXI_rid(m00_couplers_to_axi_mem_intercon_2_RID),
        .M_AXI_rlast(m00_couplers_to_axi_mem_intercon_2_RLAST),
        .M_AXI_rready(m00_couplers_to_axi_mem_intercon_2_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_mem_intercon_2_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_mem_intercon_2_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_mem_intercon_2_WDATA),
        .M_AXI_wid(m00_couplers_to_axi_mem_intercon_2_WID),
        .M_AXI_wlast(m00_couplers_to_axi_mem_intercon_2_WLAST),
        .M_AXI_wready(m00_couplers_to_axi_mem_intercon_2_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_mem_intercon_2_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_mem_intercon_2_WVALID),
        .S_ACLK(axi_mem_intercon_2_ACLK_net),
        .S_ARESETN(axi_mem_intercon_2_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arburst(xbar_to_m00_couplers_ARBURST),
        .S_AXI_arcache(xbar_to_m00_couplers_ARCACHE),
        .S_AXI_arid(xbar_to_m00_couplers_ARID),
        .S_AXI_arlen(xbar_to_m00_couplers_ARLEN),
        .S_AXI_arlock(xbar_to_m00_couplers_ARLOCK),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arqos(xbar_to_m00_couplers_ARQOS),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arregion(xbar_to_m00_couplers_ARREGION),
        .S_AXI_arsize(xbar_to_m00_couplers_ARSIZE),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awburst(xbar_to_m00_couplers_AWBURST),
        .S_AXI_awcache(xbar_to_m00_couplers_AWCACHE),
        .S_AXI_awid(xbar_to_m00_couplers_AWID),
        .S_AXI_awlen(xbar_to_m00_couplers_AWLEN),
        .S_AXI_awlock(xbar_to_m00_couplers_AWLOCK),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awqos(xbar_to_m00_couplers_AWQOS),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awregion(xbar_to_m00_couplers_AWREGION),
        .S_AXI_awsize(xbar_to_m00_couplers_AWSIZE),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bid(xbar_to_m00_couplers_BID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rid(xbar_to_m00_couplers_RID),
        .S_AXI_rlast(xbar_to_m00_couplers_RLAST),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wlast(xbar_to_m00_couplers_WLAST),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  s00_couplers_imp_GVRFAO s00_couplers
       (.M_ACLK(axi_mem_intercon_2_ACLK_net),
        .M_ARESETN(axi_mem_intercon_2_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arburst(s00_couplers_to_xbar_ARBURST),
        .M_AXI_arcache(s00_couplers_to_xbar_ARCACHE),
        .M_AXI_arlen(s00_couplers_to_xbar_ARLEN),
        .M_AXI_arlock(s00_couplers_to_xbar_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arqos(s00_couplers_to_xbar_ARQOS),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arsize(s00_couplers_to_xbar_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rlast(s00_couplers_to_xbar_RLAST),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_mem_intercon_2_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_mem_intercon_2_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_mem_intercon_2_to_s00_couplers_ARCACHE),
        .S_AXI_arlen(axi_mem_intercon_2_to_s00_couplers_ARLEN),
        .S_AXI_arprot(axi_mem_intercon_2_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_mem_intercon_2_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_mem_intercon_2_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_mem_intercon_2_to_s00_couplers_ARVALID),
        .S_AXI_rdata(axi_mem_intercon_2_to_s00_couplers_RDATA),
        .S_AXI_rlast(axi_mem_intercon_2_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_mem_intercon_2_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_mem_intercon_2_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_mem_intercon_2_to_s00_couplers_RVALID));
  s01_couplers_imp_1KVRXCQ s01_couplers
       (.M_ACLK(axi_mem_intercon_2_ACLK_net),
        .M_ARESETN(axi_mem_intercon_2_ARESETN_net),
        .M_AXI_awaddr(s01_couplers_to_xbar_AWADDR),
        .M_AXI_awburst(s01_couplers_to_xbar_AWBURST),
        .M_AXI_awcache(s01_couplers_to_xbar_AWCACHE),
        .M_AXI_awlen(s01_couplers_to_xbar_AWLEN),
        .M_AXI_awlock(s01_couplers_to_xbar_AWLOCK),
        .M_AXI_awprot(s01_couplers_to_xbar_AWPROT),
        .M_AXI_awqos(s01_couplers_to_xbar_AWQOS),
        .M_AXI_awready(s01_couplers_to_xbar_AWREADY),
        .M_AXI_awsize(s01_couplers_to_xbar_AWSIZE),
        .M_AXI_awvalid(s01_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s01_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s01_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s01_couplers_to_xbar_BVALID),
        .M_AXI_wdata(s01_couplers_to_xbar_WDATA),
        .M_AXI_wlast(s01_couplers_to_xbar_WLAST),
        .M_AXI_wready(s01_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s01_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s01_couplers_to_xbar_WVALID),
        .S_ACLK(S01_ACLK_1),
        .S_ARESETN(S01_ARESETN_1),
        .S_AXI_awaddr(axi_mem_intercon_2_to_s01_couplers_AWADDR),
        .S_AXI_awburst(axi_mem_intercon_2_to_s01_couplers_AWBURST),
        .S_AXI_awcache(axi_mem_intercon_2_to_s01_couplers_AWCACHE),
        .S_AXI_awlen(axi_mem_intercon_2_to_s01_couplers_AWLEN),
        .S_AXI_awprot(axi_mem_intercon_2_to_s01_couplers_AWPROT),
        .S_AXI_awready(axi_mem_intercon_2_to_s01_couplers_AWREADY),
        .S_AXI_awsize(axi_mem_intercon_2_to_s01_couplers_AWSIZE),
        .S_AXI_awvalid(axi_mem_intercon_2_to_s01_couplers_AWVALID),
        .S_AXI_bready(axi_mem_intercon_2_to_s01_couplers_BREADY),
        .S_AXI_bresp(axi_mem_intercon_2_to_s01_couplers_BRESP),
        .S_AXI_bvalid(axi_mem_intercon_2_to_s01_couplers_BVALID),
        .S_AXI_wdata(axi_mem_intercon_2_to_s01_couplers_WDATA),
        .S_AXI_wlast(axi_mem_intercon_2_to_s01_couplers_WLAST),
        .S_AXI_wready(axi_mem_intercon_2_to_s01_couplers_WREADY),
        .S_AXI_wstrb(axi_mem_intercon_2_to_s01_couplers_WSTRB),
        .S_AXI_wvalid(axi_mem_intercon_2_to_s01_couplers_WVALID));
  hdmi_directpassthr_woi_xbar_3 xbar
       (.aclk(axi_mem_intercon_2_ACLK_net),
        .aresetn(axi_mem_intercon_2_ARESETN_net),
        .m_axi_araddr(xbar_to_m00_couplers_ARADDR),
        .m_axi_arburst(xbar_to_m00_couplers_ARBURST),
        .m_axi_arcache(xbar_to_m00_couplers_ARCACHE),
        .m_axi_arid(xbar_to_m00_couplers_ARID),
        .m_axi_arlen(xbar_to_m00_couplers_ARLEN),
        .m_axi_arlock(xbar_to_m00_couplers_ARLOCK),
        .m_axi_arprot(xbar_to_m00_couplers_ARPROT),
        .m_axi_arqos(xbar_to_m00_couplers_ARQOS),
        .m_axi_arready(xbar_to_m00_couplers_ARREADY),
        .m_axi_arregion(xbar_to_m00_couplers_ARREGION),
        .m_axi_arsize(xbar_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(xbar_to_m00_couplers_ARVALID),
        .m_axi_awaddr(xbar_to_m00_couplers_AWADDR),
        .m_axi_awburst(xbar_to_m00_couplers_AWBURST),
        .m_axi_awcache(xbar_to_m00_couplers_AWCACHE),
        .m_axi_awid(xbar_to_m00_couplers_AWID),
        .m_axi_awlen(xbar_to_m00_couplers_AWLEN),
        .m_axi_awlock(xbar_to_m00_couplers_AWLOCK),
        .m_axi_awprot(xbar_to_m00_couplers_AWPROT),
        .m_axi_awqos(xbar_to_m00_couplers_AWQOS),
        .m_axi_awready(xbar_to_m00_couplers_AWREADY),
        .m_axi_awregion(xbar_to_m00_couplers_AWREGION),
        .m_axi_awsize(xbar_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(xbar_to_m00_couplers_AWVALID),
        .m_axi_bid(xbar_to_m00_couplers_BID),
        .m_axi_bready(xbar_to_m00_couplers_BREADY),
        .m_axi_bresp(xbar_to_m00_couplers_BRESP),
        .m_axi_bvalid(xbar_to_m00_couplers_BVALID),
        .m_axi_rdata(xbar_to_m00_couplers_RDATA),
        .m_axi_rid(xbar_to_m00_couplers_RID),
        .m_axi_rlast(xbar_to_m00_couplers_RLAST),
        .m_axi_rready(xbar_to_m00_couplers_RREADY),
        .m_axi_rresp(xbar_to_m00_couplers_RRESP),
        .m_axi_rvalid(xbar_to_m00_couplers_RVALID),
        .m_axi_wdata(xbar_to_m00_couplers_WDATA),
        .m_axi_wlast(xbar_to_m00_couplers_WLAST),
        .m_axi_wready(xbar_to_m00_couplers_WREADY),
        .m_axi_wstrb(xbar_to_m00_couplers_WSTRB),
        .m_axi_wvalid(xbar_to_m00_couplers_WVALID),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARADDR}),
        .s_axi_arburst({1'b0,1'b0,s00_couplers_to_xbar_ARBURST}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARCACHE}),
        .s_axi_arid({1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARLEN}),
        .s_axi_arlock({1'b0,s00_couplers_to_xbar_ARLOCK}),
        .s_axi_arprot({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARPROT}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARQOS}),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arsize({1'b0,1'b0,1'b0,s00_couplers_to_xbar_ARSIZE}),
        .s_axi_arvalid({1'b0,s00_couplers_to_xbar_ARVALID}),
        .s_axi_awaddr({s01_couplers_to_xbar_AWADDR,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({s01_couplers_to_xbar_AWBURST,1'b0,1'b0}),
        .s_axi_awcache({s01_couplers_to_xbar_AWCACHE,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0}),
        .s_axi_awlen({s01_couplers_to_xbar_AWLEN,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({s01_couplers_to_xbar_AWLOCK,1'b0}),
        .s_axi_awprot({s01_couplers_to_xbar_AWPROT,1'b0,1'b0,1'b0}),
        .s_axi_awqos({s01_couplers_to_xbar_AWQOS,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready({s01_couplers_to_xbar_AWREADY,NLW_xbar_s_axi_awready_UNCONNECTED[0]}),
        .s_axi_awsize({s01_couplers_to_xbar_AWSIZE,1'b0,1'b0,1'b0}),
        .s_axi_awvalid({s01_couplers_to_xbar_AWVALID,1'b0}),
        .s_axi_bready({s01_couplers_to_xbar_BREADY,1'b0}),
        .s_axi_bresp({s01_couplers_to_xbar_BRESP,NLW_xbar_s_axi_bresp_UNCONNECTED[1:0]}),
        .s_axi_bvalid({s01_couplers_to_xbar_BVALID,NLW_xbar_s_axi_bvalid_UNCONNECTED[0]}),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rlast(s00_couplers_to_xbar_RLAST),
        .s_axi_rready({1'b0,s00_couplers_to_xbar_RREADY}),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata({s01_couplers_to_xbar_WDATA,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast({s01_couplers_to_xbar_WLAST,1'b1}),
        .s_axi_wready({s01_couplers_to_xbar_WREADY,NLW_xbar_s_axi_wready_UNCONNECTED[0]}),
        .s_axi_wstrb({s01_couplers_to_xbar_WSTRB,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axi_wvalid({s01_couplers_to_xbar_WVALID,1'b0}));
endmodule

module hdmi_directpassthr_woi_processing_system7_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [0:0]M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input [0:0]M03_AXI_arready;
  output [0:0]M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input [0:0]M03_AXI_awready;
  output [0:0]M03_AXI_awvalid;
  output [0:0]M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input [0:0]M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output [0:0]M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input [0:0]M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input [0:0]M03_AXI_wready;
  output [0:0]M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input [0:0]M04_AXI_arready;
  output [0:0]M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input [0:0]M04_AXI_awready;
  output [0:0]M04_AXI_awvalid;
  output [0:0]M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input [0:0]M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output [0:0]M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input [0:0]M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input [0:0]M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output [0:0]M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  output [2:0]M05_AXI_arprot;
  input [0:0]M05_AXI_arready;
  output [0:0]M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  output [2:0]M05_AXI_awprot;
  input [0:0]M05_AXI_awready;
  output [0:0]M05_AXI_awvalid;
  output [0:0]M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input [0:0]M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output [0:0]M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input [0:0]M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input [0:0]M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output [0:0]M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  output [2:0]M06_AXI_arprot;
  input [0:0]M06_AXI_arready;
  output [0:0]M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  output [2:0]M06_AXI_awprot;
  input [0:0]M06_AXI_awready;
  output [0:0]M06_AXI_awvalid;
  output [0:0]M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input [0:0]M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output [0:0]M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input [0:0]M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input [0:0]M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output [0:0]M06_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]m00_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_processing_system7_0_axi_periph_WSTRB;
  wire [0:0]m00_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [0:0]m01_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [0:0]m02_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m03_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m03_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m03_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m03_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m03_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m03_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [0:0]m03_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m04_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [2:0]m04_couplers_to_processing_system7_0_axi_periph_ARPROT;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m04_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [2:0]m04_couplers_to_processing_system7_0_axi_periph_AWPROT;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m04_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m04_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m04_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m04_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [3:0]m04_couplers_to_processing_system7_0_axi_periph_WSTRB;
  wire [0:0]m04_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m05_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [2:0]m05_couplers_to_processing_system7_0_axi_periph_ARPROT;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m05_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [2:0]m05_couplers_to_processing_system7_0_axi_periph_AWPROT;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m05_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m05_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m05_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m05_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [3:0]m05_couplers_to_processing_system7_0_axi_periph_WSTRB;
  wire [0:0]m05_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire [31:0]m06_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [2:0]m06_couplers_to_processing_system7_0_axi_periph_ARPROT;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]m06_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [2:0]m06_couplers_to_processing_system7_0_axi_periph_AWPROT;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]m06_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]m06_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]m06_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]m06_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [3:0]m06_couplers_to_processing_system7_0_axi_periph_WSTRB;
  wire [0:0]m06_couplers_to_processing_system7_0_axi_periph_WVALID;
  wire processing_system7_0_axi_periph_ACLK_net;
  wire processing_system7_0_axi_periph_ARESETN_net;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_ARID;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARQOS;
  wire processing_system7_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_ARSIZE;
  wire processing_system7_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_AWID;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWQOS;
  wire processing_system7_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_AWSIZE;
  wire processing_system7_0_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_BID;
  wire processing_system7_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_BRESP;
  wire processing_system7_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_RID;
  wire processing_system7_0_axi_periph_to_s00_couplers_RLAST;
  wire processing_system7_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_RRESP;
  wire processing_system7_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_WID;
  wire processing_system7_0_axi_periph_to_s00_couplers_WLAST;
  wire processing_system7_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_WSTRB;
  wire processing_system7_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [0:0]xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [0:0]xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire [0:0]xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire [0:0]xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire [0:0]xbar_to_m03_couplers_WREADY;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire [0:0]xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire [0:0]xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire [0:0]xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire [0:0]xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire [0:0]xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire [17:15]xbar_to_m05_couplers_ARPROT;
  wire [0:0]xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire [17:15]xbar_to_m05_couplers_AWPROT;
  wire [0:0]xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire [0:0]xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire [0:0]xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire [0:0]xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire [20:18]xbar_to_m06_couplers_ARPROT;
  wire [0:0]xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire [20:18]xbar_to_m06_couplers_AWPROT;
  wire [0:0]xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire [0:0]xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire [0:0]xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire [0:0]xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [20:0]NLW_xbar_m_axi_arprot_UNCONNECTED;
  wire [20:0]NLW_xbar_m_axi_awprot_UNCONNECTED;
  wire [27:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_processing_system7_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M01_AXI_wvalid[0] = m01_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M02_AXI_wvalid[0] = m02_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[31:0] = m03_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M03_AXI_arvalid[0] = m03_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M03_AXI_awvalid[0] = m03_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M03_AXI_bready[0] = m03_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M03_AXI_rready[0] = m03_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M03_AXI_wvalid[0] = m03_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[31:0] = m04_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M04_AXI_arprot[2:0] = m04_couplers_to_processing_system7_0_axi_periph_ARPROT;
  assign M04_AXI_arvalid[0] = m04_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M04_AXI_awprot[2:0] = m04_couplers_to_processing_system7_0_axi_periph_AWPROT;
  assign M04_AXI_awvalid[0] = m04_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M04_AXI_bready[0] = m04_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M04_AXI_rready[0] = m04_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_processing_system7_0_axi_periph_WSTRB;
  assign M04_AXI_wvalid[0] = m04_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[31:0] = m05_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M05_AXI_arprot[2:0] = m05_couplers_to_processing_system7_0_axi_periph_ARPROT;
  assign M05_AXI_arvalid[0] = m05_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M05_AXI_awprot[2:0] = m05_couplers_to_processing_system7_0_axi_periph_AWPROT;
  assign M05_AXI_awvalid[0] = m05_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M05_AXI_bready[0] = m05_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M05_AXI_rready[0] = m05_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_processing_system7_0_axi_periph_WSTRB;
  assign M05_AXI_wvalid[0] = m05_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[31:0] = m06_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M06_AXI_arprot[2:0] = m06_couplers_to_processing_system7_0_axi_periph_ARPROT;
  assign M06_AXI_arvalid[0] = m06_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M06_AXI_awaddr[31:0] = m06_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M06_AXI_awprot[2:0] = m06_couplers_to_processing_system7_0_axi_periph_AWPROT;
  assign M06_AXI_awvalid[0] = m06_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M06_AXI_bready[0] = m06_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M06_AXI_rready[0] = m06_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_processing_system7_0_axi_periph_WSTRB;
  assign M06_AXI_wvalid[0] = m06_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = processing_system7_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = processing_system7_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = processing_system7_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = processing_system7_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = processing_system7_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = processing_system7_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = processing_system7_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = processing_system7_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = processing_system7_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = processing_system7_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = processing_system7_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_processing_system7_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_processing_system7_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_processing_system7_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_processing_system7_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_processing_system7_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_processing_system7_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_processing_system7_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_processing_system7_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_processing_system7_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_processing_system7_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_processing_system7_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_processing_system7_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_processing_system7_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_processing_system7_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_processing_system7_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_processing_system7_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_processing_system7_0_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_processing_system7_0_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_processing_system7_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_processing_system7_0_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_processing_system7_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_processing_system7_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_processing_system7_0_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_processing_system7_0_axi_periph_WREADY = M02_AXI_wready[0];
  assign m03_couplers_to_processing_system7_0_axi_periph_ARREADY = M03_AXI_arready[0];
  assign m03_couplers_to_processing_system7_0_axi_periph_AWREADY = M03_AXI_awready[0];
  assign m03_couplers_to_processing_system7_0_axi_periph_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_processing_system7_0_axi_periph_BVALID = M03_AXI_bvalid[0];
  assign m03_couplers_to_processing_system7_0_axi_periph_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_processing_system7_0_axi_periph_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_processing_system7_0_axi_periph_RVALID = M03_AXI_rvalid[0];
  assign m03_couplers_to_processing_system7_0_axi_periph_WREADY = M03_AXI_wready[0];
  assign m04_couplers_to_processing_system7_0_axi_periph_ARREADY = M04_AXI_arready[0];
  assign m04_couplers_to_processing_system7_0_axi_periph_AWREADY = M04_AXI_awready[0];
  assign m04_couplers_to_processing_system7_0_axi_periph_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_processing_system7_0_axi_periph_BVALID = M04_AXI_bvalid[0];
  assign m04_couplers_to_processing_system7_0_axi_periph_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_processing_system7_0_axi_periph_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_processing_system7_0_axi_periph_RVALID = M04_AXI_rvalid[0];
  assign m04_couplers_to_processing_system7_0_axi_periph_WREADY = M04_AXI_wready[0];
  assign m05_couplers_to_processing_system7_0_axi_periph_ARREADY = M05_AXI_arready[0];
  assign m05_couplers_to_processing_system7_0_axi_periph_AWREADY = M05_AXI_awready[0];
  assign m05_couplers_to_processing_system7_0_axi_periph_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_processing_system7_0_axi_periph_BVALID = M05_AXI_bvalid[0];
  assign m05_couplers_to_processing_system7_0_axi_periph_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_processing_system7_0_axi_periph_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_processing_system7_0_axi_periph_RVALID = M05_AXI_rvalid[0];
  assign m05_couplers_to_processing_system7_0_axi_periph_WREADY = M05_AXI_wready[0];
  assign m06_couplers_to_processing_system7_0_axi_periph_ARREADY = M06_AXI_arready[0];
  assign m06_couplers_to_processing_system7_0_axi_periph_AWREADY = M06_AXI_awready[0];
  assign m06_couplers_to_processing_system7_0_axi_periph_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_processing_system7_0_axi_periph_BVALID = M06_AXI_bvalid[0];
  assign m06_couplers_to_processing_system7_0_axi_periph_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_processing_system7_0_axi_periph_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_processing_system7_0_axi_periph_RVALID = M06_AXI_rvalid[0];
  assign m06_couplers_to_processing_system7_0_axi_periph_WREADY = M06_AXI_wready[0];
  assign processing_system7_0_axi_periph_ACLK_net = ACLK;
  assign processing_system7_0_axi_periph_ARESETN_net = ARESETN;
  assign processing_system7_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign processing_system7_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign processing_system7_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign processing_system7_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign processing_system7_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign processing_system7_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_IGF0N3 m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_processing_system7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1DRNS5X m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_XX65EY m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m02_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_12QHMWW m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arready(m03_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awready(m03_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m03_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m03_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m03_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m03_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m03_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m03_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m03_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m03_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m03_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wvalid(m03_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_E5ZETX m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arprot(m04_couplers_to_processing_system7_0_axi_periph_ARPROT),
        .M_AXI_arready(m04_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awprot(m04_couplers_to_processing_system7_0_axi_periph_AWPROT),
        .M_AXI_awready(m04_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m04_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m04_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m04_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m04_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m04_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m04_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m04_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m04_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m04_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m04_couplers_to_processing_system7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_1I23HXB m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arprot(m05_couplers_to_processing_system7_0_axi_periph_ARPROT),
        .M_AXI_arready(m05_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awprot(m05_couplers_to_processing_system7_0_axi_periph_AWPROT),
        .M_AXI_awready(m05_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m05_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m05_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m05_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m05_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m05_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m05_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m05_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m05_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m05_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m05_couplers_to_processing_system7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m05_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m05_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_39T7EO m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arprot(m06_couplers_to_processing_system7_0_axi_periph_ARPROT),
        .M_AXI_arready(m06_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awprot(m06_couplers_to_processing_system7_0_axi_periph_AWPROT),
        .M_AXI_awready(m06_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(m06_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(m06_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(m06_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(m06_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(m06_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(m06_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(m06_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(m06_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(m06_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wstrb(m06_couplers_to_processing_system7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .S_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m06_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m06_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_IOUBYX s00_couplers
       (.M_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .M_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(processing_system7_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(processing_system7_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(processing_system7_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(processing_system7_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(processing_system7_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(processing_system7_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(processing_system7_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(processing_system7_0_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(processing_system7_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(processing_system7_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(processing_system7_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(processing_system7_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(processing_system7_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(processing_system7_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(processing_system7_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(processing_system7_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(processing_system7_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(processing_system7_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(processing_system7_0_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(processing_system7_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(processing_system7_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(processing_system7_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(processing_system7_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(processing_system7_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(processing_system7_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(processing_system7_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(processing_system7_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(processing_system7_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(processing_system7_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(processing_system7_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(processing_system7_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(processing_system7_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(processing_system7_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(processing_system7_0_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(processing_system7_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(processing_system7_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(processing_system7_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(processing_system7_0_axi_periph_to_s00_couplers_WVALID));
  hdmi_directpassthr_woi_xbar_0 xbar
       (.aclk(processing_system7_0_axi_periph_ACLK_net),
        .aresetn(processing_system7_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m06_couplers_ARPROT,xbar_to_m05_couplers_ARPROT,xbar_to_m04_couplers_ARPROT,NLW_xbar_m_axi_arprot_UNCONNECTED[11:0]}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m06_couplers_AWPROT,xbar_to_m05_couplers_AWPROT,xbar_to_m04_couplers_AWPROT,NLW_xbar_m_axi_awprot_UNCONNECTED[11:0]}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[15:4],xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module hdmi_sync_signals_passing_imp_18KNOZO
   (clk,
    de,
    de_in,
    hblank,
    hblank_in,
    reset_n,
    spdif,
    spdif_in,
    vblank,
    vblank_in);
  input clk;
  output [0:0]de;
  input [0:0]de_in;
  output [0:0]hblank;
  input [0:0]hblank_in;
  input reset_n;
  output [0:0]spdif;
  input [0:0]spdif_in;
  output [0:0]vblank;
  input [0:0]vblank_in;

  wire [0:0]In2_2;
  wire [0:0]image_smoothing_full_version_0_Hblank_out1;
  wire [0:0]image_smoothing_full_version_0_Vblank_out1;
  wire [0:0]image_smoothing_full_version_0_spdif_out;
  wire [0:0]pipeline_registers_1_pipe_out;
  wire [0:0]pipeline_registers_2_pipe_out;
  wire [0:0]pipeline_registers_4_pipe_out;
  wire [0:0]pipeline_registers_5_pipe_out;
  wire vbb_system_reset_0_system_reset;
  wire vbb_system_reset_0_system_reset_n;

  assign In2_2 = de_in[0];
  assign de[0] = pipeline_registers_1_pipe_out;
  assign hblank[0] = pipeline_registers_4_pipe_out;
  assign image_smoothing_full_version_0_Hblank_out1 = hblank_in[0];
  assign image_smoothing_full_version_0_Vblank_out1 = vblank_in[0];
  assign image_smoothing_full_version_0_spdif_out = spdif_in[0];
  assign spdif[0] = pipeline_registers_5_pipe_out;
  assign vbb_system_reset_0_system_reset = clk;
  assign vbb_system_reset_0_system_reset_n = reset_n;
  assign vblank[0] = pipeline_registers_2_pipe_out;
  hdmi_directpassthr_woi_pipeline_registers_1_6 de_pass
       (.clk(vbb_system_reset_0_system_reset),
        .pipe_in(In2_2),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_1_10 hblank_RnM
       (.clk(vbb_system_reset_0_system_reset),
        .pipe_in(image_smoothing_full_version_0_Hblank_out1),
        .pipe_out(pipeline_registers_4_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_1_11 spdif_RnM
       (.clk(vbb_system_reset_0_system_reset),
        .pipe_in(image_smoothing_full_version_0_spdif_out),
        .pipe_out(pipeline_registers_5_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_1_8 vblank_RnM
       (.clk(vbb_system_reset_0_system_reset),
        .pipe_in(image_smoothing_full_version_0_Vblank_out1),
        .pipe_out(pipeline_registers_2_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
endmodule

module m00_couplers_imp_3QZOB7
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [0:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [0:0]auto_pc_to_m00_couplers_ARID;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [0:0]auto_pc_to_m00_couplers_AWID;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire [5:0]auto_pc_to_m00_couplers_BID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [31:0]auto_pc_to_m00_couplers_RDATA;
  wire [5:0]auto_pc_to_m00_couplers_RID;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [31:0]auto_pc_to_m00_couplers_WDATA;
  wire [0:0]auto_pc_to_m00_couplers_WID;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [3:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [0:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [0:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [0:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [31:0]m00_couplers_to_auto_pc_RDATA;
  wire [0:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [31:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [3:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[0] = auto_pc_to_m00_couplers_ARID;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[0] = auto_pc_to_m00_couplers_AWID;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wid[0] = auto_pc_to_m00_couplers_WID;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BID = M_AXI_bid[5:0];
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_m00_couplers_RID = M_AXI_rid[5:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  hdmi_directpassthr_woi_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_m00_couplers_BID[0]),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_m00_couplers_RID[0]),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wid(auto_pc_to_m00_couplers_WID),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m00_couplers_imp_GXBIZA
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [0:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [0:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output [0:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [63:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [63:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [0:0]auto_pc_to_m00_couplers_ARID;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [0:0]auto_pc_to_m00_couplers_AWID;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire [5:0]auto_pc_to_m00_couplers_BID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [63:0]auto_pc_to_m00_couplers_RDATA;
  wire [5:0]auto_pc_to_m00_couplers_RID;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [63:0]auto_pc_to_m00_couplers_WDATA;
  wire [0:0]auto_pc_to_m00_couplers_WID;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [7:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_pc_ARADDR;
  wire [1:0]m00_couplers_to_auto_pc_ARBURST;
  wire [3:0]m00_couplers_to_auto_pc_ARCACHE;
  wire [0:0]m00_couplers_to_auto_pc_ARID;
  wire [7:0]m00_couplers_to_auto_pc_ARLEN;
  wire [0:0]m00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]m00_couplers_to_auto_pc_ARPROT;
  wire [3:0]m00_couplers_to_auto_pc_ARQOS;
  wire m00_couplers_to_auto_pc_ARREADY;
  wire [3:0]m00_couplers_to_auto_pc_ARREGION;
  wire [2:0]m00_couplers_to_auto_pc_ARSIZE;
  wire m00_couplers_to_auto_pc_ARVALID;
  wire [31:0]m00_couplers_to_auto_pc_AWADDR;
  wire [1:0]m00_couplers_to_auto_pc_AWBURST;
  wire [3:0]m00_couplers_to_auto_pc_AWCACHE;
  wire [0:0]m00_couplers_to_auto_pc_AWID;
  wire [7:0]m00_couplers_to_auto_pc_AWLEN;
  wire [0:0]m00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]m00_couplers_to_auto_pc_AWPROT;
  wire [3:0]m00_couplers_to_auto_pc_AWQOS;
  wire m00_couplers_to_auto_pc_AWREADY;
  wire [3:0]m00_couplers_to_auto_pc_AWREGION;
  wire [2:0]m00_couplers_to_auto_pc_AWSIZE;
  wire m00_couplers_to_auto_pc_AWVALID;
  wire [0:0]m00_couplers_to_auto_pc_BID;
  wire m00_couplers_to_auto_pc_BREADY;
  wire [1:0]m00_couplers_to_auto_pc_BRESP;
  wire m00_couplers_to_auto_pc_BVALID;
  wire [63:0]m00_couplers_to_auto_pc_RDATA;
  wire [0:0]m00_couplers_to_auto_pc_RID;
  wire m00_couplers_to_auto_pc_RLAST;
  wire m00_couplers_to_auto_pc_RREADY;
  wire [1:0]m00_couplers_to_auto_pc_RRESP;
  wire m00_couplers_to_auto_pc_RVALID;
  wire [63:0]m00_couplers_to_auto_pc_WDATA;
  wire m00_couplers_to_auto_pc_WLAST;
  wire m00_couplers_to_auto_pc_WREADY;
  wire [7:0]m00_couplers_to_auto_pc_WSTRB;
  wire m00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arid[0] = auto_pc_to_m00_couplers_ARID;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awid[0] = auto_pc_to_m00_couplers_AWID;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wid[0] = auto_pc_to_m00_couplers_WID;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[0] = m00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[63:0] = m00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[0] = m00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BID = M_AXI_bid[5:0];
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_m00_couplers_RID = M_AXI_rid[5:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_pc_ARID = S_AXI_arid[0];
  assign m00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_pc_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_pc_AWID = S_AXI_awid[0];
  assign m00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_pc_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_pc_WDATA = S_AXI_wdata[63:0];
  assign m00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[7:0];
  assign m00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  hdmi_directpassthr_woi_auto_pc_2 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arid(auto_pc_to_m00_couplers_ARID),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awid(auto_pc_to_m00_couplers_AWID),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bid(auto_pc_to_m00_couplers_BID[0]),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rid(auto_pc_to_m00_couplers_RID[0]),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wid(auto_pc_to_m00_couplers_WID),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(m00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(m00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_pc_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_pc_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(m00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_pc_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_pc_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_pc_BID),
        .s_axi_bready(m00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(m00_couplers_to_auto_pc_RID),
        .s_axi_rlast(m00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(m00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_pc_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(m00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_pc_WVALID));
endmodule

module m00_couplers_imp_IGF0N3
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m00_couplers_imp_OXQXPK
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arregion,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awregion,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [0:0]S_AXI_arid;
  input [7:0]S_AXI_arlen;
  input [0:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [3:0]S_AXI_arregion;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [0:0]S_AXI_awid;
  input [7:0]S_AXI_awlen;
  input [0:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [3:0]S_AXI_awregion;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [0:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [127:0]S_AXI_rdata;
  output [0:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [127:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_ds_to_auto_pc_ARADDR;
  wire [1:0]auto_ds_to_auto_pc_ARBURST;
  wire [3:0]auto_ds_to_auto_pc_ARCACHE;
  wire [7:0]auto_ds_to_auto_pc_ARLEN;
  wire [0:0]auto_ds_to_auto_pc_ARLOCK;
  wire [2:0]auto_ds_to_auto_pc_ARPROT;
  wire [3:0]auto_ds_to_auto_pc_ARQOS;
  wire auto_ds_to_auto_pc_ARREADY;
  wire [3:0]auto_ds_to_auto_pc_ARREGION;
  wire [2:0]auto_ds_to_auto_pc_ARSIZE;
  wire auto_ds_to_auto_pc_ARVALID;
  wire [31:0]auto_ds_to_auto_pc_AWADDR;
  wire [1:0]auto_ds_to_auto_pc_AWBURST;
  wire [3:0]auto_ds_to_auto_pc_AWCACHE;
  wire [7:0]auto_ds_to_auto_pc_AWLEN;
  wire [0:0]auto_ds_to_auto_pc_AWLOCK;
  wire [2:0]auto_ds_to_auto_pc_AWPROT;
  wire [3:0]auto_ds_to_auto_pc_AWQOS;
  wire auto_ds_to_auto_pc_AWREADY;
  wire [3:0]auto_ds_to_auto_pc_AWREGION;
  wire [2:0]auto_ds_to_auto_pc_AWSIZE;
  wire auto_ds_to_auto_pc_AWVALID;
  wire auto_ds_to_auto_pc_BREADY;
  wire [1:0]auto_ds_to_auto_pc_BRESP;
  wire auto_ds_to_auto_pc_BVALID;
  wire [63:0]auto_ds_to_auto_pc_RDATA;
  wire auto_ds_to_auto_pc_RLAST;
  wire auto_ds_to_auto_pc_RREADY;
  wire [1:0]auto_ds_to_auto_pc_RRESP;
  wire auto_ds_to_auto_pc_RVALID;
  wire [63:0]auto_ds_to_auto_pc_WDATA;
  wire auto_ds_to_auto_pc_WLAST;
  wire auto_ds_to_auto_pc_WREADY;
  wire [7:0]auto_ds_to_auto_pc_WSTRB;
  wire auto_ds_to_auto_pc_WVALID;
  wire [31:0]auto_pc_to_m00_couplers_ARADDR;
  wire [1:0]auto_pc_to_m00_couplers_ARBURST;
  wire [3:0]auto_pc_to_m00_couplers_ARCACHE;
  wire [3:0]auto_pc_to_m00_couplers_ARLEN;
  wire [1:0]auto_pc_to_m00_couplers_ARLOCK;
  wire [2:0]auto_pc_to_m00_couplers_ARPROT;
  wire [3:0]auto_pc_to_m00_couplers_ARQOS;
  wire auto_pc_to_m00_couplers_ARREADY;
  wire [2:0]auto_pc_to_m00_couplers_ARSIZE;
  wire auto_pc_to_m00_couplers_ARVALID;
  wire [31:0]auto_pc_to_m00_couplers_AWADDR;
  wire [1:0]auto_pc_to_m00_couplers_AWBURST;
  wire [3:0]auto_pc_to_m00_couplers_AWCACHE;
  wire [3:0]auto_pc_to_m00_couplers_AWLEN;
  wire [1:0]auto_pc_to_m00_couplers_AWLOCK;
  wire [2:0]auto_pc_to_m00_couplers_AWPROT;
  wire [3:0]auto_pc_to_m00_couplers_AWQOS;
  wire auto_pc_to_m00_couplers_AWREADY;
  wire [2:0]auto_pc_to_m00_couplers_AWSIZE;
  wire auto_pc_to_m00_couplers_AWVALID;
  wire auto_pc_to_m00_couplers_BREADY;
  wire [1:0]auto_pc_to_m00_couplers_BRESP;
  wire auto_pc_to_m00_couplers_BVALID;
  wire [63:0]auto_pc_to_m00_couplers_RDATA;
  wire auto_pc_to_m00_couplers_RLAST;
  wire auto_pc_to_m00_couplers_RREADY;
  wire [1:0]auto_pc_to_m00_couplers_RRESP;
  wire auto_pc_to_m00_couplers_RVALID;
  wire [63:0]auto_pc_to_m00_couplers_WDATA;
  wire auto_pc_to_m00_couplers_WLAST;
  wire auto_pc_to_m00_couplers_WREADY;
  wire [7:0]auto_pc_to_m00_couplers_WSTRB;
  wire auto_pc_to_m00_couplers_WVALID;
  wire [31:0]m00_couplers_to_auto_ds_ARADDR;
  wire [1:0]m00_couplers_to_auto_ds_ARBURST;
  wire [3:0]m00_couplers_to_auto_ds_ARCACHE;
  wire [0:0]m00_couplers_to_auto_ds_ARID;
  wire [7:0]m00_couplers_to_auto_ds_ARLEN;
  wire [0:0]m00_couplers_to_auto_ds_ARLOCK;
  wire [2:0]m00_couplers_to_auto_ds_ARPROT;
  wire [3:0]m00_couplers_to_auto_ds_ARQOS;
  wire m00_couplers_to_auto_ds_ARREADY;
  wire [3:0]m00_couplers_to_auto_ds_ARREGION;
  wire [2:0]m00_couplers_to_auto_ds_ARSIZE;
  wire m00_couplers_to_auto_ds_ARVALID;
  wire [31:0]m00_couplers_to_auto_ds_AWADDR;
  wire [1:0]m00_couplers_to_auto_ds_AWBURST;
  wire [3:0]m00_couplers_to_auto_ds_AWCACHE;
  wire [0:0]m00_couplers_to_auto_ds_AWID;
  wire [7:0]m00_couplers_to_auto_ds_AWLEN;
  wire [0:0]m00_couplers_to_auto_ds_AWLOCK;
  wire [2:0]m00_couplers_to_auto_ds_AWPROT;
  wire [3:0]m00_couplers_to_auto_ds_AWQOS;
  wire m00_couplers_to_auto_ds_AWREADY;
  wire [3:0]m00_couplers_to_auto_ds_AWREGION;
  wire [2:0]m00_couplers_to_auto_ds_AWSIZE;
  wire m00_couplers_to_auto_ds_AWVALID;
  wire [0:0]m00_couplers_to_auto_ds_BID;
  wire m00_couplers_to_auto_ds_BREADY;
  wire [1:0]m00_couplers_to_auto_ds_BRESP;
  wire m00_couplers_to_auto_ds_BVALID;
  wire [127:0]m00_couplers_to_auto_ds_RDATA;
  wire [0:0]m00_couplers_to_auto_ds_RID;
  wire m00_couplers_to_auto_ds_RLAST;
  wire m00_couplers_to_auto_ds_RREADY;
  wire [1:0]m00_couplers_to_auto_ds_RRESP;
  wire m00_couplers_to_auto_ds_RVALID;
  wire [127:0]m00_couplers_to_auto_ds_WDATA;
  wire m00_couplers_to_auto_ds_WLAST;
  wire m00_couplers_to_auto_ds_WREADY;
  wire [15:0]m00_couplers_to_auto_ds_WSTRB;
  wire m00_couplers_to_auto_ds_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_m00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_pc_to_m00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_pc_to_m00_couplers_ARCACHE;
  assign M_AXI_arlen[3:0] = auto_pc_to_m00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = auto_pc_to_m00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_pc_to_m00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_pc_to_m00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_pc_to_m00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_pc_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_m00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_pc_to_m00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_pc_to_m00_couplers_AWCACHE;
  assign M_AXI_awlen[3:0] = auto_pc_to_m00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = auto_pc_to_m00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_pc_to_m00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_pc_to_m00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_pc_to_m00_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_pc_to_m00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_m00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_m00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = auto_pc_to_m00_couplers_WDATA;
  assign M_AXI_wlast = auto_pc_to_m00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_pc_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_auto_ds_ARREADY;
  assign S_AXI_awready = m00_couplers_to_auto_ds_AWREADY;
  assign S_AXI_bid[0] = m00_couplers_to_auto_ds_BID;
  assign S_AXI_bresp[1:0] = m00_couplers_to_auto_ds_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_auto_ds_BVALID;
  assign S_AXI_rdata[127:0] = m00_couplers_to_auto_ds_RDATA;
  assign S_AXI_rid[0] = m00_couplers_to_auto_ds_RID;
  assign S_AXI_rlast = m00_couplers_to_auto_ds_RLAST;
  assign S_AXI_rresp[1:0] = m00_couplers_to_auto_ds_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_auto_ds_RVALID;
  assign S_AXI_wready = m00_couplers_to_auto_ds_WREADY;
  assign auto_pc_to_m00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_m00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_m00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_pc_to_m00_couplers_RLAST = M_AXI_rlast;
  assign auto_pc_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_auto_ds_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_auto_ds_ARBURST = S_AXI_arburst[1:0];
  assign m00_couplers_to_auto_ds_ARCACHE = S_AXI_arcache[3:0];
  assign m00_couplers_to_auto_ds_ARID = S_AXI_arid[0];
  assign m00_couplers_to_auto_ds_ARLEN = S_AXI_arlen[7:0];
  assign m00_couplers_to_auto_ds_ARLOCK = S_AXI_arlock[0];
  assign m00_couplers_to_auto_ds_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_auto_ds_ARQOS = S_AXI_arqos[3:0];
  assign m00_couplers_to_auto_ds_ARREGION = S_AXI_arregion[3:0];
  assign m00_couplers_to_auto_ds_ARSIZE = S_AXI_arsize[2:0];
  assign m00_couplers_to_auto_ds_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_auto_ds_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_auto_ds_AWBURST = S_AXI_awburst[1:0];
  assign m00_couplers_to_auto_ds_AWCACHE = S_AXI_awcache[3:0];
  assign m00_couplers_to_auto_ds_AWID = S_AXI_awid[0];
  assign m00_couplers_to_auto_ds_AWLEN = S_AXI_awlen[7:0];
  assign m00_couplers_to_auto_ds_AWLOCK = S_AXI_awlock[0];
  assign m00_couplers_to_auto_ds_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_auto_ds_AWQOS = S_AXI_awqos[3:0];
  assign m00_couplers_to_auto_ds_AWREGION = S_AXI_awregion[3:0];
  assign m00_couplers_to_auto_ds_AWSIZE = S_AXI_awsize[2:0];
  assign m00_couplers_to_auto_ds_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_auto_ds_BREADY = S_AXI_bready;
  assign m00_couplers_to_auto_ds_RREADY = S_AXI_rready;
  assign m00_couplers_to_auto_ds_WDATA = S_AXI_wdata[127:0];
  assign m00_couplers_to_auto_ds_WLAST = S_AXI_wlast;
  assign m00_couplers_to_auto_ds_WSTRB = S_AXI_wstrb[15:0];
  assign m00_couplers_to_auto_ds_WVALID = S_AXI_wvalid;
  hdmi_directpassthr_woi_auto_ds_0 auto_ds
       (.m_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .m_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .m_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .m_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .m_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .m_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .m_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .m_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .m_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .m_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .m_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .m_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .m_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .m_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .m_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .m_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .m_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .m_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .m_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .m_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .m_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .m_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .m_axi_bready(auto_ds_to_auto_pc_BREADY),
        .m_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .m_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .m_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .m_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .m_axi_rready(auto_ds_to_auto_pc_RREADY),
        .m_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .m_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .m_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .m_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .m_axi_wready(auto_ds_to_auto_pc_WREADY),
        .m_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .m_axi_wvalid(auto_ds_to_auto_pc_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(m00_couplers_to_auto_ds_ARADDR),
        .s_axi_arburst(m00_couplers_to_auto_ds_ARBURST),
        .s_axi_arcache(m00_couplers_to_auto_ds_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arid(m00_couplers_to_auto_ds_ARID),
        .s_axi_arlen(m00_couplers_to_auto_ds_ARLEN),
        .s_axi_arlock(m00_couplers_to_auto_ds_ARLOCK),
        .s_axi_arprot(m00_couplers_to_auto_ds_ARPROT),
        .s_axi_arqos(m00_couplers_to_auto_ds_ARQOS),
        .s_axi_arready(m00_couplers_to_auto_ds_ARREADY),
        .s_axi_arregion(m00_couplers_to_auto_ds_ARREGION),
        .s_axi_arsize(m00_couplers_to_auto_ds_ARSIZE),
        .s_axi_arvalid(m00_couplers_to_auto_ds_ARVALID),
        .s_axi_awaddr(m00_couplers_to_auto_ds_AWADDR),
        .s_axi_awburst(m00_couplers_to_auto_ds_AWBURST),
        .s_axi_awcache(m00_couplers_to_auto_ds_AWCACHE),
        .s_axi_awid(m00_couplers_to_auto_ds_AWID),
        .s_axi_awlen(m00_couplers_to_auto_ds_AWLEN),
        .s_axi_awlock(m00_couplers_to_auto_ds_AWLOCK),
        .s_axi_awprot(m00_couplers_to_auto_ds_AWPROT),
        .s_axi_awqos(m00_couplers_to_auto_ds_AWQOS),
        .s_axi_awready(m00_couplers_to_auto_ds_AWREADY),
        .s_axi_awregion(m00_couplers_to_auto_ds_AWREGION),
        .s_axi_awsize(m00_couplers_to_auto_ds_AWSIZE),
        .s_axi_awvalid(m00_couplers_to_auto_ds_AWVALID),
        .s_axi_bid(m00_couplers_to_auto_ds_BID),
        .s_axi_bready(m00_couplers_to_auto_ds_BREADY),
        .s_axi_bresp(m00_couplers_to_auto_ds_BRESP),
        .s_axi_bvalid(m00_couplers_to_auto_ds_BVALID),
        .s_axi_rdata(m00_couplers_to_auto_ds_RDATA),
        .s_axi_rid(m00_couplers_to_auto_ds_RID),
        .s_axi_rlast(m00_couplers_to_auto_ds_RLAST),
        .s_axi_rready(m00_couplers_to_auto_ds_RREADY),
        .s_axi_rresp(m00_couplers_to_auto_ds_RRESP),
        .s_axi_rvalid(m00_couplers_to_auto_ds_RVALID),
        .s_axi_wdata(m00_couplers_to_auto_ds_WDATA),
        .s_axi_wlast(m00_couplers_to_auto_ds_WLAST),
        .s_axi_wready(m00_couplers_to_auto_ds_WREADY),
        .s_axi_wstrb(m00_couplers_to_auto_ds_WSTRB),
        .s_axi_wvalid(m00_couplers_to_auto_ds_WVALID));
  hdmi_directpassthr_woi_auto_pc_1 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_m00_couplers_ARADDR),
        .m_axi_arburst(auto_pc_to_m00_couplers_ARBURST),
        .m_axi_arcache(auto_pc_to_m00_couplers_ARCACHE),
        .m_axi_arlen(auto_pc_to_m00_couplers_ARLEN),
        .m_axi_arlock(auto_pc_to_m00_couplers_ARLOCK),
        .m_axi_arprot(auto_pc_to_m00_couplers_ARPROT),
        .m_axi_arqos(auto_pc_to_m00_couplers_ARQOS),
        .m_axi_arready(auto_pc_to_m00_couplers_ARREADY),
        .m_axi_arsize(auto_pc_to_m00_couplers_ARSIZE),
        .m_axi_arvalid(auto_pc_to_m00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_m00_couplers_AWADDR),
        .m_axi_awburst(auto_pc_to_m00_couplers_AWBURST),
        .m_axi_awcache(auto_pc_to_m00_couplers_AWCACHE),
        .m_axi_awlen(auto_pc_to_m00_couplers_AWLEN),
        .m_axi_awlock(auto_pc_to_m00_couplers_AWLOCK),
        .m_axi_awprot(auto_pc_to_m00_couplers_AWPROT),
        .m_axi_awqos(auto_pc_to_m00_couplers_AWQOS),
        .m_axi_awready(auto_pc_to_m00_couplers_AWREADY),
        .m_axi_awsize(auto_pc_to_m00_couplers_AWSIZE),
        .m_axi_awvalid(auto_pc_to_m00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_m00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_m00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_m00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_m00_couplers_RDATA),
        .m_axi_rlast(auto_pc_to_m00_couplers_RLAST),
        .m_axi_rready(auto_pc_to_m00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_m00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_m00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_m00_couplers_WDATA),
        .m_axi_wlast(auto_pc_to_m00_couplers_WLAST),
        .m_axi_wready(auto_pc_to_m00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_m00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_m00_couplers_WVALID),
        .s_axi_araddr(auto_ds_to_auto_pc_ARADDR),
        .s_axi_arburst(auto_ds_to_auto_pc_ARBURST),
        .s_axi_arcache(auto_ds_to_auto_pc_ARCACHE),
        .s_axi_arlen(auto_ds_to_auto_pc_ARLEN),
        .s_axi_arlock(auto_ds_to_auto_pc_ARLOCK),
        .s_axi_arprot(auto_ds_to_auto_pc_ARPROT),
        .s_axi_arqos(auto_ds_to_auto_pc_ARQOS),
        .s_axi_arready(auto_ds_to_auto_pc_ARREADY),
        .s_axi_arregion(auto_ds_to_auto_pc_ARREGION),
        .s_axi_arsize(auto_ds_to_auto_pc_ARSIZE),
        .s_axi_arvalid(auto_ds_to_auto_pc_ARVALID),
        .s_axi_awaddr(auto_ds_to_auto_pc_AWADDR),
        .s_axi_awburst(auto_ds_to_auto_pc_AWBURST),
        .s_axi_awcache(auto_ds_to_auto_pc_AWCACHE),
        .s_axi_awlen(auto_ds_to_auto_pc_AWLEN),
        .s_axi_awlock(auto_ds_to_auto_pc_AWLOCK),
        .s_axi_awprot(auto_ds_to_auto_pc_AWPROT),
        .s_axi_awqos(auto_ds_to_auto_pc_AWQOS),
        .s_axi_awready(auto_ds_to_auto_pc_AWREADY),
        .s_axi_awregion(auto_ds_to_auto_pc_AWREGION),
        .s_axi_awsize(auto_ds_to_auto_pc_AWSIZE),
        .s_axi_awvalid(auto_ds_to_auto_pc_AWVALID),
        .s_axi_bready(auto_ds_to_auto_pc_BREADY),
        .s_axi_bresp(auto_ds_to_auto_pc_BRESP),
        .s_axi_bvalid(auto_ds_to_auto_pc_BVALID),
        .s_axi_rdata(auto_ds_to_auto_pc_RDATA),
        .s_axi_rlast(auto_ds_to_auto_pc_RLAST),
        .s_axi_rready(auto_ds_to_auto_pc_RREADY),
        .s_axi_rresp(auto_ds_to_auto_pc_RRESP),
        .s_axi_rvalid(auto_ds_to_auto_pc_RVALID),
        .s_axi_wdata(auto_ds_to_auto_pc_WDATA),
        .s_axi_wlast(auto_ds_to_auto_pc_WLAST),
        .s_axi_wready(auto_ds_to_auto_pc_WREADY),
        .s_axi_wstrb(auto_ds_to_auto_pc_WSTRB),
        .s_axi_wvalid(auto_ds_to_auto_pc_WVALID));
endmodule

module m01_couplers_imp_1DRNS5X
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_XX65EY
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m03_couplers_imp_12QHMWW
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire [0:0]m03_couplers_to_m03_couplers_ARREADY;
  wire [0:0]m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire [0:0]m03_couplers_to_m03_couplers_AWREADY;
  wire [0:0]m03_couplers_to_m03_couplers_AWVALID;
  wire [0:0]m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire [0:0]m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire [0:0]m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire [0:0]m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire [0:0]m03_couplers_to_m03_couplers_WREADY;
  wire [0:0]m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready[0] = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready[0] = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wvalid[0] = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready[0] = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready[0] = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid[0] = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid[0] = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready[0] = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready[0];
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid[0];
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready[0];
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid[0];
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready[0];
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid[0];
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready[0];
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid[0];
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready[0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m04_couplers_imp_E5ZETX
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [2:0]m04_couplers_to_m04_couplers_ARPROT;
  wire [0:0]m04_couplers_to_m04_couplers_ARREADY;
  wire [0:0]m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [2:0]m04_couplers_to_m04_couplers_AWPROT;
  wire [0:0]m04_couplers_to_m04_couplers_AWREADY;
  wire [0:0]m04_couplers_to_m04_couplers_AWVALID;
  wire [0:0]m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire [0:0]m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire [0:0]m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire [0:0]m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire [0:0]m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire [0:0]m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m04_couplers_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid[0] = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m04_couplers_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid[0] = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready[0] = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready[0] = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready[0] = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready[0] = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid[0] = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid[0] = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready[0] = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready[0];
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid[0];
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready[0];
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid[0];
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready[0];
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid[0];
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready[0];
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid[0];
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready[0];
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m05_couplers_imp_1I23HXB
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire [2:0]m05_couplers_to_m05_couplers_ARPROT;
  wire [0:0]m05_couplers_to_m05_couplers_ARREADY;
  wire [0:0]m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire [2:0]m05_couplers_to_m05_couplers_AWPROT;
  wire [0:0]m05_couplers_to_m05_couplers_AWREADY;
  wire [0:0]m05_couplers_to_m05_couplers_AWVALID;
  wire [0:0]m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire [0:0]m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire [0:0]m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire [0:0]m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire [0:0]m05_couplers_to_m05_couplers_WREADY;
  wire [3:0]m05_couplers_to_m05_couplers_WSTRB;
  wire [0:0]m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m05_couplers_to_m05_couplers_ARPROT;
  assign M_AXI_arvalid[0] = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m05_couplers_to_m05_couplers_AWPROT;
  assign M_AXI_awvalid[0] = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready[0] = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready[0] = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_couplers_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready[0] = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready[0] = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid[0] = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid[0] = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready[0] = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready[0];
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid[0];
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready[0];
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid[0];
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready[0];
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid[0];
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready[0];
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid[0];
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready[0];
  assign m05_couplers_to_m05_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m06_couplers_imp_39T7EO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m06_couplers_to_m06_couplers_ARADDR;
  wire [2:0]m06_couplers_to_m06_couplers_ARPROT;
  wire [0:0]m06_couplers_to_m06_couplers_ARREADY;
  wire [0:0]m06_couplers_to_m06_couplers_ARVALID;
  wire [31:0]m06_couplers_to_m06_couplers_AWADDR;
  wire [2:0]m06_couplers_to_m06_couplers_AWPROT;
  wire [0:0]m06_couplers_to_m06_couplers_AWREADY;
  wire [0:0]m06_couplers_to_m06_couplers_AWVALID;
  wire [0:0]m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire [0:0]m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire [0:0]m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire [0:0]m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire [0:0]m06_couplers_to_m06_couplers_WREADY;
  wire [3:0]m06_couplers_to_m06_couplers_WSTRB;
  wire [0:0]m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m06_couplers_to_m06_couplers_ARPROT;
  assign M_AXI_arvalid[0] = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m06_couplers_to_m06_couplers_AWPROT;
  assign M_AXI_awvalid[0] = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready[0] = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready[0] = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready[0] = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready[0] = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid[0] = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid[0] = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready[0] = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready[0];
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid[0];
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready[0];
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid[0];
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready[0];
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid[0];
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready[0];
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid[0];
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready[0];
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module mean1_selection_imp_1A5KHMG
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_xlconcat_0_0 mean1_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_xlslice_0_0 mean1_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_xlconstant_0_7 zero16
       (.dout(xlconstant_0_dout));
endmodule

module mean2_selection_imp_1YA8YEL
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_0 mean2_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_0 mean2_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_0 zero16
       (.dout(xlconstant_0_dout));
endmodule

module mean3_selection_imp_1KJ35R2
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_1 mean3_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_1 mean3_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_1 zero16
       (.dout(xlconstant_0_dout));
endmodule

module mog_async_fifo_rst_imp_TXCJRR
   (aresetn,
    clk,
    tuser);
  output [0:0]aresetn;
  input clk;
  input [0:0]tuser;

  wire [0:0]pipeline_registers_10_pipe_out;
  wire processing_system7_0_FCLK_CLK1;
  wire [0:0]video_overlay_unit_m_axis_mm2s_tuser;
  wire [0:0]xlconstant_1_dout;
  wire xup_or2_2_y;

  assign aresetn[0] = pipeline_registers_10_pipe_out;
  assign processing_system7_0_FCLK_CLK1 = clk;
  assign video_overlay_unit_m_axis_mm2s_tuser = tuser[0];
  hdmi_directpassthr_woi_pipeline_registers_10_0 pipeline_registers_10
       (.clk(processing_system7_0_FCLK_CLK1),
        .pipe_in(xup_or2_2_y),
        .pipe_out(pipeline_registers_10_pipe_out),
        .reset_n(xlconstant_1_dout));
  hdmi_directpassthr_woi_xlconstant_1_3 xlconstant_1
       (.dout(xlconstant_1_dout));
  hdmi_directpassthr_woi_xup_or2_2_0 xup_or2_2
       (.a(video_overlay_unit_m_axis_mm2s_tuser),
        .b(pipeline_registers_10_pipe_out),
        .y(xup_or2_2_y));
endmodule

module mog_params_extraction_imp_MXK2XH
   (mean1,
    mean2,
    mean3,
    params,
    sd1,
    sd2,
    sd3,
    w1,
    w2,
    w3);
  output [31:0]mean1;
  output [31:0]mean2;
  output [31:0]mean3;
  input [127:0]params;
  output [31:0]sd1;
  output [31:0]sd2;
  output [31:0]sd3;
  output [31:0]w1;
  output [31:0]w2;
  output [31:0]w3;

  wire [31:0]mean1_concat_dout;
  wire [31:0]mean2_selection_dout;
  wire [31:0]mean3_selection_dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [31:0]sd1_selection_dout;
  wire [31:0]sd2_selection_dout;
  wire [31:0]sd3_selection_dout;
  wire [15:0]w1_selection_Dout1;
  wire [31:0]w1_selection_dout;
  wire [15:0]w2_selection_Dout1;
  wire [31:0]w2_selection_dout;
  wire [31:0]w3_selection_dout;

  assign mean1[31:0] = sd3_selection_dout;
  assign mean2[31:0] = sd1_selection_dout;
  assign mean3[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = params[127:0];
  assign sd1[31:0] = mean3_selection_dout;
  assign sd2[31:0] = mean2_selection_dout;
  assign sd3[31:0] = sd2_selection_dout;
  assign w1[31:0] = w1_selection_dout;
  assign w2[31:0] = w2_selection_dout;
  assign w3[31:0] = w3_selection_dout;
  mean1_selection_imp_1A5KHMG mean1_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(mean1_concat_dout));
  mean2_selection_imp_1YA8YEL mean2_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(mean2_selection_dout));
  mean3_selection_imp_1KJ35R2 mean3_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(mean3_selection_dout));
  sd1_selection_imp_15YR0TI sd1_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(sd1_selection_dout));
  sd2_selection_imp_1KNB7XV sd2_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(sd2_selection_dout));
  sd3_selection_imp_1XLR6KG sd3_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .dout(sd3_selection_dout));
  w1_selection_imp_LNSPIB w1_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout1(w1_selection_Dout1),
        .dout(w1_selection_dout));
  w2_selection_imp_5U16PI w2_selection
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout1(w2_selection_Dout1),
        .dout(w2_selection_dout));
  w3_selection_imp_9Z577P w3_selection
       (.A(w1_selection_Dout1),
        .B(w2_selection_Dout1),
        .dout(w3_selection_dout));
endmodule

module mog_params_packing_imp_13GR31Q
   (dout,
    mean1_up,
    mean2_up,
    mean3_up,
    sd1_up,
    sd2_up,
    sd3_up,
    w1_up,
    w2_up);
  output [127:0]dout;
  input [31:0]mean1_up;
  input [31:0]mean2_up;
  input [31:0]mean3_up;
  input [31:0]sd1_up;
  input [31:0]sd2_up;
  input [31:0]sd3_up;
  input [31:0]w1_up;
  input [31:0]w2_up;

  wire [31:0]MixtureOfGuassians_0_mean1_up;
  wire [31:0]MixtureOfGuassians_0_mean2_up;
  wire [31:0]MixtureOfGuassians_0_mean3_up;
  wire [31:0]MixtureOfGuassians_0_sd1_up;
  wire [31:0]MixtureOfGuassians_0_sd2_up;
  wire [31:0]MixtureOfGuassians_0_sd3_up;
  wire [31:0]MixtureOfGuassians_0_w1_up;
  wire [31:0]MixtureOfGuassians_0_w2_up;
  wire [15:0]mean1_slice_Dout;
  wire [15:0]mean2_slice_Dout;
  wire [15:0]mean3_slice_Dout;
  wire [127:0]params_concat_dout;
  wire [15:0]sd1_slice_Dout;
  wire [15:0]sd2_slice_Dout;
  wire [15:0]sd3_slice_Dout;
  wire [15:0]w1_slice_Dout;
  wire [15:0]w2_slice_Dout;

  assign MixtureOfGuassians_0_mean1_up = mean3_up[31:0];
  assign MixtureOfGuassians_0_mean2_up = mean2_up[31:0];
  assign MixtureOfGuassians_0_mean3_up = w2_up[31:0];
  assign MixtureOfGuassians_0_sd1_up = sd3_up[31:0];
  assign MixtureOfGuassians_0_sd2_up = w1_up[31:0];
  assign MixtureOfGuassians_0_sd3_up = sd1_up[31:0];
  assign MixtureOfGuassians_0_w1_up = mean1_up[31:0];
  assign MixtureOfGuassians_0_w2_up = sd2_up[31:0];
  assign dout[127:0] = params_concat_dout;
  hdmi_directpassthr_woi_xlslice_0_7 mean1_slice
       (.Din(MixtureOfGuassians_0_mean1_up),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_7 mean2_slice
       (.Din(MixtureOfGuassians_0_mean2_up),
        .Dout(mean2_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_9 mean3_slice
       (.Din(MixtureOfGuassians_0_mean3_up),
        .Dout(mean3_slice_Dout));
  hdmi_directpassthr_woi_xlconcat_0_4 params_concat
       (.In0(mean1_slice_Dout),
        .In1(mean2_slice_Dout),
        .In2(mean3_slice_Dout),
        .In3(sd1_slice_Dout),
        .In4(sd2_slice_Dout),
        .In5(sd3_slice_Dout),
        .In6(w1_slice_Dout),
        .In7(w2_slice_Dout),
        .dout(params_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_10 sd1_slice
       (.Din(MixtureOfGuassians_0_sd1_up),
        .Dout(sd1_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_8 sd2_slice
       (.Din(MixtureOfGuassians_0_sd2_up),
        .Dout(sd2_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_13 sd3_slice
       (.Din(MixtureOfGuassians_0_sd3_up),
        .Dout(sd3_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_11 w1_slice
       (.Din(MixtureOfGuassians_0_w1_up),
        .Dout(w1_slice_Dout));
  hdmi_directpassthr_woi_mean1_slice_12 w2_slice
       (.Din(MixtureOfGuassians_0_w2_up),
        .Dout(w2_slice_Dout));
endmodule

module morph_pass_sel_imp_15CC6XI
   (de_after,
    de_before,
    de_morph_sel,
    fg_after,
    fg_before,
    fg_morph_sel,
    hblank_after,
    hblank_before,
    hblank_morph_sel,
    sel,
    spdif_after,
    spdif_before,
    spdif_morph_sel,
    vblank_after,
    vblank_before,
    vblank_morph_sel,
    window_en_after,
    window_en_before,
    windown_en_morph_sel);
  input [0:0]de_after;
  input [0:0]de_before;
  output [0:0]de_morph_sel;
  input [0:0]fg_after;
  input [0:0]fg_before;
  output [0:0]fg_morph_sel;
  input [0:0]hblank_after;
  input [0:0]hblank_before;
  output [0:0]hblank_morph_sel;
  input sel;
  input [0:0]spdif_after;
  input [0:0]spdif_before;
  output [0:0]spdif_morph_sel;
  input [0:0]vblank_after;
  input [0:0]vblank_before;
  output [0:0]vblank_morph_sel;
  input [0:0]window_en_after;
  input [0:0]window_en_before;
  output [0:0]windown_en_morph_sel;

  wire [0:0]In2_1;
  wire [0:0]In3_1;
  wire [0:0]In5_1;
  wire [0:0]In5_2;
  wire [0:0]image_smoothing_1_Hblank_out;
  wire [0:0]image_smoothing_1_Vblank_out;
  wire [0:0]image_smoothing_1_de_out;
  wire [0:0]image_smoothing_1_spdif_out;
  wire [0:0]image_smoothing_1_win_enable_out;
  wire [0:0]image_smoothing_full_version_0_Hblank_out;
  wire [0:0]image_smoothing_full_version_0_Vblank_out;
  wire [0:0]mog_woi_det_window_enable;
  wire sel_1;
  wire [5:0]smth_pass_over_y;
  wire [5:0]xlconcat_0_dout;
  wire [5:0]xlconcat_1_dout;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;
  wire [0:0]xlslice_4_Dout;
  wire [0:0]xlslice_5_Dout;

  assign In2_1 = de_before[0];
  assign In3_1 = spdif_before[0];
  assign In5_1 = fg_before[0];
  assign In5_2 = fg_after[0];
  assign de_morph_sel[0] = xlslice_0_Dout;
  assign fg_morph_sel[0] = xlslice_5_Dout;
  assign hblank_morph_sel[0] = xlslice_1_Dout;
  assign image_smoothing_1_Hblank_out = hblank_after[0];
  assign image_smoothing_1_Vblank_out = vblank_after[0];
  assign image_smoothing_1_de_out = de_after[0];
  assign image_smoothing_1_spdif_out = spdif_after[0];
  assign image_smoothing_1_win_enable_out = window_en_after[0];
  assign image_smoothing_full_version_0_Hblank_out = hblank_before[0];
  assign image_smoothing_full_version_0_Vblank_out = vblank_before[0];
  assign mog_woi_det_window_enable = window_en_before[0];
  assign sel_1 = sel;
  assign spdif_morph_sel[0] = xlslice_3_Dout;
  assign vblank_morph_sel[0] = xlslice_2_Dout;
  assign windown_en_morph_sel[0] = xlslice_4_Dout;
  hdmi_directpassthr_woi_after_smth_0 after_morph
       (.In0(image_smoothing_1_de_out),
        .In1(image_smoothing_1_Hblank_out),
        .In2(image_smoothing_1_Vblank_out),
        .In3(image_smoothing_1_spdif_out),
        .In4(image_smoothing_1_win_enable_out),
        .In5(In5_2),
        .dout(xlconcat_1_dout));
  hdmi_directpassthr_woi_before_smth_0 before_morph
       (.In0(In2_1),
        .In1(image_smoothing_full_version_0_Hblank_out),
        .In2(image_smoothing_full_version_0_Vblank_out),
        .In3(In3_1),
        .In4(mog_woi_det_window_enable),
        .In5(In5_1),
        .dout(xlconcat_0_dout));
  hdmi_directpassthr_woi_smth_pass_over_0 morph_pass_over
       (.a(xlconcat_0_dout),
        .b(xlconcat_1_dout),
        .sel(sel_1),
        .y(smth_pass_over_y));
  hdmi_directpassthr_woi_xlslice_0_2 xlslice_0
       (.Din(smth_pass_over_y),
        .Dout(xlslice_0_Dout));
  hdmi_directpassthr_woi_xlslice_1_1 xlslice_1
       (.Din(smth_pass_over_y),
        .Dout(xlslice_1_Dout));
  hdmi_directpassthr_woi_xlslice_2_1 xlslice_2
       (.Din(smth_pass_over_y),
        .Dout(xlslice_2_Dout));
  hdmi_directpassthr_woi_xlslice_3_1 xlslice_3
       (.Din(smth_pass_over_y),
        .Dout(xlslice_3_Dout));
  hdmi_directpassthr_woi_xlslice_4_1 xlslice_4
       (.Din(smth_pass_over_y),
        .Dout(xlslice_4_Dout));
  hdmi_directpassthr_woi_xlslice_5_1 xlslice_5
       (.Din(smth_pass_over_y),
        .Dout(xlslice_5_Dout));
endmodule

module s00_couplers_imp_3FG5KL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_arvalid;
  input [31:0]M_AXI_rdata;
  input [0:0]M_AXI_rlast;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  output [31:0]S_AXI_rdata;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RLAST;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rlast[0] = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast[0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
endmodule

module s00_couplers_imp_GVRFAO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [0:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  input [63:0]M_AXI_rdata;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  output [31:0]S_AXI_rdata;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_us_to_s00_couplers_ARADDR;
  wire [1:0]auto_us_to_s00_couplers_ARBURST;
  wire [3:0]auto_us_to_s00_couplers_ARCACHE;
  wire [7:0]auto_us_to_s00_couplers_ARLEN;
  wire [0:0]auto_us_to_s00_couplers_ARLOCK;
  wire [2:0]auto_us_to_s00_couplers_ARPROT;
  wire [3:0]auto_us_to_s00_couplers_ARQOS;
  wire auto_us_to_s00_couplers_ARREADY;
  wire [2:0]auto_us_to_s00_couplers_ARSIZE;
  wire auto_us_to_s00_couplers_ARVALID;
  wire [63:0]auto_us_to_s00_couplers_RDATA;
  wire auto_us_to_s00_couplers_RLAST;
  wire auto_us_to_s00_couplers_RREADY;
  wire [1:0]auto_us_to_s00_couplers_RRESP;
  wire auto_us_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_auto_us_ARADDR;
  wire [1:0]s00_couplers_to_auto_us_ARBURST;
  wire [3:0]s00_couplers_to_auto_us_ARCACHE;
  wire [7:0]s00_couplers_to_auto_us_ARLEN;
  wire [2:0]s00_couplers_to_auto_us_ARPROT;
  wire s00_couplers_to_auto_us_ARREADY;
  wire [2:0]s00_couplers_to_auto_us_ARSIZE;
  wire s00_couplers_to_auto_us_ARVALID;
  wire [31:0]s00_couplers_to_auto_us_RDATA;
  wire s00_couplers_to_auto_us_RLAST;
  wire s00_couplers_to_auto_us_RREADY;
  wire [1:0]s00_couplers_to_auto_us_RRESP;
  wire s00_couplers_to_auto_us_RVALID;

  assign M_AXI_araddr[31:0] = auto_us_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = auto_us_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = auto_us_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = auto_us_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[0] = auto_us_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = auto_us_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = auto_us_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = auto_us_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = auto_us_to_s00_couplers_ARVALID;
  assign M_AXI_rready = auto_us_to_s00_couplers_RREADY;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_us_ARREADY;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_us_RDATA;
  assign S_AXI_rlast = s00_couplers_to_auto_us_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_us_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_us_RVALID;
  assign auto_us_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_us_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign auto_us_to_s00_couplers_RLAST = M_AXI_rlast;
  assign auto_us_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_us_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_auto_us_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_us_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_us_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_us_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_auto_us_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_us_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_us_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_us_RREADY = S_AXI_rready;
  hdmi_directpassthr_woi_auto_us_0 auto_us
       (.m_axi_araddr(auto_us_to_s00_couplers_ARADDR),
        .m_axi_arburst(auto_us_to_s00_couplers_ARBURST),
        .m_axi_arcache(auto_us_to_s00_couplers_ARCACHE),
        .m_axi_arlen(auto_us_to_s00_couplers_ARLEN),
        .m_axi_arlock(auto_us_to_s00_couplers_ARLOCK),
        .m_axi_arprot(auto_us_to_s00_couplers_ARPROT),
        .m_axi_arqos(auto_us_to_s00_couplers_ARQOS),
        .m_axi_arready(auto_us_to_s00_couplers_ARREADY),
        .m_axi_arsize(auto_us_to_s00_couplers_ARSIZE),
        .m_axi_arvalid(auto_us_to_s00_couplers_ARVALID),
        .m_axi_rdata(auto_us_to_s00_couplers_RDATA),
        .m_axi_rlast(auto_us_to_s00_couplers_RLAST),
        .m_axi_rready(auto_us_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_us_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_us_to_s00_couplers_RVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_us_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_us_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_us_ARCACHE),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arlen(s00_couplers_to_auto_us_ARLEN),
        .s_axi_arlock(1'b0),
        .s_axi_arprot(s00_couplers_to_auto_us_ARPROT),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(s00_couplers_to_auto_us_ARREADY),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize(s00_couplers_to_auto_us_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_us_ARVALID),
        .s_axi_rdata(s00_couplers_to_auto_us_RDATA),
        .s_axi_rlast(s00_couplers_to_auto_us_RLAST),
        .s_axi_rready(s00_couplers_to_auto_us_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_us_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_us_RVALID));
endmodule

module s00_couplers_imp_IOUBYX
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  hdmi_directpassthr_woi_auto_pc_3 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module s00_couplers_imp_OH79VY
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arlen,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_rdata,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arlen,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_rdata,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [7:0]M_AXI_arlen;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output [0:0]M_AXI_arvalid;
  input [127:0]M_AXI_rdata;
  input [0:0]M_AXI_rlast;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [7:0]S_AXI_arlen;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input [0:0]S_AXI_arvalid;
  output [127:0]S_AXI_rdata;
  output [0:0]S_AXI_rlast;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [7:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [127:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RLAST;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arlen[7:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_rdata[127:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rlast[0] = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[7:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[127:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast[0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
endmodule

module s01_couplers_imp_1B4X5R8
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  output [127:0]M_AXI_wdata;
  output [0:0]M_AXI_wlast;
  input [0:0]M_AXI_wready;
  output [15:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  input [127:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [15:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire [0:0]s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire [0:0]s01_couplers_to_s01_couplers_AWVALID;
  wire [0:0]s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire [0:0]s01_couplers_to_s01_couplers_BVALID;
  wire [127:0]s01_couplers_to_s01_couplers_WDATA;
  wire [0:0]s01_couplers_to_s01_couplers_WLAST;
  wire [0:0]s01_couplers_to_s01_couplers_WREADY;
  wire [15:0]s01_couplers_to_s01_couplers_WSTRB;
  wire [0:0]s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid[0] = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready[0] = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_wdata[127:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast[0] = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[15:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_awready[0] = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_bvalid[0] = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_wready[0] = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready[0];
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid[0];
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready[0];
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid[0];
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[127:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast[0];
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready[0];
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[15:0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module s01_couplers_imp_1KVRXCQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [0:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  output [63:0]M_AXI_wdata;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  input [31:0]S_AXI_wdata;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_us_to_s01_couplers_AWADDR;
  wire [1:0]auto_us_to_s01_couplers_AWBURST;
  wire [3:0]auto_us_to_s01_couplers_AWCACHE;
  wire [7:0]auto_us_to_s01_couplers_AWLEN;
  wire [0:0]auto_us_to_s01_couplers_AWLOCK;
  wire [2:0]auto_us_to_s01_couplers_AWPROT;
  wire [3:0]auto_us_to_s01_couplers_AWQOS;
  wire auto_us_to_s01_couplers_AWREADY;
  wire [2:0]auto_us_to_s01_couplers_AWSIZE;
  wire auto_us_to_s01_couplers_AWVALID;
  wire auto_us_to_s01_couplers_BREADY;
  wire [1:0]auto_us_to_s01_couplers_BRESP;
  wire auto_us_to_s01_couplers_BVALID;
  wire [63:0]auto_us_to_s01_couplers_WDATA;
  wire auto_us_to_s01_couplers_WLAST;
  wire auto_us_to_s01_couplers_WREADY;
  wire [7:0]auto_us_to_s01_couplers_WSTRB;
  wire auto_us_to_s01_couplers_WVALID;
  wire [31:0]s01_couplers_to_auto_us_AWADDR;
  wire [1:0]s01_couplers_to_auto_us_AWBURST;
  wire [3:0]s01_couplers_to_auto_us_AWCACHE;
  wire [7:0]s01_couplers_to_auto_us_AWLEN;
  wire [2:0]s01_couplers_to_auto_us_AWPROT;
  wire s01_couplers_to_auto_us_AWREADY;
  wire [2:0]s01_couplers_to_auto_us_AWSIZE;
  wire s01_couplers_to_auto_us_AWVALID;
  wire s01_couplers_to_auto_us_BREADY;
  wire [1:0]s01_couplers_to_auto_us_BRESP;
  wire s01_couplers_to_auto_us_BVALID;
  wire [31:0]s01_couplers_to_auto_us_WDATA;
  wire s01_couplers_to_auto_us_WLAST;
  wire s01_couplers_to_auto_us_WREADY;
  wire [3:0]s01_couplers_to_auto_us_WSTRB;
  wire s01_couplers_to_auto_us_WVALID;

  assign M_AXI_awaddr[31:0] = auto_us_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = auto_us_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = auto_us_to_s01_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = auto_us_to_s01_couplers_AWLEN;
  assign M_AXI_awlock[0] = auto_us_to_s01_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = auto_us_to_s01_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = auto_us_to_s01_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = auto_us_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid = auto_us_to_s01_couplers_AWVALID;
  assign M_AXI_bready = auto_us_to_s01_couplers_BREADY;
  assign M_AXI_wdata[63:0] = auto_us_to_s01_couplers_WDATA;
  assign M_AXI_wlast = auto_us_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = auto_us_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid = auto_us_to_s01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_awready = s01_couplers_to_auto_us_AWREADY;
  assign S_AXI_bresp[1:0] = s01_couplers_to_auto_us_BRESP;
  assign S_AXI_bvalid = s01_couplers_to_auto_us_BVALID;
  assign S_AXI_wready = s01_couplers_to_auto_us_WREADY;
  assign auto_us_to_s01_couplers_AWREADY = M_AXI_awready;
  assign auto_us_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_us_to_s01_couplers_BVALID = M_AXI_bvalid;
  assign auto_us_to_s01_couplers_WREADY = M_AXI_wready;
  assign s01_couplers_to_auto_us_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_auto_us_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_auto_us_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_auto_us_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_auto_us_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_auto_us_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_auto_us_AWVALID = S_AXI_awvalid;
  assign s01_couplers_to_auto_us_BREADY = S_AXI_bready;
  assign s01_couplers_to_auto_us_WDATA = S_AXI_wdata[31:0];
  assign s01_couplers_to_auto_us_WLAST = S_AXI_wlast;
  assign s01_couplers_to_auto_us_WSTRB = S_AXI_wstrb[3:0];
  assign s01_couplers_to_auto_us_WVALID = S_AXI_wvalid;
  hdmi_directpassthr_woi_auto_us_1 auto_us
       (.m_axi_awaddr(auto_us_to_s01_couplers_AWADDR),
        .m_axi_awburst(auto_us_to_s01_couplers_AWBURST),
        .m_axi_awcache(auto_us_to_s01_couplers_AWCACHE),
        .m_axi_awlen(auto_us_to_s01_couplers_AWLEN),
        .m_axi_awlock(auto_us_to_s01_couplers_AWLOCK),
        .m_axi_awprot(auto_us_to_s01_couplers_AWPROT),
        .m_axi_awqos(auto_us_to_s01_couplers_AWQOS),
        .m_axi_awready(auto_us_to_s01_couplers_AWREADY),
        .m_axi_awsize(auto_us_to_s01_couplers_AWSIZE),
        .m_axi_awvalid(auto_us_to_s01_couplers_AWVALID),
        .m_axi_bready(auto_us_to_s01_couplers_BREADY),
        .m_axi_bresp(auto_us_to_s01_couplers_BRESP),
        .m_axi_bvalid(auto_us_to_s01_couplers_BVALID),
        .m_axi_wdata(auto_us_to_s01_couplers_WDATA),
        .m_axi_wlast(auto_us_to_s01_couplers_WLAST),
        .m_axi_wready(auto_us_to_s01_couplers_WREADY),
        .m_axi_wstrb(auto_us_to_s01_couplers_WSTRB),
        .m_axi_wvalid(auto_us_to_s01_couplers_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_awaddr(s01_couplers_to_auto_us_AWADDR),
        .s_axi_awburst(s01_couplers_to_auto_us_AWBURST),
        .s_axi_awcache(s01_couplers_to_auto_us_AWCACHE),
        .s_axi_awlen(s01_couplers_to_auto_us_AWLEN),
        .s_axi_awlock(1'b0),
        .s_axi_awprot(s01_couplers_to_auto_us_AWPROT),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(s01_couplers_to_auto_us_AWREADY),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize(s01_couplers_to_auto_us_AWSIZE),
        .s_axi_awvalid(s01_couplers_to_auto_us_AWVALID),
        .s_axi_bready(s01_couplers_to_auto_us_BREADY),
        .s_axi_bresp(s01_couplers_to_auto_us_BRESP),
        .s_axi_bvalid(s01_couplers_to_auto_us_BVALID),
        .s_axi_wdata(s01_couplers_to_auto_us_WDATA),
        .s_axi_wlast(s01_couplers_to_auto_us_WLAST),
        .s_axi_wready(s01_couplers_to_auto_us_WREADY),
        .s_axi_wstrb(s01_couplers_to_auto_us_WSTRB),
        .s_axi_wvalid(s01_couplers_to_auto_us_WVALID));
endmodule

module s01_couplers_imp_1YC7P27
   (M_ACLK,
    M_ARESETN,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awlen,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awlen,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_wdata,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [7:0]M_AXI_awlen;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  output [31:0]M_AXI_wdata;
  output [0:0]M_AXI_wlast;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [7:0]S_AXI_awlen;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  input [31:0]S_AXI_wdata;
  input [0:0]S_AXI_wlast;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s01_couplers_to_s01_couplers_AWADDR;
  wire [1:0]s01_couplers_to_s01_couplers_AWBURST;
  wire [3:0]s01_couplers_to_s01_couplers_AWCACHE;
  wire [7:0]s01_couplers_to_s01_couplers_AWLEN;
  wire [2:0]s01_couplers_to_s01_couplers_AWPROT;
  wire [0:0]s01_couplers_to_s01_couplers_AWREADY;
  wire [2:0]s01_couplers_to_s01_couplers_AWSIZE;
  wire [0:0]s01_couplers_to_s01_couplers_AWVALID;
  wire [0:0]s01_couplers_to_s01_couplers_BREADY;
  wire [1:0]s01_couplers_to_s01_couplers_BRESP;
  wire [0:0]s01_couplers_to_s01_couplers_BVALID;
  wire [31:0]s01_couplers_to_s01_couplers_WDATA;
  wire [0:0]s01_couplers_to_s01_couplers_WLAST;
  wire [0:0]s01_couplers_to_s01_couplers_WREADY;
  wire [3:0]s01_couplers_to_s01_couplers_WSTRB;
  wire [0:0]s01_couplers_to_s01_couplers_WVALID;

  assign M_AXI_awaddr[31:0] = s01_couplers_to_s01_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s01_couplers_to_s01_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s01_couplers_to_s01_couplers_AWCACHE;
  assign M_AXI_awlen[7:0] = s01_couplers_to_s01_couplers_AWLEN;
  assign M_AXI_awprot[2:0] = s01_couplers_to_s01_couplers_AWPROT;
  assign M_AXI_awsize[2:0] = s01_couplers_to_s01_couplers_AWSIZE;
  assign M_AXI_awvalid[0] = s01_couplers_to_s01_couplers_AWVALID;
  assign M_AXI_bready[0] = s01_couplers_to_s01_couplers_BREADY;
  assign M_AXI_wdata[31:0] = s01_couplers_to_s01_couplers_WDATA;
  assign M_AXI_wlast[0] = s01_couplers_to_s01_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s01_couplers_to_s01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s01_couplers_to_s01_couplers_WVALID;
  assign S_AXI_awready[0] = s01_couplers_to_s01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s01_couplers_to_s01_couplers_BRESP;
  assign S_AXI_bvalid[0] = s01_couplers_to_s01_couplers_BVALID;
  assign S_AXI_wready[0] = s01_couplers_to_s01_couplers_WREADY;
  assign s01_couplers_to_s01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s01_couplers_to_s01_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s01_couplers_to_s01_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s01_couplers_to_s01_couplers_AWLEN = S_AXI_awlen[7:0];
  assign s01_couplers_to_s01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s01_couplers_to_s01_couplers_AWREADY = M_AXI_awready[0];
  assign s01_couplers_to_s01_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s01_couplers_to_s01_couplers_AWVALID = S_AXI_awvalid[0];
  assign s01_couplers_to_s01_couplers_BREADY = S_AXI_bready[0];
  assign s01_couplers_to_s01_couplers_BRESP = M_AXI_bresp[1:0];
  assign s01_couplers_to_s01_couplers_BVALID = M_AXI_bvalid[0];
  assign s01_couplers_to_s01_couplers_WDATA = S_AXI_wdata[31:0];
  assign s01_couplers_to_s01_couplers_WLAST = S_AXI_wlast[0];
  assign s01_couplers_to_s01_couplers_WREADY = M_AXI_wready[0];
  assign s01_couplers_to_s01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s01_couplers_to_s01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module sd1_selection_imp_15YR0TI
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_2 sd1_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_2 sd1_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_2 zero16
       (.dout(xlconstant_0_dout));
endmodule

module sd2_selection_imp_1KNB7XV
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_3 sd2_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_3 sd2_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_3 zero16
       (.dout(xlconstant_0_dout));
endmodule

module sd3_selection_imp_1XLR6KG
   (Din,
    dout);
  input [127:0]Din;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_4 sd3_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_4 sd3_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_4 zero16
       (.dout(xlconstant_0_dout));
endmodule

module smth_pass_sel_imp_1J0MEQD
   (de_after,
    de_before,
    de_smth_sel,
    hblank_after,
    hblank_before,
    hblank_smth_sel,
    sel,
    spdif_after,
    spdif_before,
    spdif_smth_sel,
    vblank_after,
    vblank_before,
    vblank_smth_sel,
    window_en_after,
    window_en_before,
    windown_en_smth_sel,
    ycbcr_after,
    ycbcr_before,
    ycbcr_smth_sel);
  input [0:0]de_after;
  input [0:0]de_before;
  output [0:0]de_smth_sel;
  input [0:0]hblank_after;
  input [0:0]hblank_before;
  output [0:0]hblank_smth_sel;
  input sel;
  input [0:0]spdif_after;
  input [0:0]spdif_before;
  output [0:0]spdif_smth_sel;
  input [0:0]vblank_after;
  input [0:0]vblank_before;
  output [0:0]vblank_smth_sel;
  input [0:0]window_en_after;
  input [0:0]window_en_before;
  output [0:0]windown_en_smth_sel;
  input [15:0]ycbcr_after;
  input [15:0]ycbcr_before;
  output [15:0]ycbcr_smth_sel;

  wire [0:0]In2_1;
  wire [0:0]In3_1;
  wire [0:0]image_smoothing_1_Hblank_out;
  wire [0:0]image_smoothing_1_Vblank_out;
  wire [15:0]image_smoothing_1_data_out;
  wire [0:0]image_smoothing_1_de_out;
  wire [0:0]image_smoothing_1_spdif_out;
  wire [0:0]image_smoothing_1_win_enable_out;
  wire [0:0]image_smoothing_full_version_0_Hblank_out;
  wire [0:0]image_smoothing_full_version_0_Vblank_out;
  wire [0:0]mog_woi_det_window_enable;
  wire [15:0]pipeline_registers_1_pipe_out1;
  wire sel_1;
  wire [20:0]smth_pass_over_y;
  wire [20:0]xlconcat_0_dout;
  wire [20:0]xlconcat_1_dout;
  wire [0:0]xlslice_0_Dout;
  wire [0:0]xlslice_1_Dout;
  wire [0:0]xlslice_2_Dout;
  wire [0:0]xlslice_3_Dout;
  wire [0:0]xlslice_4_Dout;
  wire [15:0]xlslice_5_Dout;

  assign In2_1 = de_before[0];
  assign In3_1 = spdif_before[0];
  assign de_smth_sel[0] = xlslice_0_Dout;
  assign hblank_smth_sel[0] = xlslice_1_Dout;
  assign image_smoothing_1_Hblank_out = hblank_after[0];
  assign image_smoothing_1_Vblank_out = vblank_after[0];
  assign image_smoothing_1_data_out = ycbcr_after[15:0];
  assign image_smoothing_1_de_out = de_after[0];
  assign image_smoothing_1_spdif_out = spdif_after[0];
  assign image_smoothing_1_win_enable_out = window_en_after[0];
  assign image_smoothing_full_version_0_Hblank_out = hblank_before[0];
  assign image_smoothing_full_version_0_Vblank_out = vblank_before[0];
  assign mog_woi_det_window_enable = window_en_before[0];
  assign pipeline_registers_1_pipe_out1 = ycbcr_before[15:0];
  assign sel_1 = sel;
  assign spdif_smth_sel[0] = xlslice_3_Dout;
  assign vblank_smth_sel[0] = xlslice_2_Dout;
  assign windown_en_smth_sel[0] = xlslice_4_Dout;
  assign ycbcr_smth_sel[15:0] = xlslice_5_Dout;
  hdmi_directpassthr_woi_xlconcat_1_0 after_smth
       (.In0(image_smoothing_1_de_out),
        .In1(image_smoothing_1_Hblank_out),
        .In2(image_smoothing_1_Vblank_out),
        .In3(image_smoothing_1_spdif_out),
        .In4(image_smoothing_1_win_enable_out),
        .In5(image_smoothing_1_data_out),
        .dout(xlconcat_1_dout));
  hdmi_directpassthr_woi_xlconcat_0_1 before_smth
       (.In0(In2_1),
        .In1(image_smoothing_full_version_0_Hblank_out),
        .In2(image_smoothing_full_version_0_Vblank_out),
        .In3(In3_1),
        .In4(mog_woi_det_window_enable),
        .In5(pipeline_registers_1_pipe_out1),
        .dout(xlconcat_0_dout));
  hdmi_directpassthr_woi_xup_2_to_1_mux_vector_0_0 smth_pass_over
       (.a(xlconcat_0_dout),
        .b(xlconcat_1_dout),
        .sel(sel_1),
        .y(smth_pass_over_y));
  hdmi_directpassthr_woi_xlslice_0_1 xlslice_0
       (.Din(smth_pass_over_y),
        .Dout(xlslice_0_Dout));
  hdmi_directpassthr_woi_xlslice_1_0 xlslice_1
       (.Din(smth_pass_over_y),
        .Dout(xlslice_1_Dout));
  hdmi_directpassthr_woi_xlslice_2_0 xlslice_2
       (.Din(smth_pass_over_y),
        .Dout(xlslice_2_Dout));
  hdmi_directpassthr_woi_xlslice_3_0 xlslice_3
       (.Din(smth_pass_over_y),
        .Dout(xlslice_3_Dout));
  hdmi_directpassthr_woi_xlslice_4_0 xlslice_4
       (.Din(smth_pass_over_y),
        .Dout(xlslice_4_Dout));
  hdmi_directpassthr_woi_xlslice_5_0 xlslice_5
       (.Din(smth_pass_over_y),
        .Dout(xlslice_5_Dout));
endmodule

module video_overlay_unit_imp_15COLBP
   (M_AXI_MM2S_araddr,
    M_AXI_MM2S_arburst,
    M_AXI_MM2S_arcache,
    M_AXI_MM2S_arlen,
    M_AXI_MM2S_arprot,
    M_AXI_MM2S_arready,
    M_AXI_MM2S_arsize,
    M_AXI_MM2S_arvalid,
    M_AXI_MM2S_rdata,
    M_AXI_MM2S_rlast,
    M_AXI_MM2S_rready,
    M_AXI_MM2S_rresp,
    M_AXI_MM2S_rvalid,
    M_AXI_S2MM_awaddr,
    M_AXI_S2MM_awburst,
    M_AXI_S2MM_awcache,
    M_AXI_S2MM_awlen,
    M_AXI_S2MM_awprot,
    M_AXI_S2MM_awready,
    M_AXI_S2MM_awsize,
    M_AXI_S2MM_awvalid,
    M_AXI_S2MM_bready,
    M_AXI_S2MM_bresp,
    M_AXI_S2MM_bvalid,
    M_AXI_S2MM_wdata,
    M_AXI_S2MM_wlast,
    M_AXI_S2MM_wready,
    M_AXI_S2MM_wstrb,
    M_AXI_S2MM_wvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    axi_clk,
    axi_resetn,
    grayscale_pixel_in_orig,
    hdmi_clk,
    input_video_hblank,
    input_video_vblank,
    is_fg,
    m_axis_tdata,
    mm2s_introut,
    mog_window_enable,
    output_source,
    ready_to_unpack,
    s2mm_introut,
    s_axi_lite_aclk,
    system_reset,
    system_reset_n,
    unpack_enable,
    video_color_data_smth,
    video_data_out,
    video_grayscale_data_smth,
    video_overlay_set,
    window_enable,
    ycbcr_data_in_orig);
  output [31:0]M_AXI_MM2S_araddr;
  output [1:0]M_AXI_MM2S_arburst;
  output [3:0]M_AXI_MM2S_arcache;
  output [7:0]M_AXI_MM2S_arlen;
  output [2:0]M_AXI_MM2S_arprot;
  input [0:0]M_AXI_MM2S_arready;
  output [2:0]M_AXI_MM2S_arsize;
  output [0:0]M_AXI_MM2S_arvalid;
  input [31:0]M_AXI_MM2S_rdata;
  input [0:0]M_AXI_MM2S_rlast;
  output [0:0]M_AXI_MM2S_rready;
  input [1:0]M_AXI_MM2S_rresp;
  input [0:0]M_AXI_MM2S_rvalid;
  output [31:0]M_AXI_S2MM_awaddr;
  output [1:0]M_AXI_S2MM_awburst;
  output [3:0]M_AXI_S2MM_awcache;
  output [7:0]M_AXI_S2MM_awlen;
  output [2:0]M_AXI_S2MM_awprot;
  input [0:0]M_AXI_S2MM_awready;
  output [2:0]M_AXI_S2MM_awsize;
  output [0:0]M_AXI_S2MM_awvalid;
  output [0:0]M_AXI_S2MM_bready;
  input [1:0]M_AXI_S2MM_bresp;
  input [0:0]M_AXI_S2MM_bvalid;
  output [31:0]M_AXI_S2MM_wdata;
  output [0:0]M_AXI_S2MM_wlast;
  input [0:0]M_AXI_S2MM_wready;
  output [3:0]M_AXI_S2MM_wstrb;
  output [0:0]M_AXI_S2MM_wvalid;
  input [31:0]S_AXI_LITE_araddr;
  output [0:0]S_AXI_LITE_arready;
  input [0:0]S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output [0:0]S_AXI_LITE_awready;
  input [0:0]S_AXI_LITE_awvalid;
  input [0:0]S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output [0:0]S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input [0:0]S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output [0:0]S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output [0:0]S_AXI_LITE_wready;
  input [0:0]S_AXI_LITE_wvalid;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;
  input axi_clk;
  input [0:0]axi_resetn;
  input [7:0]grayscale_pixel_in_orig;
  input hdmi_clk;
  input [0:0]input_video_hblank;
  input [0:0]input_video_vblank;
  input [0:0]is_fg;
  output [31:0]m_axis_tdata;
  output mm2s_introut;
  input [0:0]mog_window_enable;
  input [3:0]output_source;
  output ready_to_unpack;
  output s2mm_introut;
  input s_axi_lite_aclk;
  input system_reset;
  input system_reset_n;
  output unpack_enable;
  input [15:0]video_color_data_smth;
  output [15:0]video_data_out;
  input [7:0]video_grayscale_data_smth;
  output [0:0]video_overlay_set;
  output window_enable;
  input [15:0]ycbcr_data_in_orig;

  wire [31:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire [0:0]Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire [0:0]Conn1_AWVALID;
  wire [0:0]Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire [0:0]Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [0:0]Conn1_WVALID;
  wire [31:0]Conn2_ARADDR;
  wire [1:0]Conn2_ARBURST;
  wire [3:0]Conn2_ARCACHE;
  wire [7:0]Conn2_ARLEN;
  wire [2:0]Conn2_ARPROT;
  wire [0:0]Conn2_ARREADY;
  wire [2:0]Conn2_ARSIZE;
  wire Conn2_ARVALID;
  wire [31:0]Conn2_RDATA;
  wire [0:0]Conn2_RLAST;
  wire Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire [0:0]Conn2_RVALID;
  wire [31:0]Conn3_AWADDR;
  wire [1:0]Conn3_AWBURST;
  wire [3:0]Conn3_AWCACHE;
  wire [7:0]Conn3_AWLEN;
  wire [2:0]Conn3_AWPROT;
  wire [0:0]Conn3_AWREADY;
  wire [2:0]Conn3_AWSIZE;
  wire Conn3_AWVALID;
  wire Conn3_BREADY;
  wire [1:0]Conn3_BRESP;
  wire [0:0]Conn3_BVALID;
  wire [31:0]Conn3_WDATA;
  wire Conn3_WLAST;
  wire [0:0]Conn3_WREADY;
  wire [3:0]Conn3_WSTRB;
  wire Conn3_WVALID;
  wire [31:0]Conn4_ARADDR;
  wire [2:0]Conn4_ARPROT;
  wire Conn4_ARREADY;
  wire [0:0]Conn4_ARVALID;
  wire [31:0]Conn4_AWADDR;
  wire [2:0]Conn4_AWPROT;
  wire Conn4_AWREADY;
  wire [0:0]Conn4_AWVALID;
  wire [0:0]Conn4_BREADY;
  wire [1:0]Conn4_BRESP;
  wire Conn4_BVALID;
  wire [31:0]Conn4_RDATA;
  wire [0:0]Conn4_RREADY;
  wire [1:0]Conn4_RRESP;
  wire Conn4_RVALID;
  wire [31:0]Conn4_WDATA;
  wire Conn4_WREADY;
  wire [3:0]Conn4_WSTRB;
  wire [0:0]Conn4_WVALID;
  wire [0:0]axi_resetn_1;
  wire [31:0]axi_vdma_0_m_axis_mm2s_tdata;
  wire [3:0]axi_vdma_0_m_axis_mm2s_tkeep;
  wire [0:0]axi_vdma_0_m_axis_mm2s_tuser;
  wire axi_vdma_0_m_axis_mm2s_tvalid;
  wire clk_1;
  wire [31:0]data_packing_0_write_data;
  wire data_packing_0_write_data_valid;
  wire data_unpacking_0_ready_to_unpack;
  wire [0:0]data_unpacking_0_video_overlay_set;
  wire [31:0]fifo_generator_0_m_axis_tdata;
  wire [7:0]image_smoothing_full_version_0_data_out;
  wire [0:0]image_smoothing_full_version_0_win_enable_out;
  wire [0:0]input_video_hblank_1;
  wire [0:0]input_video_vblank_1;
  wire [3:0]output_source_1;
  wire [0:0]pipe_in2_1;
  wire [15:0]pipe_in_1;
  wire [7:0]pipeline_registers_1_pipe_out;
  wire [0:0]pipeline_registers_2_pipe_out;
  wire [0:0]pipeline_registers_3_pipe_out;
  wire [3:0]pipeline_registers_5_pipe_out;
  wire [15:0]pipeline_registers_6_pipe_out;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_CLK1;
  wire vbb_system_reset_0_system_reset;
  wire vbb_system_reset_0_system_reset_n;
  wire [15:0]video_color_data_smth_1;
  wire [7:0]video_grayscale_data_smth_1;
  wire [15:0]video_overlay_0_video_data_out;
  wire [3:0]vovraly_rd_async_fifo_m_axis_tkeep;
  wire vovraly_rd_async_fifo_m_axis_tlast;
  wire [0:0]vovraly_rd_async_fifo_m_axis_tuser;
  wire vovraly_rd_async_fifo_m_axis_tvalid;
  wire vovraly_rd_async_fifo_s_axis_tready;
  wire [31:0]vovraly_wr_async_fifo_M_AXIS_TDATA;
  wire [3:0]vovraly_wr_async_fifo_M_AXIS_TKEEP;
  wire vovraly_wr_async_fifo_M_AXIS_TLAST;
  wire vovraly_wr_async_fifo_M_AXIS_TREADY;
  wire [0:0]vovraly_wr_async_fifo_M_AXIS_TUSER;
  wire vovraly_wr_async_fifo_M_AXIS_TVALID;
  wire vovraly_wr_async_fifo_s_axis_tready;
  wire vovrlay_woi_det_window_enable;
  wire [0:0]vovrly_async_fifo_rst_aresetn;
  wire vovrly_sync_sigs_pass_m_axis_tlast;
  wire [0:0]vovrly_sync_sigs_pass_m_axis_tuser;
  wire vovrly_sync_sigs_pass_m_axis_tvalid;
  wire vovrly_sync_sigs_pass_s_axis_tready;
  wire vovrly_vdma_m_axis_mm2s_tlast;
  wire vovrly_vdma_mm2s_introut;
  wire vovrly_vdma_s2mm_introut;
  wire xup_and3_0_y_1;
  wire xup_and3_1_y;
  wire xup_and3_1_y_1;
  wire xup_and4_0_y;
  wire xup_and4_1_y;

  assign Conn1_ARADDR = S_AXI_LITE_araddr[31:0];
  assign Conn1_ARVALID = S_AXI_LITE_arvalid[0];
  assign Conn1_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign Conn1_AWVALID = S_AXI_LITE_awvalid[0];
  assign Conn1_BREADY = S_AXI_LITE_bready[0];
  assign Conn1_RREADY = S_AXI_LITE_rready[0];
  assign Conn1_WDATA = S_AXI_LITE_wdata[31:0];
  assign Conn1_WVALID = S_AXI_LITE_wvalid[0];
  assign Conn2_ARREADY = M_AXI_MM2S_arready[0];
  assign Conn2_RDATA = M_AXI_MM2S_rdata[31:0];
  assign Conn2_RLAST = M_AXI_MM2S_rlast[0];
  assign Conn2_RRESP = M_AXI_MM2S_rresp[1:0];
  assign Conn2_RVALID = M_AXI_MM2S_rvalid[0];
  assign Conn3_AWREADY = M_AXI_S2MM_awready[0];
  assign Conn3_BRESP = M_AXI_S2MM_bresp[1:0];
  assign Conn3_BVALID = M_AXI_S2MM_bvalid[0];
  assign Conn3_WREADY = M_AXI_S2MM_wready[0];
  assign Conn4_ARADDR = S_AXI_araddr[31:0];
  assign Conn4_ARPROT = S_AXI_arprot[2:0];
  assign Conn4_ARVALID = S_AXI_arvalid[0];
  assign Conn4_AWADDR = S_AXI_awaddr[31:0];
  assign Conn4_AWPROT = S_AXI_awprot[2:0];
  assign Conn4_AWVALID = S_AXI_awvalid[0];
  assign Conn4_BREADY = S_AXI_bready[0];
  assign Conn4_RREADY = S_AXI_rready[0];
  assign Conn4_WDATA = S_AXI_wdata[31:0];
  assign Conn4_WSTRB = S_AXI_wstrb[3:0];
  assign Conn4_WVALID = S_AXI_wvalid[0];
  assign M_AXI_MM2S_araddr[31:0] = Conn2_ARADDR;
  assign M_AXI_MM2S_arburst[1:0] = Conn2_ARBURST;
  assign M_AXI_MM2S_arcache[3:0] = Conn2_ARCACHE;
  assign M_AXI_MM2S_arlen[7:0] = Conn2_ARLEN;
  assign M_AXI_MM2S_arprot[2:0] = Conn2_ARPROT;
  assign M_AXI_MM2S_arsize[2:0] = Conn2_ARSIZE;
  assign M_AXI_MM2S_arvalid[0] = Conn2_ARVALID;
  assign M_AXI_MM2S_rready[0] = Conn2_RREADY;
  assign M_AXI_S2MM_awaddr[31:0] = Conn3_AWADDR;
  assign M_AXI_S2MM_awburst[1:0] = Conn3_AWBURST;
  assign M_AXI_S2MM_awcache[3:0] = Conn3_AWCACHE;
  assign M_AXI_S2MM_awlen[7:0] = Conn3_AWLEN;
  assign M_AXI_S2MM_awprot[2:0] = Conn3_AWPROT;
  assign M_AXI_S2MM_awsize[2:0] = Conn3_AWSIZE;
  assign M_AXI_S2MM_awvalid[0] = Conn3_AWVALID;
  assign M_AXI_S2MM_bready[0] = Conn3_BREADY;
  assign M_AXI_S2MM_wdata[31:0] = Conn3_WDATA;
  assign M_AXI_S2MM_wlast[0] = Conn3_WLAST;
  assign M_AXI_S2MM_wstrb[3:0] = Conn3_WSTRB;
  assign M_AXI_S2MM_wvalid[0] = Conn3_WVALID;
  assign S_AXI_LITE_arready[0] = Conn1_ARREADY;
  assign S_AXI_LITE_awready[0] = Conn1_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = Conn1_BRESP;
  assign S_AXI_LITE_bvalid[0] = Conn1_BVALID;
  assign S_AXI_LITE_rdata[31:0] = Conn1_RDATA;
  assign S_AXI_LITE_rresp[1:0] = Conn1_RRESP;
  assign S_AXI_LITE_rvalid[0] = Conn1_RVALID;
  assign S_AXI_LITE_wready[0] = Conn1_WREADY;
  assign S_AXI_arready[0] = Conn4_ARREADY;
  assign S_AXI_awready[0] = Conn4_AWREADY;
  assign S_AXI_bresp[1:0] = Conn4_BRESP;
  assign S_AXI_bvalid[0] = Conn4_BVALID;
  assign S_AXI_rdata[31:0] = Conn4_RDATA;
  assign S_AXI_rresp[1:0] = Conn4_RRESP;
  assign S_AXI_rvalid[0] = Conn4_RVALID;
  assign S_AXI_wready[0] = Conn4_WREADY;
  assign axi_resetn_1 = axi_resetn[0];
  assign clk_1 = hdmi_clk;
  assign image_smoothing_full_version_0_data_out = grayscale_pixel_in_orig[7:0];
  assign image_smoothing_full_version_0_win_enable_out = mog_window_enable[0];
  assign input_video_hblank_1 = input_video_hblank[0];
  assign input_video_vblank_1 = input_video_vblank[0];
  assign m_axis_tdata[31:0] = fifo_generator_0_m_axis_tdata;
  assign mm2s_introut = vovrly_vdma_mm2s_introut;
  assign output_source_1 = output_source[3:0];
  assign pipe_in2_1 = is_fg[0];
  assign pipe_in_1 = ycbcr_data_in_orig[15:0];
  assign processing_system7_0_FCLK_CLK0 = s_axi_lite_aclk;
  assign processing_system7_0_FCLK_CLK1 = axi_clk;
  assign ready_to_unpack = data_unpacking_0_ready_to_unpack;
  assign s2mm_introut = vovrly_vdma_s2mm_introut;
  assign unpack_enable = xup_and3_1_y;
  assign vbb_system_reset_0_system_reset = system_reset;
  assign vbb_system_reset_0_system_reset_n = system_reset_n;
  assign video_color_data_smth_1 = video_color_data_smth[15:0];
  assign video_data_out[15:0] = video_overlay_0_video_data_out;
  assign video_grayscale_data_smth_1 = video_grayscale_data_smth[7:0];
  assign video_overlay_set[0] = data_unpacking_0_video_overlay_set;
  assign window_enable = vovrlay_woi_det_window_enable;
  hdmi_directpassthr_woi_pipeline_registers_0_2 pipeline_registers_0
       (.clk(clk_1),
        .pipe_in(video_grayscale_data_smth_1),
        .reset_n(vovrly_async_fifo_rst_aresetn));
  hdmi_directpassthr_woi_pipeline_registers_1_4 pipeline_registers_1
       (.clk(clk_1),
        .pipe_in(image_smoothing_full_version_0_data_out),
        .pipe_out(pipeline_registers_1_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_1_5 pipeline_registers_2
       (.clk(clk_1),
        .pipe_in(image_smoothing_full_version_0_win_enable_out),
        .pipe_out(pipeline_registers_2_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_1_3 pipeline_registers_3
       (.clk(clk_1),
        .pipe_in(pipe_in2_1),
        .pipe_out(pipeline_registers_3_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_pipeline_registers_4_0 pipeline_registers_4
       (.clk(clk_1),
        .pipe_in(video_color_data_smth_1),
        .reset_n(vovrly_async_fifo_rst_aresetn));
  hdmi_directpassthr_woi_pipeline_registers_5_0 pipeline_registers_5
       (.clk(clk_1),
        .pipe_in(vovraly_rd_async_fifo_m_axis_tkeep),
        .pipe_out(pipeline_registers_5_pipe_out),
        .reset_n(vovrly_async_fifo_rst_aresetn));
  hdmi_directpassthr_woi_pipeline_registers_6_0 pipeline_registers_6
       (.clk(clk_1),
        .pipe_in(pipe_in_1),
        .pipe_out(pipeline_registers_6_pipe_out),
        .reset_n(vbb_system_reset_0_system_reset_n));
  hdmi_directpassthr_woi_video_overlay_0_2 video_overlay_0
       (.clk(clk_1),
        .mog_is_fg(pipeline_registers_3_pipe_out),
        .mog_window_enable(pipeline_registers_2_pipe_out),
        .output_source(output_source_1),
        .rst(vbb_system_reset_0_system_reset),
        .video_color_data(pipeline_registers_6_pipe_out),
        .video_data_out(video_overlay_0_video_data_out),
        .video_grayscale_data(pipeline_registers_1_pipe_out),
        .video_overlay_window_enable(vovrlay_woi_det_window_enable),
        .vovrlay_is_fg(data_unpacking_0_video_overlay_set));
  hdmi_directpassthr_woi_fifo_generator_0_0 vovraly_rd_async_fifo
       (.m_aclk(clk_1),
        .m_axis_tdata(fifo_generator_0_m_axis_tdata),
        .m_axis_tkeep(vovraly_rd_async_fifo_m_axis_tkeep),
        .m_axis_tlast(vovraly_rd_async_fifo_m_axis_tlast),
        .m_axis_tready(xup_and4_1_y),
        .m_axis_tuser(vovraly_rd_async_fifo_m_axis_tuser),
        .m_axis_tvalid(vovraly_rd_async_fifo_m_axis_tvalid),
        .s_aclk(processing_system7_0_FCLK_CLK1),
        .s_aresetn(vovrly_async_fifo_rst_aresetn),
        .s_axis_tdata(axi_vdma_0_m_axis_mm2s_tdata),
        .s_axis_tkeep(axi_vdma_0_m_axis_mm2s_tkeep),
        .s_axis_tlast(vovrly_vdma_m_axis_mm2s_tlast),
        .s_axis_tready(vovraly_rd_async_fifo_s_axis_tready),
        .s_axis_tuser(axi_vdma_0_m_axis_mm2s_tuser),
        .s_axis_tvalid(axi_vdma_0_m_axis_mm2s_tvalid));
  hdmi_directpassthr_woi_fifo_generator_1_0 vovraly_wr_async_fifo
       (.m_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_tdata(vovraly_wr_async_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(vovraly_wr_async_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(vovraly_wr_async_fifo_M_AXIS_TLAST),
        .m_axis_tready(vovraly_wr_async_fifo_M_AXIS_TREADY),
        .m_axis_tuser(vovraly_wr_async_fifo_M_AXIS_TUSER),
        .m_axis_tvalid(vovraly_wr_async_fifo_M_AXIS_TVALID),
        .s_aclk(clk_1),
        .s_aresetn(vovrly_async_fifo_rst_aresetn),
        .s_axis_tdata(data_packing_0_write_data),
        .s_axis_tkeep(pipeline_registers_5_pipe_out),
        .s_axis_tlast(vovrly_sync_sigs_pass_m_axis_tlast),
        .s_axis_tready(vovraly_wr_async_fifo_s_axis_tready),
        .s_axis_tuser(vovrly_sync_sigs_pass_m_axis_tuser),
        .s_axis_tvalid(xup_and3_1_y_1));
  hdmi_directpassthr_woi_data_packing_0_0 vovrlay_data_packing_0
       (.clk(clk_1),
        .data_to_pack(pipeline_registers_3_pipe_out),
        .packing_en(vovrlay_woi_det_window_enable),
        .rst(vbb_system_reset_0_system_reset),
        .write_data(data_packing_0_write_data),
        .write_data_valid(data_packing_0_write_data_valid));
  hdmi_directpassthr_woi_axi_window_of_interest_detection_0_1 vovrlay_woi_det
       (.clk(clk_1),
        .input_video_hblank(input_video_hblank_1),
        .input_video_vblank(input_video_vblank_1),
        .rst(vbb_system_reset_0_system_reset),
        .s_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s_axi_araddr(Conn4_ARADDR[3:0]),
        .s_axi_aresetn(axi_resetn_1),
        .s_axi_arprot(Conn4_ARPROT),
        .s_axi_arready(Conn4_ARREADY),
        .s_axi_arvalid(Conn4_ARVALID),
        .s_axi_awaddr(Conn4_AWADDR[3:0]),
        .s_axi_awprot(Conn4_AWPROT),
        .s_axi_awready(Conn4_AWREADY),
        .s_axi_awvalid(Conn4_AWVALID),
        .s_axi_bready(Conn4_BREADY),
        .s_axi_bresp(Conn4_BRESP),
        .s_axi_bvalid(Conn4_BVALID),
        .s_axi_rdata(Conn4_RDATA),
        .s_axi_rready(Conn4_RREADY),
        .s_axi_rresp(Conn4_RRESP),
        .s_axi_rvalid(Conn4_RVALID),
        .s_axi_wdata(Conn4_WDATA),
        .s_axi_wready(Conn4_WREADY),
        .s_axi_wstrb(Conn4_WSTRB),
        .s_axi_wvalid(Conn4_WVALID),
        .window_enable(vovrlay_woi_det_window_enable));
  vovrly_async_fifo_rst_imp_59511 vovrly_async_fifo_rst
       (.aresetn(vovrly_async_fifo_rst_aresetn),
        .clk(processing_system7_0_FCLK_CLK1),
        .tuser(axi_vdma_0_m_axis_mm2s_tuser));
  hdmi_directpassthr_woi_data_unpacking_0_0 vovrly_data_unpacking0
       (.clk(clk_1),
        .in_data(fifo_generator_0_m_axis_tdata),
        .out_data(data_unpacking_0_video_overlay_set),
        .ready_to_unpack(data_unpacking_0_ready_to_unpack),
        .rst(vbb_system_reset_0_system_reset),
        .unpack_enable(xup_and3_1_y),
        .window_en(vovrlay_woi_det_window_enable));
  hdmi_directpassthr_woi_fifo_generator_0_4 vovrly_sync_sigs_pass
       (.m_axis_tlast(vovrly_sync_sigs_pass_m_axis_tlast),
        .m_axis_tready(xup_and3_0_y_1),
        .m_axis_tuser(vovrly_sync_sigs_pass_m_axis_tuser),
        .m_axis_tvalid(vovrly_sync_sigs_pass_m_axis_tvalid),
        .s_aclk(clk_1),
        .s_aresetn(vovrly_async_fifo_rst_aresetn),
        .s_axis_tlast(vovraly_rd_async_fifo_m_axis_tlast),
        .s_axis_tready(vovrly_sync_sigs_pass_s_axis_tready),
        .s_axis_tuser(vovraly_rd_async_fifo_m_axis_tuser),
        .s_axis_tvalid(xup_and4_0_y));
  hdmi_directpassthr_woi_axi_vdma_0_0 vovrly_vdma
       (.axi_resetn(axi_resetn_1),
        .m_axi_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_mm2s_araddr(Conn2_ARADDR),
        .m_axi_mm2s_arburst(Conn2_ARBURST),
        .m_axi_mm2s_arcache(Conn2_ARCACHE),
        .m_axi_mm2s_arlen(Conn2_ARLEN),
        .m_axi_mm2s_arprot(Conn2_ARPROT),
        .m_axi_mm2s_arready(Conn2_ARREADY),
        .m_axi_mm2s_arsize(Conn2_ARSIZE),
        .m_axi_mm2s_arvalid(Conn2_ARVALID),
        .m_axi_mm2s_rdata(Conn2_RDATA),
        .m_axi_mm2s_rlast(Conn2_RLAST),
        .m_axi_mm2s_rready(Conn2_RREADY),
        .m_axi_mm2s_rresp(Conn2_RRESP),
        .m_axi_mm2s_rvalid(Conn2_RVALID),
        .m_axi_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_s2mm_awaddr(Conn3_AWADDR),
        .m_axi_s2mm_awburst(Conn3_AWBURST),
        .m_axi_s2mm_awcache(Conn3_AWCACHE),
        .m_axi_s2mm_awlen(Conn3_AWLEN),
        .m_axi_s2mm_awprot(Conn3_AWPROT),
        .m_axi_s2mm_awready(Conn3_AWREADY),
        .m_axi_s2mm_awsize(Conn3_AWSIZE),
        .m_axi_s2mm_awvalid(Conn3_AWVALID),
        .m_axi_s2mm_bready(Conn3_BREADY),
        .m_axi_s2mm_bresp(Conn3_BRESP),
        .m_axi_s2mm_bvalid(Conn3_BVALID),
        .m_axi_s2mm_wdata(Conn3_WDATA),
        .m_axi_s2mm_wlast(Conn3_WLAST),
        .m_axi_s2mm_wready(Conn3_WREADY),
        .m_axi_s2mm_wstrb(Conn3_WSTRB),
        .m_axi_s2mm_wvalid(Conn3_WVALID),
        .m_axis_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_mm2s_tdata(axi_vdma_0_m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(axi_vdma_0_m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(vovrly_vdma_m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(vovraly_rd_async_fifo_s_axis_tready),
        .m_axis_mm2s_tuser(axi_vdma_0_m_axis_mm2s_tuser),
        .m_axis_mm2s_tvalid(axi_vdma_0_m_axis_mm2s_tvalid),
        .mm2s_introut(vovrly_vdma_mm2s_introut),
        .s2mm_introut(vovrly_vdma_s2mm_introut),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0),
        .s_axi_lite_araddr(Conn1_ARADDR[8:0]),
        .s_axi_lite_arready(Conn1_ARREADY),
        .s_axi_lite_arvalid(Conn1_ARVALID),
        .s_axi_lite_awaddr(Conn1_AWADDR[8:0]),
        .s_axi_lite_awready(Conn1_AWREADY),
        .s_axi_lite_awvalid(Conn1_AWVALID),
        .s_axi_lite_bready(Conn1_BREADY),
        .s_axi_lite_bresp(Conn1_BRESP),
        .s_axi_lite_bvalid(Conn1_BVALID),
        .s_axi_lite_rdata(Conn1_RDATA),
        .s_axi_lite_rready(Conn1_RREADY),
        .s_axi_lite_rresp(Conn1_RRESP),
        .s_axi_lite_rvalid(Conn1_RVALID),
        .s_axi_lite_wdata(Conn1_WDATA),
        .s_axi_lite_wready(Conn1_WREADY),
        .s_axi_lite_wvalid(Conn1_WVALID),
        .s_axis_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .s_axis_s2mm_tdata(vovraly_wr_async_fifo_M_AXIS_TDATA),
        .s_axis_s2mm_tkeep(vovraly_wr_async_fifo_M_AXIS_TKEEP),
        .s_axis_s2mm_tlast(vovraly_wr_async_fifo_M_AXIS_TLAST),
        .s_axis_s2mm_tready(vovraly_wr_async_fifo_M_AXIS_TREADY),
        .s_axis_s2mm_tuser(vovraly_wr_async_fifo_M_AXIS_TUSER),
        .s_axis_s2mm_tvalid(vovraly_wr_async_fifo_M_AXIS_TVALID));
  hdmi_directpassthr_woi_xup_and3_1_0 xup_and3_1
       (.a(vovrlay_woi_det_window_enable),
        .b(vbb_system_reset_0_system_reset_n),
        .c(vovraly_rd_async_fifo_m_axis_tvalid),
        .y(xup_and3_1_y));
  hdmi_directpassthr_woi_xup_and3_0_3 xup_and3_2
       (.a(data_packing_0_write_data_valid),
        .b(vovraly_wr_async_fifo_s_axis_tready),
        .c(vbb_system_reset_0_system_reset_n),
        .y(xup_and3_0_y_1));
  hdmi_directpassthr_woi_xup_and3_1_2 xup_and3_3
       (.a(data_packing_0_write_data_valid),
        .b(vovrly_sync_sigs_pass_m_axis_tvalid),
        .c(vbb_system_reset_0_system_reset_n),
        .y(xup_and3_1_y_1));
  hdmi_directpassthr_woi_xup_and4_0_0 xup_and4_0
       (.a(data_unpacking_0_ready_to_unpack),
        .b(vovraly_rd_async_fifo_m_axis_tvalid),
        .c(vovrlay_woi_det_window_enable),
        .d(vbb_system_reset_0_system_reset_n),
        .y(xup_and4_0_y));
  hdmi_directpassthr_woi_xup_and4_1_0 xup_and4_1
       (.a(data_unpacking_0_ready_to_unpack),
        .b(vovrly_sync_sigs_pass_s_axis_tready),
        .c(vovrlay_woi_det_window_enable),
        .d(vbb_system_reset_0_system_reset_n),
        .y(xup_and4_1_y));
endmodule

module vovrly_async_fifo_rst_imp_59511
   (aresetn,
    clk,
    tuser);
  output [0:0]aresetn;
  input clk;
  input [0:0]tuser;

  wire [0:0]pipeline_registers_10_pipe_out;
  wire processing_system7_0_FCLK_CLK1;
  wire [0:0]video_overlay_unit_m_axis_mm2s_tuser;
  wire [0:0]xlconstant_1_dout;
  wire xup_or2_2_y;

  assign aresetn[0] = pipeline_registers_10_pipe_out;
  assign processing_system7_0_FCLK_CLK1 = clk;
  assign video_overlay_unit_m_axis_mm2s_tuser = tuser[0];
  hdmi_directpassthr_woi_pipeline_registers_1_7 pipeline_registers_10
       (.clk(processing_system7_0_FCLK_CLK1),
        .pipe_in(xup_or2_2_y),
        .pipe_out(pipeline_registers_10_pipe_out),
        .reset_n(xlconstant_1_dout));
  hdmi_directpassthr_woi_xlconstant_1_2 xlconstant_1
       (.dout(xlconstant_1_dout));
  hdmi_directpassthr_woi_xup_or2_0_1 xup_or2_2
       (.a(video_overlay_unit_m_axis_mm2s_tuser),
        .b(pipeline_registers_10_pipe_out),
        .y(xup_or2_2_y));
endmodule

module w1_selection_imp_LNSPIB
   (Din,
    Dout1,
    dout);
  input [127:0]Din;
  output [15:0]Dout1;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign Dout1[15:0] = mean1_slice_Dout;
  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_5 w1_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_5 w1_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_5 zero16
       (.dout(xlconstant_0_dout));
endmodule

module w2_selection_imp_5U16PI
   (Din,
    Dout1,
    dout);
  input [127:0]Din;
  output [15:0]Dout1;
  output [31:0]dout;

  wire [31:0]mean1_concat_dout;
  wire [15:0]mean1_slice_Dout;
  wire [127:0]mog_params_read_async_fifo_m_axis_tdata;
  wire [15:0]xlconstant_0_dout;

  assign Dout1[15:0] = mean1_slice_Dout;
  assign dout[31:0] = mean1_concat_dout;
  assign mog_params_read_async_fifo_m_axis_tdata = Din[127:0];
  hdmi_directpassthr_woi_mean1_concat_6 w2_concat
       (.In0(xlconstant_0_dout),
        .In1(mean1_slice_Dout),
        .dout(mean1_concat_dout));
  hdmi_directpassthr_woi_mean1_slice_6 w2_slice
       (.Din(mog_params_read_async_fifo_m_axis_tdata),
        .Dout(mean1_slice_Dout));
  hdmi_directpassthr_woi_zero16_6 zero16
       (.dout(xlconstant_0_dout));
endmodule

module w3_selection_imp_9Z577P
   (A,
    B,
    dout);
  input [15:0]A;
  input [15:0]B;
  output [31:0]dout;

  wire [15:0]A_1;
  wire [15:0]B_1;
  wire [15:0]one16_dout;
  wire [15:0]one16subw1addw2_S;
  wire [15:0]w1addw2_S;
  wire [31:0]w3_concat_dout;
  wire [15:0]zero16_dout;

  assign A_1 = A[15:0];
  assign B_1 = B[15:0];
  assign dout[31:0] = w3_concat_dout;
  hdmi_directpassthr_woi_xlconstant_0_8 one16
       (.dout(one16_dout));
  hdmi_directpassthr_woi_c_addsub_0_1 one16subw1addw2
       (.A(one16_dout),
        .B(w1addw2_S),
        .S(one16subw1addw2_S));
  hdmi_directpassthr_woi_c_addsub_0_0 w1addw2
       (.A(A_1),
        .B(B_1),
        .S(w1addw2_S));
  hdmi_directpassthr_woi_xlconcat_0_6 w3_concat
       (.In0(zero16_dout),
        .In1(one16subw1addw2_S),
        .dout(w3_concat_dout));
  hdmi_directpassthr_woi_xlconstant_0_12 zero16
       (.dout(zero16_dout));
endmodule

module ycbcr2gray_imp_17699X5
   (Din,
    Dout);
  input [15:0]Din;
  output [7:0]Dout;

  wire [7:0]cbcr_gray_dout;
  wire [15:0]swap_dout;
  wire [7:0]y_sel_Dout;

  assign Dout[7:0] = y_sel_Dout;
  assign swap_dout = Din[15:0];
  hdmi_directpassthr_woi_cbcr_gray_0 cbcr_gray
       (.dout(cbcr_gray_dout));
  hdmi_directpassthr_woi_concatenation_0 concatenation
       (.In0(cbcr_gray_dout),
        .In1(y_sel_Dout));
  hdmi_directpassthr_woi_y_sel_0 y_sel
       (.Din(swap_dout),
        .Dout(y_sel_Dout));
endmodule

module ycbcr2mem_unit_imp_19QCTOK
   (M_AXI_MM2S_araddr,
    M_AXI_MM2S_arburst,
    M_AXI_MM2S_arcache,
    M_AXI_MM2S_arlen,
    M_AXI_MM2S_arprot,
    M_AXI_MM2S_arready,
    M_AXI_MM2S_arsize,
    M_AXI_MM2S_arvalid,
    M_AXI_MM2S_rdata,
    M_AXI_MM2S_rlast,
    M_AXI_MM2S_rready,
    M_AXI_MM2S_rresp,
    M_AXI_MM2S_rvalid,
    M_AXI_S2MM_awaddr,
    M_AXI_S2MM_awburst,
    M_AXI_S2MM_awcache,
    M_AXI_S2MM_awlen,
    M_AXI_S2MM_awprot,
    M_AXI_S2MM_awready,
    M_AXI_S2MM_awsize,
    M_AXI_S2MM_awvalid,
    M_AXI_S2MM_bready,
    M_AXI_S2MM_bresp,
    M_AXI_S2MM_bvalid,
    M_AXI_S2MM_wdata,
    M_AXI_S2MM_wlast,
    M_AXI_S2MM_wready,
    M_AXI_S2MM_wstrb,
    M_AXI_S2MM_wvalid,
    S_AXI_LITE_araddr,
    S_AXI_LITE_arready,
    S_AXI_LITE_arvalid,
    S_AXI_LITE_awaddr,
    S_AXI_LITE_awready,
    S_AXI_LITE_awvalid,
    S_AXI_LITE_bready,
    S_AXI_LITE_bresp,
    S_AXI_LITE_bvalid,
    S_AXI_LITE_rdata,
    S_AXI_LITE_rready,
    S_AXI_LITE_rresp,
    S_AXI_LITE_rvalid,
    S_AXI_LITE_wdata,
    S_AXI_LITE_wready,
    S_AXI_LITE_wvalid,
    axi_resetn,
    clk,
    m_axi_mm2s_aclk,
    rst,
    s_axi_lite_aclk,
    system_resetn,
    window_en,
    ycbcr_data);
  output [31:0]M_AXI_MM2S_araddr;
  output [1:0]M_AXI_MM2S_arburst;
  output [3:0]M_AXI_MM2S_arcache;
  output [7:0]M_AXI_MM2S_arlen;
  output [2:0]M_AXI_MM2S_arprot;
  input M_AXI_MM2S_arready;
  output [2:0]M_AXI_MM2S_arsize;
  output M_AXI_MM2S_arvalid;
  input [31:0]M_AXI_MM2S_rdata;
  input M_AXI_MM2S_rlast;
  output M_AXI_MM2S_rready;
  input [1:0]M_AXI_MM2S_rresp;
  input M_AXI_MM2S_rvalid;
  output [31:0]M_AXI_S2MM_awaddr;
  output [1:0]M_AXI_S2MM_awburst;
  output [3:0]M_AXI_S2MM_awcache;
  output [7:0]M_AXI_S2MM_awlen;
  output [2:0]M_AXI_S2MM_awprot;
  input M_AXI_S2MM_awready;
  output [2:0]M_AXI_S2MM_awsize;
  output M_AXI_S2MM_awvalid;
  output M_AXI_S2MM_bready;
  input [1:0]M_AXI_S2MM_bresp;
  input M_AXI_S2MM_bvalid;
  output [31:0]M_AXI_S2MM_wdata;
  output M_AXI_S2MM_wlast;
  input M_AXI_S2MM_wready;
  output [3:0]M_AXI_S2MM_wstrb;
  output M_AXI_S2MM_wvalid;
  input [31:0]S_AXI_LITE_araddr;
  output [0:0]S_AXI_LITE_arready;
  input [0:0]S_AXI_LITE_arvalid;
  input [31:0]S_AXI_LITE_awaddr;
  output [0:0]S_AXI_LITE_awready;
  input [0:0]S_AXI_LITE_awvalid;
  input [0:0]S_AXI_LITE_bready;
  output [1:0]S_AXI_LITE_bresp;
  output [0:0]S_AXI_LITE_bvalid;
  output [31:0]S_AXI_LITE_rdata;
  input [0:0]S_AXI_LITE_rready;
  output [1:0]S_AXI_LITE_rresp;
  output [0:0]S_AXI_LITE_rvalid;
  input [31:0]S_AXI_LITE_wdata;
  output [0:0]S_AXI_LITE_wready;
  input [0:0]S_AXI_LITE_wvalid;
  input [0:0]axi_resetn;
  input clk;
  input m_axi_mm2s_aclk;
  input rst;
  input s_axi_lite_aclk;
  input system_resetn;
  input [0:0]window_en;
  input [15:0]ycbcr_data;

  wire clk_1;
  wire [0:0]pipeline_registers_0_pipe_out;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_CLK1;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_ARADDR;
  wire processing_system7_0_axi_periph_M03_AXI_ARREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_AWADDR;
  wire processing_system7_0_axi_periph_M03_AXI_AWREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_AWVALID;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M03_AXI_BRESP;
  wire processing_system7_0_axi_periph_M03_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_RDATA;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M03_AXI_RRESP;
  wire processing_system7_0_axi_periph_M03_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M03_AXI_WDATA;
  wire processing_system7_0_axi_periph_M03_AXI_WREADY;
  wire [0:0]processing_system7_0_axi_periph_M03_AXI_WVALID;
  wire [0:0]rst_processing_system7_0_100M_peripheral_aresetn;
  wire [3:0]tkeep_pass_pipe_out;
  wire unpack_enable;
  wire vbb_system_reset_0_system_reset;
  wire vbb_system_reset_0_system_reset_n;
  wire [0:0]window_en;
  wire xup_and3_0_y;
  wire xup_and3_1_y;
  wire xup_and4_0_y;
  wire xup_and4_1_y;
  wire [15:0]ycbcr_data;
  wire [31:0]ycbcr_data_packing_0_write_data;
  wire ycbcr_data_packing_0_write_data_valid;
  wire ycbcr_data_unpacking_0_ready_to_unpack;
  wire [31:0]ycbcr_mem_read_async_fifo_m_axis_tdata;
  wire [3:0]ycbcr_mem_read_async_fifo_m_axis_tkeep;
  wire ycbcr_mem_read_async_fifo_m_axis_tlast;
  wire [0:0]ycbcr_mem_read_async_fifo_m_axis_tuser;
  wire ycbcr_mem_read_async_fifo_m_axis_tvalid;
  wire ycbcr_mem_read_async_fifo_s_axis_tready;
  wire ycbcr_mem_sync_sigs_async_fifo_m_axis_tlast;
  wire [0:0]ycbcr_mem_sync_sigs_async_fifo_m_axis_tuser;
  wire ycbcr_mem_sync_sigs_async_fifo_m_axis_tvalid;
  wire ycbcr_mem_sync_sigs_async_fifo_s_axis_tready;
  wire [31:0]ycbcr_mem_write_async_fifo_M_AXIS_TDATA;
  wire [3:0]ycbcr_mem_write_async_fifo_M_AXIS_TKEEP;
  wire ycbcr_mem_write_async_fifo_M_AXIS_TLAST;
  wire ycbcr_mem_write_async_fifo_M_AXIS_TREADY;
  wire [0:0]ycbcr_mem_write_async_fifo_M_AXIS_TUSER;
  wire ycbcr_mem_write_async_fifo_M_AXIS_TVALID;
  wire ycbcr_mem_write_async_fifo_s_axis_tready;
  wire [31:0]ycbcr_vdma_M_AXI_MM2S_ARADDR;
  wire [1:0]ycbcr_vdma_M_AXI_MM2S_ARBURST;
  wire [3:0]ycbcr_vdma_M_AXI_MM2S_ARCACHE;
  wire [7:0]ycbcr_vdma_M_AXI_MM2S_ARLEN;
  wire [2:0]ycbcr_vdma_M_AXI_MM2S_ARPROT;
  wire ycbcr_vdma_M_AXI_MM2S_ARREADY;
  wire [2:0]ycbcr_vdma_M_AXI_MM2S_ARSIZE;
  wire ycbcr_vdma_M_AXI_MM2S_ARVALID;
  wire [31:0]ycbcr_vdma_M_AXI_MM2S_RDATA;
  wire ycbcr_vdma_M_AXI_MM2S_RLAST;
  wire ycbcr_vdma_M_AXI_MM2S_RREADY;
  wire [1:0]ycbcr_vdma_M_AXI_MM2S_RRESP;
  wire ycbcr_vdma_M_AXI_MM2S_RVALID;
  wire [31:0]ycbcr_vdma_M_AXI_S2MM_AWADDR;
  wire [1:0]ycbcr_vdma_M_AXI_S2MM_AWBURST;
  wire [3:0]ycbcr_vdma_M_AXI_S2MM_AWCACHE;
  wire [7:0]ycbcr_vdma_M_AXI_S2MM_AWLEN;
  wire [2:0]ycbcr_vdma_M_AXI_S2MM_AWPROT;
  wire ycbcr_vdma_M_AXI_S2MM_AWREADY;
  wire [2:0]ycbcr_vdma_M_AXI_S2MM_AWSIZE;
  wire ycbcr_vdma_M_AXI_S2MM_AWVALID;
  wire ycbcr_vdma_M_AXI_S2MM_BREADY;
  wire [1:0]ycbcr_vdma_M_AXI_S2MM_BRESP;
  wire ycbcr_vdma_M_AXI_S2MM_BVALID;
  wire [31:0]ycbcr_vdma_M_AXI_S2MM_WDATA;
  wire ycbcr_vdma_M_AXI_S2MM_WLAST;
  wire ycbcr_vdma_M_AXI_S2MM_WREADY;
  wire [3:0]ycbcr_vdma_M_AXI_S2MM_WSTRB;
  wire ycbcr_vdma_M_AXI_S2MM_WVALID;
  wire [31:0]ycbcr_vdma_m_axis_mm2s_tdata;
  wire [3:0]ycbcr_vdma_m_axis_mm2s_tkeep;
  wire ycbcr_vdma_m_axis_mm2s_tlast;
  wire [0:0]ycbcr_vdma_m_axis_mm2s_tuser;
  wire ycbcr_vdma_m_axis_mm2s_tvalid;

  assign M_AXI_MM2S_araddr[31:0] = ycbcr_vdma_M_AXI_MM2S_ARADDR;
  assign M_AXI_MM2S_arburst[1:0] = ycbcr_vdma_M_AXI_MM2S_ARBURST;
  assign M_AXI_MM2S_arcache[3:0] = ycbcr_vdma_M_AXI_MM2S_ARCACHE;
  assign M_AXI_MM2S_arlen[7:0] = ycbcr_vdma_M_AXI_MM2S_ARLEN;
  assign M_AXI_MM2S_arprot[2:0] = ycbcr_vdma_M_AXI_MM2S_ARPROT;
  assign M_AXI_MM2S_arsize[2:0] = ycbcr_vdma_M_AXI_MM2S_ARSIZE;
  assign M_AXI_MM2S_arvalid = ycbcr_vdma_M_AXI_MM2S_ARVALID;
  assign M_AXI_MM2S_rready = ycbcr_vdma_M_AXI_MM2S_RREADY;
  assign M_AXI_S2MM_awaddr[31:0] = ycbcr_vdma_M_AXI_S2MM_AWADDR;
  assign M_AXI_S2MM_awburst[1:0] = ycbcr_vdma_M_AXI_S2MM_AWBURST;
  assign M_AXI_S2MM_awcache[3:0] = ycbcr_vdma_M_AXI_S2MM_AWCACHE;
  assign M_AXI_S2MM_awlen[7:0] = ycbcr_vdma_M_AXI_S2MM_AWLEN;
  assign M_AXI_S2MM_awprot[2:0] = ycbcr_vdma_M_AXI_S2MM_AWPROT;
  assign M_AXI_S2MM_awsize[2:0] = ycbcr_vdma_M_AXI_S2MM_AWSIZE;
  assign M_AXI_S2MM_awvalid = ycbcr_vdma_M_AXI_S2MM_AWVALID;
  assign M_AXI_S2MM_bready = ycbcr_vdma_M_AXI_S2MM_BREADY;
  assign M_AXI_S2MM_wdata[31:0] = ycbcr_vdma_M_AXI_S2MM_WDATA;
  assign M_AXI_S2MM_wlast = ycbcr_vdma_M_AXI_S2MM_WLAST;
  assign M_AXI_S2MM_wstrb[3:0] = ycbcr_vdma_M_AXI_S2MM_WSTRB;
  assign M_AXI_S2MM_wvalid = ycbcr_vdma_M_AXI_S2MM_WVALID;
  assign S_AXI_LITE_arready[0] = processing_system7_0_axi_periph_M03_AXI_ARREADY;
  assign S_AXI_LITE_awready[0] = processing_system7_0_axi_periph_M03_AXI_AWREADY;
  assign S_AXI_LITE_bresp[1:0] = processing_system7_0_axi_periph_M03_AXI_BRESP;
  assign S_AXI_LITE_bvalid[0] = processing_system7_0_axi_periph_M03_AXI_BVALID;
  assign S_AXI_LITE_rdata[31:0] = processing_system7_0_axi_periph_M03_AXI_RDATA;
  assign S_AXI_LITE_rresp[1:0] = processing_system7_0_axi_periph_M03_AXI_RRESP;
  assign S_AXI_LITE_rvalid[0] = processing_system7_0_axi_periph_M03_AXI_RVALID;
  assign S_AXI_LITE_wready[0] = processing_system7_0_axi_periph_M03_AXI_WREADY;
  assign clk_1 = clk;
  assign processing_system7_0_FCLK_CLK0 = s_axi_lite_aclk;
  assign processing_system7_0_FCLK_CLK1 = m_axi_mm2s_aclk;
  assign processing_system7_0_axi_periph_M03_AXI_ARADDR = S_AXI_LITE_araddr[31:0];
  assign processing_system7_0_axi_periph_M03_AXI_ARVALID = S_AXI_LITE_arvalid[0];
  assign processing_system7_0_axi_periph_M03_AXI_AWADDR = S_AXI_LITE_awaddr[31:0];
  assign processing_system7_0_axi_periph_M03_AXI_AWVALID = S_AXI_LITE_awvalid[0];
  assign processing_system7_0_axi_periph_M03_AXI_BREADY = S_AXI_LITE_bready[0];
  assign processing_system7_0_axi_periph_M03_AXI_RREADY = S_AXI_LITE_rready[0];
  assign processing_system7_0_axi_periph_M03_AXI_WDATA = S_AXI_LITE_wdata[31:0];
  assign processing_system7_0_axi_periph_M03_AXI_WVALID = S_AXI_LITE_wvalid[0];
  assign rst_processing_system7_0_100M_peripheral_aresetn = axi_resetn[0];
  assign vbb_system_reset_0_system_reset = rst;
  assign vbb_system_reset_0_system_reset_n = system_resetn;
  assign ycbcr_vdma_M_AXI_MM2S_ARREADY = M_AXI_MM2S_arready;
  assign ycbcr_vdma_M_AXI_MM2S_RDATA = M_AXI_MM2S_rdata[31:0];
  assign ycbcr_vdma_M_AXI_MM2S_RLAST = M_AXI_MM2S_rlast;
  assign ycbcr_vdma_M_AXI_MM2S_RRESP = M_AXI_MM2S_rresp[1:0];
  assign ycbcr_vdma_M_AXI_MM2S_RVALID = M_AXI_MM2S_rvalid;
  assign ycbcr_vdma_M_AXI_S2MM_AWREADY = M_AXI_S2MM_awready;
  assign ycbcr_vdma_M_AXI_S2MM_BRESP = M_AXI_S2MM_bresp[1:0];
  assign ycbcr_vdma_M_AXI_S2MM_BVALID = M_AXI_S2MM_bvalid;
  assign ycbcr_vdma_M_AXI_S2MM_WREADY = M_AXI_S2MM_wready;
  hdmi_directpassthr_woi_pipeline_registers_0_1 tkeep_pass
       (.clk(clk_1),
        .pipe_in(ycbcr_mem_read_async_fifo_m_axis_tkeep),
        .pipe_out(tkeep_pass_pipe_out),
        .reset_n(pipeline_registers_0_pipe_out));
  hdmi_directpassthr_woi_xup_and3_0_0 xup_and3_0
       (.a(ycbcr_mem_sync_sigs_async_fifo_m_axis_tvalid),
        .b(vbb_system_reset_0_system_reset_n),
        .c(ycbcr_data_packing_0_write_data_valid),
        .y(xup_and3_0_y));
  hdmi_directpassthr_woi_xup_and3_1_3 xup_and3_1
       (.a(ycbcr_mem_write_async_fifo_s_axis_tready),
        .b(vbb_system_reset_0_system_reset_n),
        .c(ycbcr_data_packing_0_write_data_valid),
        .y(xup_and3_1_y));
  hdmi_directpassthr_woi_xup_and3_2_1 xup_and3_2
       (.a(window_en),
        .b(vbb_system_reset_0_system_reset_n),
        .c(ycbcr_mem_read_async_fifo_m_axis_tvalid),
        .y(unpack_enable));
  hdmi_directpassthr_woi_xup_and4_0_1 xup_and4_0
       (.a(ycbcr_data_unpacking_0_ready_to_unpack),
        .b(vbb_system_reset_0_system_reset_n),
        .c(ycbcr_mem_sync_sigs_async_fifo_s_axis_tready),
        .d(window_en),
        .y(xup_and4_0_y));
  hdmi_directpassthr_woi_xup_and4_1_1 xup_and4_1
       (.a(ycbcr_data_unpacking_0_ready_to_unpack),
        .b(vbb_system_reset_0_system_reset_n),
        .c(ycbcr_mem_read_async_fifo_m_axis_tvalid),
        .d(window_en),
        .y(xup_and4_1_y));
  ycbcr_aresetn_gen_imp_I682TY ycbcr_aresetn_gen
       (.aresetn(pipeline_registers_0_pipe_out),
        .clk(clk_1),
        .tuser(ycbcr_vdma_m_axis_mm2s_tuser));
  hdmi_directpassthr_woi_data_packing_0_1 ycbcr_data_packing_0
       (.clk(clk_1),
        .data_to_pack(ycbcr_data),
        .packing_en(window_en),
        .rst(vbb_system_reset_0_system_reset),
        .write_data(ycbcr_data_packing_0_write_data),
        .write_data_valid(ycbcr_data_packing_0_write_data_valid));
  hdmi_directpassthr_woi_data_unpacking_0_1 ycbcr_data_unpacking_0
       (.clk(clk_1),
        .in_data(ycbcr_mem_read_async_fifo_m_axis_tdata),
        .ready_to_unpack(ycbcr_data_unpacking_0_ready_to_unpack),
        .rst(vbb_system_reset_0_system_reset),
        .unpack_enable(unpack_enable),
        .window_en(window_en));
  hdmi_directpassthr_woi_fifo_generator_0_6 ycbcr_mem_read_async_fifo
       (.m_aclk(clk_1),
        .m_axis_tdata(ycbcr_mem_read_async_fifo_m_axis_tdata),
        .m_axis_tkeep(ycbcr_mem_read_async_fifo_m_axis_tkeep),
        .m_axis_tlast(ycbcr_mem_read_async_fifo_m_axis_tlast),
        .m_axis_tready(xup_and4_0_y),
        .m_axis_tuser(ycbcr_mem_read_async_fifo_m_axis_tuser),
        .m_axis_tvalid(ycbcr_mem_read_async_fifo_m_axis_tvalid),
        .s_aclk(processing_system7_0_FCLK_CLK1),
        .s_aresetn(pipeline_registers_0_pipe_out),
        .s_axis_tdata(ycbcr_vdma_m_axis_mm2s_tdata),
        .s_axis_tkeep(ycbcr_vdma_m_axis_mm2s_tkeep),
        .s_axis_tlast(ycbcr_vdma_m_axis_mm2s_tlast),
        .s_axis_tready(ycbcr_mem_read_async_fifo_s_axis_tready),
        .s_axis_tuser(ycbcr_vdma_m_axis_mm2s_tuser),
        .s_axis_tvalid(ycbcr_vdma_m_axis_mm2s_tvalid));
  hdmi_directpassthr_woi_fifo_generator_0_7 ycbcr_mem_sync_sigs_async_fifo
       (.m_axis_tlast(ycbcr_mem_sync_sigs_async_fifo_m_axis_tlast),
        .m_axis_tready(xup_and3_1_y),
        .m_axis_tuser(ycbcr_mem_sync_sigs_async_fifo_m_axis_tuser),
        .m_axis_tvalid(ycbcr_mem_sync_sigs_async_fifo_m_axis_tvalid),
        .s_aclk(clk_1),
        .s_aresetn(pipeline_registers_0_pipe_out),
        .s_axis_tlast(ycbcr_mem_read_async_fifo_m_axis_tlast),
        .s_axis_tready(ycbcr_mem_sync_sigs_async_fifo_s_axis_tready),
        .s_axis_tuser(ycbcr_mem_read_async_fifo_m_axis_tuser),
        .s_axis_tvalid(xup_and4_1_y));
  hdmi_directpassthr_woi_fifo_generator_0_8 ycbcr_mem_write_async_fifo
       (.m_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_tdata(ycbcr_mem_write_async_fifo_M_AXIS_TDATA),
        .m_axis_tkeep(ycbcr_mem_write_async_fifo_M_AXIS_TKEEP),
        .m_axis_tlast(ycbcr_mem_write_async_fifo_M_AXIS_TLAST),
        .m_axis_tready(ycbcr_mem_write_async_fifo_M_AXIS_TREADY),
        .m_axis_tuser(ycbcr_mem_write_async_fifo_M_AXIS_TUSER),
        .m_axis_tvalid(ycbcr_mem_write_async_fifo_M_AXIS_TVALID),
        .s_aclk(clk_1),
        .s_aresetn(pipeline_registers_0_pipe_out),
        .s_axis_tdata(ycbcr_data_packing_0_write_data),
        .s_axis_tkeep(tkeep_pass_pipe_out),
        .s_axis_tlast(ycbcr_mem_sync_sigs_async_fifo_m_axis_tlast),
        .s_axis_tready(ycbcr_mem_write_async_fifo_s_axis_tready),
        .s_axis_tuser(ycbcr_mem_sync_sigs_async_fifo_m_axis_tuser),
        .s_axis_tvalid(xup_and3_0_y));
  hdmi_directpassthr_woi_axi_vdma_0_2 ycbcr_vdma
       (.axi_resetn(rst_processing_system7_0_100M_peripheral_aresetn),
        .m_axi_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_mm2s_araddr(ycbcr_vdma_M_AXI_MM2S_ARADDR),
        .m_axi_mm2s_arburst(ycbcr_vdma_M_AXI_MM2S_ARBURST),
        .m_axi_mm2s_arcache(ycbcr_vdma_M_AXI_MM2S_ARCACHE),
        .m_axi_mm2s_arlen(ycbcr_vdma_M_AXI_MM2S_ARLEN),
        .m_axi_mm2s_arprot(ycbcr_vdma_M_AXI_MM2S_ARPROT),
        .m_axi_mm2s_arready(ycbcr_vdma_M_AXI_MM2S_ARREADY),
        .m_axi_mm2s_arsize(ycbcr_vdma_M_AXI_MM2S_ARSIZE),
        .m_axi_mm2s_arvalid(ycbcr_vdma_M_AXI_MM2S_ARVALID),
        .m_axi_mm2s_rdata(ycbcr_vdma_M_AXI_MM2S_RDATA),
        .m_axi_mm2s_rlast(ycbcr_vdma_M_AXI_MM2S_RLAST),
        .m_axi_mm2s_rready(ycbcr_vdma_M_AXI_MM2S_RREADY),
        .m_axi_mm2s_rresp(ycbcr_vdma_M_AXI_MM2S_RRESP),
        .m_axi_mm2s_rvalid(ycbcr_vdma_M_AXI_MM2S_RVALID),
        .m_axi_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .m_axi_s2mm_awaddr(ycbcr_vdma_M_AXI_S2MM_AWADDR),
        .m_axi_s2mm_awburst(ycbcr_vdma_M_AXI_S2MM_AWBURST),
        .m_axi_s2mm_awcache(ycbcr_vdma_M_AXI_S2MM_AWCACHE),
        .m_axi_s2mm_awlen(ycbcr_vdma_M_AXI_S2MM_AWLEN),
        .m_axi_s2mm_awprot(ycbcr_vdma_M_AXI_S2MM_AWPROT),
        .m_axi_s2mm_awready(ycbcr_vdma_M_AXI_S2MM_AWREADY),
        .m_axi_s2mm_awsize(ycbcr_vdma_M_AXI_S2MM_AWSIZE),
        .m_axi_s2mm_awvalid(ycbcr_vdma_M_AXI_S2MM_AWVALID),
        .m_axi_s2mm_bready(ycbcr_vdma_M_AXI_S2MM_BREADY),
        .m_axi_s2mm_bresp(ycbcr_vdma_M_AXI_S2MM_BRESP),
        .m_axi_s2mm_bvalid(ycbcr_vdma_M_AXI_S2MM_BVALID),
        .m_axi_s2mm_wdata(ycbcr_vdma_M_AXI_S2MM_WDATA),
        .m_axi_s2mm_wlast(ycbcr_vdma_M_AXI_S2MM_WLAST),
        .m_axi_s2mm_wready(ycbcr_vdma_M_AXI_S2MM_WREADY),
        .m_axi_s2mm_wstrb(ycbcr_vdma_M_AXI_S2MM_WSTRB),
        .m_axi_s2mm_wvalid(ycbcr_vdma_M_AXI_S2MM_WVALID),
        .m_axis_mm2s_aclk(processing_system7_0_FCLK_CLK1),
        .m_axis_mm2s_tdata(ycbcr_vdma_m_axis_mm2s_tdata),
        .m_axis_mm2s_tkeep(ycbcr_vdma_m_axis_mm2s_tkeep),
        .m_axis_mm2s_tlast(ycbcr_vdma_m_axis_mm2s_tlast),
        .m_axis_mm2s_tready(ycbcr_mem_read_async_fifo_s_axis_tready),
        .m_axis_mm2s_tuser(ycbcr_vdma_m_axis_mm2s_tuser),
        .m_axis_mm2s_tvalid(ycbcr_vdma_m_axis_mm2s_tvalid),
        .s_axi_lite_aclk(processing_system7_0_FCLK_CLK0),
        .s_axi_lite_araddr(processing_system7_0_axi_periph_M03_AXI_ARADDR[8:0]),
        .s_axi_lite_arready(processing_system7_0_axi_periph_M03_AXI_ARREADY),
        .s_axi_lite_arvalid(processing_system7_0_axi_periph_M03_AXI_ARVALID),
        .s_axi_lite_awaddr(processing_system7_0_axi_periph_M03_AXI_AWADDR[8:0]),
        .s_axi_lite_awready(processing_system7_0_axi_periph_M03_AXI_AWREADY),
        .s_axi_lite_awvalid(processing_system7_0_axi_periph_M03_AXI_AWVALID),
        .s_axi_lite_bready(processing_system7_0_axi_periph_M03_AXI_BREADY),
        .s_axi_lite_bresp(processing_system7_0_axi_periph_M03_AXI_BRESP),
        .s_axi_lite_bvalid(processing_system7_0_axi_periph_M03_AXI_BVALID),
        .s_axi_lite_rdata(processing_system7_0_axi_periph_M03_AXI_RDATA),
        .s_axi_lite_rready(processing_system7_0_axi_periph_M03_AXI_RREADY),
        .s_axi_lite_rresp(processing_system7_0_axi_periph_M03_AXI_RRESP),
        .s_axi_lite_rvalid(processing_system7_0_axi_periph_M03_AXI_RVALID),
        .s_axi_lite_wdata(processing_system7_0_axi_periph_M03_AXI_WDATA),
        .s_axi_lite_wready(processing_system7_0_axi_periph_M03_AXI_WREADY),
        .s_axi_lite_wvalid(processing_system7_0_axi_periph_M03_AXI_WVALID),
        .s_axis_s2mm_aclk(processing_system7_0_FCLK_CLK1),
        .s_axis_s2mm_tdata(ycbcr_mem_write_async_fifo_M_AXIS_TDATA),
        .s_axis_s2mm_tkeep(ycbcr_mem_write_async_fifo_M_AXIS_TKEEP),
        .s_axis_s2mm_tlast(ycbcr_mem_write_async_fifo_M_AXIS_TLAST),
        .s_axis_s2mm_tready(ycbcr_mem_write_async_fifo_M_AXIS_TREADY),
        .s_axis_s2mm_tuser(ycbcr_mem_write_async_fifo_M_AXIS_TUSER),
        .s_axis_s2mm_tvalid(ycbcr_mem_write_async_fifo_M_AXIS_TVALID));
endmodule

module ycbcr_aresetn_gen_imp_I682TY
   (aresetn,
    clk,
    tuser);
  output [0:0]aresetn;
  input clk;
  input [0:0]tuser;

  wire clk_1;
  wire [0:0]pipeline_registers_0_pipe_out;
  wire [0:0]xlconstant_1_dout;
  wire xup_or2_0_y;
  wire [0:0]ycbcr_vdma_m_axis_mm2s_tuser;

  assign aresetn[0] = pipeline_registers_0_pipe_out;
  assign clk_1 = clk;
  assign ycbcr_vdma_m_axis_mm2s_tuser = tuser[0];
  hdmi_directpassthr_woi_xlconstant_1_5 one
       (.dout(xlconstant_1_dout));
  hdmi_directpassthr_woi_pipeline_registers_0_0 pipeline_registers_0
       (.clk(clk_1),
        .pipe_in(xup_or2_0_y),
        .pipe_out(pipeline_registers_0_pipe_out),
        .reset_n(xlconstant_1_dout));
  hdmi_directpassthr_woi_xup_or2_0_0 xup_or2_0
       (.a(pipeline_registers_0_pipe_out),
        .b(ycbcr_vdma_m_axis_mm2s_tuser),
        .y(xup_or2_0_y));
endmodule
