`timescale 1ns / 10ps
/*********************************************************************/
/* Title: Updating Mean Module													*/
/* Action: Updates the mean parameter of each guassian					*/
/* 																						*/
/* Takes 1 Cycle																		*/
/*																							*/
/*																							*/
/*																							*/
/*********************************************************************/
module mean_up (
	input wire rst,
	input wire clk,
	input wire g_match,
	input wire [31:0] gp,
	input wire [31:0] mean_in,
	input wire [31:0] sd_in,
	input wire [31:0] w_up_in,
	input wire [31:0] b_w_up_in,
	input wire [31:0] abs_diff_in,
	//input wire sqrt_en_in,
	input wire window_en,
	output reg g_match_out,
	output wire [31:0] mean_up,
	output reg [31:0] sd_out,
	output reg [31:0] w_up,
	output reg [31:0] b_w_up,
	output reg [31:0] tmp_reg1_up,
	output reg [31:0] tmp_reg2_up,
	output reg [31:0] abs_diff_out
	//output reg sqrt_en
	);
	////////***********************pass window_en and gp over me
	wire wr_en, rd_en;
	wire [15:0] quotient;
	wire g_match_fifo_out;
	wire [31:0] gp_fifo_out, mean_fifo_out, sd_fifo_out, w_up_fifo_out, b_w_up_fifo_out;
	wire [31:0] abs_diff_fifo_out, p1, p2, tmp_reg1_up_p2, tmp_reg2_up_p1;
	wire [23:0] div_out;
	
	reg [31:0] gp_reg;
	reg [15:0] quotient_reg;
	
	reg [31:0] w_up_in_reg, gp_in_reg, mean_in_reg, abs_diff_in_reg;
	reg [31:0] b_w_up_in_reg, sd_in_reg;
	reg g_match_in_reg;
	reg [31:0] mean_up_reg, mean_up_reg2, mean_up_reg3, mean_up_reg4, mean_up_reg5;
	reg [31:0] sd_out_reg, sd_out_reg2, sd_out_reg3, sd_out_reg4;
	reg [31:0] w_up_reg, w_up_reg2, w_up_reg3, w_up_reg4;
	reg [31:0] b_w_up_reg, b_w_up_reg2, b_w_up_reg3, b_w_up_reg4;
	reg g_match_out_reg, g_match_out_reg2, g_match_out_reg3, g_match_out_reg4;
	reg [31:0] abs_diff_out_reg, abs_diff_out_reg2, abs_diff_out_reg3, abs_diff_out_reg4;
	reg [31:0] p1_reg, p2_reg;
	reg [31:0] tmp_reg1_up_p2_reg, tmp_reg1_up_p2_reg2, tmp_reg1_up_p2_reg3;
	reg [31:0] tmp_reg2_up_p1_reg, tmp_reg2_up_p1_reg2, tmp_reg2_up_p1_reg3;


	
	assign tmp_reg1_up_p2 = {16'b0,quotient_reg} << 24;
	assign tmp_reg2_up_p1 = 36'h100000000 - (tmp_reg1_up_p2);
	assign mean_up = g_match_out ? p1_reg + p2_reg: mean_up_reg5;
	//assign mean_up = g_match_out ? (p1_reg + p2_reg) > 32'h00000001 ? p1_reg + p2_reg : mean_up_reg5: mean_up_reg5;
	
mult_16x16 p1_multiplier (
  .CLK(clk),
  .A(tmp_reg2_up_p1[31:16]), // input [15 : 0] a
  .B(mean_up_reg[31:16]), // input [15 : 0] b
  .P(p1) // output [31 : 0] p
);

mult_16x16 p2_multiplier (
  .CLK(clk),
  .A(tmp_reg1_up_p2[31:16]), // input [15 : 0] a
  .B(gp_reg[31:16]), // input [15 : 0] b
  .P(p2) // output [31 : 0] p
);
	
//init_fifo_wr_rd_controller #(
//.CNT_WIDTH(5),
//.DELAY_CYCLES(18)
//)mean_up_fifo_init (
//.rst(rst),
//.clk(clk),
//.window_en(window_en),
//.wr_en(wr_en),
//.rd_en(rd_en)
//);

//		fifo_div16_8 initialization_fifo (
//  .srst(rst),
//  .clk(clk), // input clk
//  .din({g_match_in_reg, gp_in_reg, mean_in_reg, sd_in_reg, w_up_in_reg, b_w_up_in_reg, abs_diff_in_reg}), // input [161 : 0] din
//  .wr_en(wr_en), // input wr_en
//  .rd_en(rd_en), // input rd_en
//  .dout({g_match_fifo_out, gp_fifo_out, mean_fifo_out, sd_fifo_out, w_up_fifo_out, b_w_up_fifo_out, abs_diff_fifo_out}), // output [161 : 0] dout
//  .full(), // output full
//  .empty() // output empty
//	);
	
  pipeline_registers #(
    .BIT_WIDTH(193),
    .NUMBER_OF_STAGES(18)//to be ready for foreground detection
    ) div_regs
      (
       .clk(clk),
       .reset_n(~rst),
       .pipe_in({g_match_in_reg, gp_in_reg, mean_in_reg, sd_in_reg, w_up_in_reg, b_w_up_in_reg, abs_diff_in_reg}),
       .pipe_out({g_match_fifo_out, gp_fifo_out, mean_fifo_out, sd_fifo_out, w_up_fifo_out, b_w_up_fifo_out, abs_diff_fifo_out})
       );

//	divider_16_8 divider (
//	.clk(clk), // input clk
//	.rfd(), // output rfd
//	.dividend(16'h0200), // input [15 : 0] dividend // 0200
//	.divisor(w_up_in_reg[31:24]), // input [7 : 0] divisor //w_up_in[31:24]
//	.quotient(quotient), // output [15 : 0] quotient
//	.fractional()); // output [7 : 0] fractional

    divider_16_8 divider (
      .aclk(clk),                                      // input wire aclk
      .s_axis_divisor_tvalid(1'b1),    // input wire s_axis_divisor_tvalid
      .s_axis_divisor_tdata(w_up_in_reg[31:24]),      // input wire [7 : 0] s_axis_divisor_tdata
      .s_axis_dividend_tvalid(1'b1),  // input wire s_axis_dividend_tvalid
      .s_axis_dividend_tdata(16'h0200),    // input wire [15 : 0] s_axis_dividend_tdata
      .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(div_out)            // output wire [23 : 0] m_axis_dout_tdata
    );

assign quotient = div_out[23:8];

	always@(posedge clk)
		begin
					//input registering
					g_match_in_reg <= g_match;
					w_up_in_reg <= w_up_in;
					gp_in_reg <= gp;
					mean_in_reg <= mean_in;
					sd_in_reg <= sd_in;
					b_w_up_in_reg <= b_w_up_in;
					abs_diff_in_reg <= abs_diff_in;					
					//output registering
					quotient_reg <= quotient;
					gp_reg <= gp_fifo_out;
					mean_up_reg <= mean_fifo_out;
					mean_up_reg2 <= mean_up_reg;
					mean_up_reg3 <= mean_up_reg2;
					mean_up_reg4 <= mean_up_reg3;
					mean_up_reg5 <= mean_up_reg4;
					sd_out_reg <= sd_fifo_out;
					sd_out_reg2 <= sd_out_reg;
					sd_out_reg3 <= sd_out_reg2;
					sd_out_reg4 <= sd_out_reg3;
					sd_out <= sd_out_reg4;
					w_up_reg <= w_up_fifo_out;
					w_up_reg2 <= w_up_reg;
					w_up_reg3 <= w_up_reg2;
					w_up_reg4 <= w_up_reg3;
					w_up <= w_up_reg4;
					b_w_up_reg <= b_w_up_fifo_out;
					b_w_up_reg2 <= b_w_up_reg;
					b_w_up_reg3 <= b_w_up_reg2;
					b_w_up_reg4 <= b_w_up_reg3;
					b_w_up <= b_w_up_reg4;
					g_match_out_reg <= g_match_fifo_out;
					g_match_out_reg2 <= g_match_out_reg;
					g_match_out_reg3 <= g_match_out_reg2;
					g_match_out_reg4 <= g_match_out_reg3;
					g_match_out <= g_match_out_reg4;
					abs_diff_out_reg <= abs_diff_fifo_out;
					abs_diff_out_reg2 <= abs_diff_out_reg;
					abs_diff_out_reg3 <= abs_diff_out_reg2;
					abs_diff_out_reg4 <= abs_diff_out_reg3;
					abs_diff_out <= abs_diff_out_reg4;
					p1_reg <= p1;
					p2_reg <= p2;
					tmp_reg1_up_p2_reg <= tmp_reg1_up_p2;
					tmp_reg1_up_p2_reg2 <= tmp_reg1_up_p2_reg;
					tmp_reg1_up_p2_reg3 <= tmp_reg1_up_p2_reg2;
					tmp_reg1_up <= tmp_reg1_up_p2_reg3;
					tmp_reg2_up_p1_reg <= tmp_reg2_up_p1;
					tmp_reg2_up_p1_reg2 <= tmp_reg2_up_p1_reg;
					tmp_reg2_up_p1_reg3 <= tmp_reg2_up_p1_reg2;
					tmp_reg2_up <= tmp_reg2_up_p1_reg3;
		end
	/////////mean_up module end///////
endmodule