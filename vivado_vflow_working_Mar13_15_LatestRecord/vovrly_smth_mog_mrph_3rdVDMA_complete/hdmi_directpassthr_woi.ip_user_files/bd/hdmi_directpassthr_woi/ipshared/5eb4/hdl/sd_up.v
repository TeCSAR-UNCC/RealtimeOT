`timescale 1ns / 10ps
/***********************************************************************************/
/* Title: Standard Deviation Parameter Update Module										  */
/* Action: Updates the Standard Deviation Parameter using the square root function*/
/* This module contaions three submodules: pre_sd_up1 which contains partial operations
 for square root calculation, pre_sd_up2: which contains partial operations for square 
root calculation, square_root which contains the actual square root operation																								  */
/* Takes 22 Cycles																						  */
/*																									        */
/*																											  */
/*                                                                                 */
/***********************************************************************************/
module sd_up (
	input wire clk,
	input wire rst,
	input wire [31:0] mean_up,
	input wire [31:0] sd,
	input wire [31:0] w_up,
	input wire [31:0] b_w,
	input wire [31:0] gp,
	input wire g_match,
	input wire [31:0] abs_diff,
	input wire [31:0] tmp_reg1,
	input wire [31:0] tmp_reg2,
	output wire [31:0] mean_up_out,
	output wire [31:0] sd_up,
	output wire [31:0] w_up_out,
	output wire [31:0] b_w_up_out,
	output wire g_match_out,
	output wire [31:0] abs_diff_out
	);
//pre standard deviation update stage1 signals
	wire [31:0] tmp_reg1_out_1;
	wire [31:0] tmp_reg2_out_1;
	wire [31:0] powd_00_out_1;
	wire [31:0] powd_11_out_1;	
	wire [31:0] mean_up_out_1;
	wire [31:0] sd_out_1;
	wire [31:0] w_up_out_1;
	wire [31:0] b_w_up_1;
	wire g_match_out_1;
	wire [31:0] abs_diff_out_1;
//pre standard deviation update stage2 signals
	wire [31:0] mean_up_out_2;
	wire [31:0] sd_out_2;     //Passed Standard Deviation Parameter
	wire [31:0] w_up_out_2;
	wire [31:0] b_w_up_out_2;
	wire g_match_out_2;	
	wire [31:0] abs_diff_out_2;
	wire [31:0] sqrt_in_2;	//Square Root Input
	
pre_sd_up1 pre_update_stage1 (
	.clk(clk),
	.mean_up(mean_up),
	.sd(sd),
	.w_up(w_up),
	.b_w(b_w),
	.gp(gp),
	.g_match(g_match),
	.abs_diff(abs_diff),
	.tmp_reg1(tmp_reg1),
	.tmp_reg2(tmp_reg2),
	.tmp_reg1_out(tmp_reg1_out_1),
	.tmp_reg2_out(tmp_reg2_out_1),
	.powd_00_out(powd_00_out_1),
	.powd_11_out(powd_11_out_1),	
	.mean_up_out(mean_up_out_1),
	.sd_out(sd_out_1),
	.w_up_out(w_up_out_1),
	.b_w_up(b_w_up_1),
	.g_match_out(g_match_out_1),
	.abs_diff_out(abs_diff_out_1)
	);

pre_sd_up2 pre_update_stage2 (
	.clk(clk),
	.tmp_reg1_in(tmp_reg1_out_1),
	.tmp_reg2_in(tmp_reg2_out_1),
	.powd_00_in(powd_00_out_1),
	.powd_11_in(powd_11_out_1),	
	.mean_up_in(mean_up_out_1),
	.sd_in(sd_out_1),
	.w_up_in(w_up_out_1),
	.b_w_up_in(b_w_up_1),
	.g_match_in(g_match_out_1),
	.abs_diff_in(abs_diff_out_1),
	.mean_up_out(mean_up_out_2),
	.sd_out(sd_out_2),     //Passed Standard Deviation Parameter
	.w_up_out(w_up_out_2),
	.b_w_up_out(b_w_up_out_2),
	.g_match_out(g_match_out_2),	
	.abs_diff_out(abs_diff_out_2),
	.sqrt_in(sqrt_in_2)	//Square Root Input
	);

sqrt square_root_operation (
	.clk(clk),				//MoG Clock	
	.rst(rst),
	.sqrt_in(sqrt_in_2),
	.mean_up(mean_up_out_2),
	.sd(sd_out_2),     //Passed Standard Deviation Parameter
	.w_up(w_up_out_2),
	.b_w_up(b_w_up_out_2),
	.g_match(g_match_out_2),	
	.abs_diff(abs_diff_out_2),
	.mean_up_out(mean_up_out),
	.sd_up(sd_up),
	.w_up_out(w_up_out),
	.b_w_up_out(b_w_up_out),
	.g_match_out(g_match_out),					//Pixel Captured with Guassian 
	.abs_diff_out(abs_diff_out)
	);

	///////////sd_up module end////////////////	
endmodule