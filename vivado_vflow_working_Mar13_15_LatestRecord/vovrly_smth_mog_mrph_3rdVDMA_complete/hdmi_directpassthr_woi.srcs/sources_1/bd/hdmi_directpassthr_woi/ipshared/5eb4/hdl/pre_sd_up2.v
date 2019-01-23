`timescale 1ns / 10ps
/***************************************************************************/
/* Title: Second Prepration Module for Standard Deviation Parameter Update */
/* Action: Creates the square root function input                          */
/*                                                                         */
/* Takes 5 Cycles                                                          */
/* 																								*/
/*																						         */
/*																								   */
/***************************************************************************/
module pre_sd_up2(
	input wire clk,
	input wire [31:0] tmp_reg1_in,
	input wire [31:0] tmp_reg2_in,
	input wire [31:0] powd_00_in,
	input wire [31:0] powd_11_in,	
	input wire [31:0] mean_up_in,
	input wire [31:0] sd_in,
	input wire [31:0] w_up_in,
	input wire [31:0] b_w_up_in,
	input wire [31:0] abs_diff_in,
	input wire g_match_in,
	output reg [31:0] mean_up_out,
	output reg [31:0] sd_out,     //Passed Standard Deviation Parameter
	output reg [31:0] w_up_out,
	output reg [31:0] b_w_up_out,
	output reg g_match_out,	
	output reg [31:0] abs_diff_out,
	output reg [31:0] sqrt_in	//Square Root Input
	);							
	////////***********************pass window_en and gp over me

	wire [31:0] sqrt_in_reg1, sqrt_in_reg2;
    wire [15:0] powd_00_mult_in1, powd_00_mult_in2, powd_11_mult_in1, powd_11_mult_in2;
	
	reg [31:0] mult_r1, mult_r2;
	reg [31:0] mean_up_in_reg, mean_up_in_reg2, mean_up_in_reg3, mean_up_in_reg4;
	reg [31:0] sd_in_reg, sd_in_reg2, sd_in_reg3, sd_in_reg4;
	reg [31:0] w_up_in_reg, w_up_in_reg2, w_up_in_reg3, w_up_in_reg4;
	reg [31:0] b_w_up_out_reg, b_w_up_out_reg2, b_w_up_out_reg3, b_w_up_out_reg4;
	reg g_match_in_reg, g_match_in_reg2, g_match_in_reg3, g_match_in_reg4;
	reg [31:0] abs_diff_reg, abs_diff_reg2, abs_diff_reg3, abs_diff_reg4;

    assign powd_00_mult_in1 = tmp_reg2_in >> 16;
    assign powd_00_mult_in2 = powd_00_in >> 16;
    assign powd_11_mult_in1 = tmp_reg1_in >> 16;
    assign powd_11_mult_in2 = powd_11_in >> 16;

	mult_16x16 powd_00_multiplier (
  .CLK(clk),
  .A(powd_00_mult_in1), // input [15 : 0] a
  .B(powd_00_mult_in2), // input [15 : 0] b
  .P(sqrt_in_reg1) // output [31 : 0] p
);

mult_16x16 powd_11_multiplier (
  .CLK(clk),
  .A(powd_11_mult_in1), // input [15 : 0] a
  .B(powd_11_mult_in2), // input [15 : 0] b
  .P(sqrt_in_reg2) // output [31 : 0] p
);

	always@(posedge clk)
		begin
					///////////pass the updated signals//////////////
					mult_r1 <= sqrt_in_reg1;
					mult_r2 <= sqrt_in_reg2;
					sqrt_in <= mult_r1 + mult_r2;
					mean_up_in_reg <= mean_up_in;
					mean_up_in_reg2 <= mean_up_in_reg;
					mean_up_in_reg3 <= mean_up_in_reg2;
					mean_up_in_reg4 <= mean_up_in_reg3;
					mean_up_out <= mean_up_in_reg4;
					sd_in_reg <= sd_in;
					sd_in_reg2 <= sd_in_reg;
					sd_in_reg3 <= sd_in_reg2;
					sd_in_reg4 <= sd_in_reg3;
					sd_out <= sd_in_reg4;
					w_up_in_reg <= w_up_in;
					w_up_in_reg2 <= w_up_in_reg;
					w_up_in_reg3 <= w_up_in_reg2;
					w_up_in_reg4 <= w_up_in_reg3;
					w_up_out <= w_up_in_reg4;
					b_w_up_out_reg <= b_w_up_in;
					b_w_up_out_reg2 <= b_w_up_out_reg;
					b_w_up_out_reg3 <= b_w_up_out_reg2;
					b_w_up_out_reg4 <= b_w_up_out_reg3;
					b_w_up_out <= b_w_up_out_reg4;
					g_match_in_reg <= g_match_in;
					g_match_in_reg2 <= g_match_in_reg;
					g_match_in_reg3 <= g_match_in_reg2;
					g_match_in_reg4 <= g_match_in_reg3;
					g_match_out <= g_match_in_reg4;
					//sqrt_en_reg <= sqrt_en_in;
					//sqrt_en_out <= sqrt_en_reg;
					abs_diff_reg <= abs_diff_in;
					abs_diff_reg2 <= abs_diff_reg;
					abs_diff_reg3 <= abs_diff_reg2;
					abs_diff_reg4 <= abs_diff_reg3;
					abs_diff_out <= abs_diff_reg4;
		end
	////////module pre_sd_up2 end////////
endmodule