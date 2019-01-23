`timescale 1ns / 10ps
/***********************************************************************************/
/* Title: Standard Deviation Parameter Update Module										  */
/* Action: Updates the Standard Deviation Parameter using the square root function */
/* 																										  */
/* Takes 15 Cycles																						  */
/*																									        */
/*																											  */
/*                                                                                 */
/***********************************************************************************/
module sqrt (
	input wire clk,				//MoG Clock	
	input wire rst,
	input wire [31:0] sqrt_in,
	input wire [31:0] mean_up,
	input wire [31:0] sd,     //Passed Standard Deviation Parameter
	input wire [31:0] w_up,
	input wire [31:0] b_w_up,
	input wire g_match,	
	input wire [31:0] abs_diff,
	output wire [31:0] mean_up_out,
	output wire [31:0] sd_up,
	output wire [31:0] w_up_out,
	output wire [31:0] b_w_up_out,
	output wire g_match_out,					//Pixel Captured with Guassian 
	output wire [31:0] abs_diff_out
	);
	
	////////***********************pass window_en and gp over me
    wire [31:0] sd_up_reg;
    
	wire [14:0] sd_updated;
	reg [14:0] sd_updated_reg;	
	
	wire [31:0] sqrt_in_wire;
    wire [15:0] sqrt_out;
	
assign sqrt_in_wire = sqrt_in[27:0];//New Square Root
assign b_w_up_out = w_up_out;

//sqrt_core square_root (.clk(clk), .x_in(sqrt_in_wire), .x_out(sd_updated));

sqrt_core square_root (
  .aclk(clk),                                        // input wire aclk
  .s_axis_cartesian_tvalid(1'b1),  // input wire s_axis_cartesian_tvalid
  .s_axis_cartesian_tdata(sqrt_in_wire),    // input wire [31 : 0] s_axis_cartesian_tdata
  .m_axis_dout_tvalid(),            // output wire m_axis_dout_tvalid
  .m_axis_dout_tdata(sqrt_out)              // output wire [15 : 0] m_axis_dout_tdata
);
	
assign sd_updated = sqrt_out;	
	
	always@(posedge clk)
		begin 
		   sd_updated_reg <= sd_updated;
		end

pipeline_registers #(
.BIT_WIDTH(129),
.NUMBER_OF_STAGES(15)
) sqrt_regs
  (
   .clk(clk),
   .reset_n(~rst),
   .pipe_in({mean_up, sd, w_up, g_match, abs_diff}),
   .pipe_out({mean_up_out, sd_up_reg, w_up_out, g_match_out, abs_diff_out})
   );
	
assign sd_up = g_match_out ? (sd_updated_reg > 15'b000001100000000) ? {1'h0,sd_updated_reg,16'b0}: sd_up_reg: sd_up_reg;
	///////////sqrt module end////////////////	
endmodule