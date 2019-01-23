`timescale 1ns / 10ps
/**************************************************************************/
/* Title: First Prepration Module for Standard Deviation Parameter Update */
/* Action: Creates Square of sd and abs_diff 									  */	
/* 																							  */	
/* Takes 4 Cycle																			  */
/*																								  */
/*																								  */
/*																								  */
/**************************************************************************/
module pre_sd_up1(
	input wire clk,
	input wire [31:0] mean_up,
	input wire [31:0] sd,
	input wire [31:0] w_up,
	input wire [31:0] b_w,
	input wire [31:0] gp,
	input wire g_match,
	//input wire sqrt_en,
	input wire [31:0] abs_diff,
	input wire [31:0] tmp_reg1,
	input wire [31:0] tmp_reg2,
	output reg [31:0] tmp_reg1_out,
	output reg [31:0] tmp_reg2_out,
	output reg [31:0] powd_00_out,
	output reg [31:0] powd_11_out,	
	output reg [31:0] mean_up_out,
	output reg [31:0] sd_out,
	output reg [31:0] w_up_out,
	output reg [31:0] b_w_up,
	output reg g_match_out,
	output reg [31:0] abs_diff_out
	);							
	////////***********************pass window_en and gp over me
	
	wire [31:0] powd_0;
	wire [31:0] powd_1;

	reg [31:0] tmp_reg1_r1, tmp_reg1_r2, tmp_reg1_r3;
	reg [31:0] tmp_reg2_r1, tmp_reg2_r2, tmp_reg2_r3;
	reg [31:0] mean_up_r1, mean_up_r2, mean_up_r3;
	reg [31:0] sd_r1, sd_r2, sd_r3;
	reg [31:0] w_up_r1, w_up_r2, w_up_r3;
	reg [31:0] b_w_r1, b_w_r2, b_w_r3;
	reg [31:0] g_match_r1, g_match_r2, g_match_r3;
	reg [31:0] abs_diff_r1, abs_diff_r2, abs_diff_r3;
	
	wire [15:0] sd_mult_in;
	wire [15:0] abs_diff_mult_in;
	
//	always@(*)
//		begin
//		//////////////Set the default values////////////////
//		powd_0 = 0;
//		powd_1 = 0;
//		////////////////////////////////////////////////////
//			//powd_0 = sd[31:16] * sd[31:16];
//			//powd_1 = abs_diff[31:16] * abs_diff[31:16];
//			
//			powd_0 = (sd >> 16) * (sd >> 16);
//			powd_1 = (abs_diff >> 16) * (abs_diff >> 16);
//		end
	
assign sd_mult_in = sd >> 16;
assign abs_diff_mult_in = abs_diff >> 16;
	
	mult_16x16 sd_multiplier (
  .CLK(clk),
  .A(sd_mult_in), // input [15 : 0] a
  .B(sd_mult_in), // input [15 : 0] b
  .P(powd_0) // output [31 : 0] p
);

	mult_16x16 abs_diff_multiplier (
  .CLK(clk),
  .A(abs_diff_mult_in), // input [15 : 0] a
  .B(abs_diff_mult_in), // input [15 : 0] b
  .P(powd_1) // output [31 : 0] p
);


	always@(posedge clk)
		begin
					///////////pass the signals//////////////
					tmp_reg1_r1 <= tmp_reg1;
					tmp_reg1_r2 <= tmp_reg1_r1;
					tmp_reg1_r3 <= tmp_reg1_r2;
					tmp_reg1_out <= tmp_reg1_r3;
					tmp_reg2_r1 <= tmp_reg2;
					tmp_reg2_r2 <= tmp_reg2_r1;
					tmp_reg2_r3 <= tmp_reg2_r2;
					tmp_reg2_out <= tmp_reg2_r3;
					powd_00_out <= powd_0;
					powd_11_out <= powd_1;
					mean_up_r1 <= mean_up;
					mean_up_r2 <= mean_up_r1;
					mean_up_r3 <= mean_up_r2;
					mean_up_out <= mean_up_r3;
					sd_r1 <= sd;
					sd_r2 <= sd_r1;
					sd_r3 <= sd_r2;
					sd_out <= sd_r3;
					w_up_r1 <= w_up;
					w_up_r2 <= w_up_r1;
					w_up_r3 <= w_up_r2;
					w_up_out <= w_up_r3;
					b_w_r1 <= b_w;
					b_w_r2 <= b_w_r1;
					b_w_r3 <= b_w_r2;
					b_w_up <= b_w_r3;
					g_match_r1 <= g_match;
					g_match_r2 <= g_match_r1;
					g_match_r3 <= g_match_r2;
					g_match_out <= g_match_r3;
					abs_diff_r1 <= abs_diff;
					abs_diff_r2 <= abs_diff_r1;
					abs_diff_r3 <= abs_diff_r2;
					abs_diff_out <= abs_diff_r3;
		end
	////////module pre_sd_up1 end////////
endmodule