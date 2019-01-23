`timescale 1ns / 10ps
/*********************************************************************/
/* Title: The Match Detection Module				     					   */
/* Action: Detect match with each guassian			    				   */
/* 								    											      */
/* Takes 2 Cycle						   										   */
/*								     														*/
/*								    													   */
/*								    													   */
/*********************************************************************/
module match_detection (
	input wire clk,					//MoG clock
	input wire [31:0] gp_in,		//Gray Pixel density (input in gray 0-255)
	input wire [31:0] mean,		    //Guassian Mean Parameter	
	input wire [31:0] sd,			//Guassian Standard Deviation Parameter  
	input wire [31:0] w,			//Guassian Weight Parameter	
	input wire [3:0] MATCH_THRESHOLD,
	output reg g_match,				//Pixel Captured with Guassian Curve
	output reg [31:0] mean_out,		//Guassian Mean Parameter
	output reg [31:0] sd_out, 		//sd out
	output reg [31:0] w_out,		    //Guassian Weight Parameter 
	output reg [31:0] abs_diff_out //abs diff passed
	);
	
	////////***********************pass window_en and gp over me
	
	wire [63:0] sd_64;
	reg [31:0] mean_reg, sd_reg, w_reg, gp_in_reg;
	reg [31:0] sd_32, sd_32_reg;
	reg [31:0] abs_diff_reg;   
	reg g_match_reg;

	
	assign 	sd_64 = sd;

	
	/************************************************Pipe Stage 0************************************************/
	///////////////////////////////Gaussian Match Detection//////////////////////////////// 
	always@(*)
		begin
		///////////////Set the default values/////////////
		sd_32 = 0;
		//////////////////////////////////////////////////
			sd_32 = (sd_64 * MATCH_THRESHOLD) >> 1; // implementing multiply with shift
		end

	always@(*)
		begin
///////////////Set the default values/////////////
			abs_diff_reg = 0;
			g_match_reg = 0;
//////////////////////////////////////////////////
			if(gp_in_reg > mean_reg)
				abs_diff_reg[31:16] = gp_in_reg[31:16] - mean_reg[31:16];
			else
				abs_diff_reg[31:16] = mean_reg[31:16] - gp_in_reg[31:16];
			
			if(abs_diff_reg <= sd_32_reg)
				g_match_reg = 1;
			else
				g_match_reg = 0;
		end
	
	
	always@(posedge clk)
		begin
			///////////First Micro Stage/////////////
			sd_32_reg <= sd_32;
			mean_reg <= mean;
			sd_reg <= sd;
			w_reg <= w;
			gp_in_reg <= gp_in;		
			///////////Second Micro Stage//////////////
			g_match <= g_match_reg;
			abs_diff_out <= abs_diff_reg;		
			mean_out <= mean_reg;
			sd_out <= sd_reg;
			w_out <= w_reg;					
		end
	
	/////////match_detection module end///////	
endmodule