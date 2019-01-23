`timescale 1ns / 10ps
/*************************************************************************/
/* Title: Foreground Detection Module												 */
/* Action: Detects foreground pixels and passes the updated parameters 	 */
/* 																							 */
/* Takes 2 Cycle																			 */
/*																								 */
/*																								 */
/*																								 */
/*************************************************************************/
module fg_detection (
	input wire clk,
	input wire [31:0] mean1_up,
	input wire [31:0] sd1_up,
	input wire [31:0] w1_up,
	input wire [31:0] mean2_up,
	input wire [31:0] sd2_up,
	input wire [31:0] w2_up,
	input wire [31:0] mean3_up,
	input wire [31:0] sd3_up,
	input wire [31:0] w3_up,
	input wire [31:0] abs_diff_1,					//Passed absoulute difference 1  
	input wire [31:0] abs_diff_2,					//Passed absoulute difference 2 	
	input wire [31:0] abs_diff_3,					//Passed absoulute difference 3  
	input wire [15:0] FG_THRESHOLD,    // 16'hXXFF, XX determines the foreground threshold value
	input wire [3:0] MATCH_THRESHOLD,
	output reg [31:0] mean1_up_out,		//Guassian 1 Mean Parameter
	output reg [31:0] mean2_up_out,		//Gaussian 2 Mean Parameter
	output reg [31:0] mean3_up_out,		//Gaussian 3 Mean Parameter		
	output reg [31:0] sd1_up_out,		//Guassian 1 Standard Deviation Parameter  
	output reg [31:0] sd2_up_out,	    //Guassian 2 Standard Deviation Parameter	
	output reg [31:0] sd3_up_out,		//Guassian 3 Standard Deviation Parameter
	output reg [31:0] w1_up_out,		//Guassian 1 Weight Parameter
	output reg [31:0] w2_up_out,		//Guassian 2 Weight Parameter
	output reg [31:0] w3_up_out,		//Guassian 3 Weight Parameter
	output reg is_fg			  		//If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
	);
	
	wire [63:0] sd1_64, sd2_64, sd3_64; 		
	reg [31:0] tmp1, tmp2, tmp3, tmp1_reg, tmp2_reg, tmp3_reg;
	reg tmp4, tmp5, tmp6;
	
	reg is_fg_reg;			  			//If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
	
	reg [31:0] mean1_up_reg;		//Guassian 1 Mean Parameter
	reg [31:0] mean2_up_reg;		//Gaussian 2 Mean Parameter
	reg [31:0] mean3_up_reg;		//Gaussian 3 Mean Parameter
	reg [31:0] sd1_up_reg;			//Guassian 1 Standard Deviation Parameter  
	reg [31:0] sd2_up_reg;	    		//Guassian 2 Standard Deviation Parameter	
	reg [31:0] sd3_up_reg;			//Guassian 3 Standard Deviation Parameter
	reg [31:0] w1_up_reg;			//Guassian 1 Weight Parameter
	reg [31:0] w2_up_reg;			//Guassian 2 Weight Parameter
	reg [31:0] w3_up_reg;			//Guassian 3 Weight Parameter
	reg [31:0] abs_diff_1_reg;
	reg [31:0] abs_diff_2_reg;
	reg [31:0] abs_diff_3_reg;
	
	assign sd1_64 = sd1_up;
	assign sd2_64 = sd2_up;
	assign sd3_64 = sd3_up;
	////////////////////////////////////////Foreground Detection///////////////////////////////////////////	
	always@(*)
		begin		
		////////////////Set the default values/////////////////
		tmp1 = 0;
		tmp2 = 0;
		tmp3 = 0;
		///////////////////////////////////////////////////////
			tmp1 = (sd1_64 * MATCH_THRESHOLD) >> 1;
			tmp2 = (sd2_64 * MATCH_THRESHOLD) >> 1;
			tmp3 = (sd3_64 * MATCH_THRESHOLD) >> 1;
		end

	always@(*)
		begin		
		////////////////Set the default values/////////////////
		is_fg_reg = is_fg;
		tmp4 = 0;
		tmp5 = 0;
		tmp6 = 0;
		///////////////////////////////////////////////////////
			tmp4 = (abs_diff_1_reg <= tmp1_reg) && (w1_up_reg >= {FG_THRESHOLD, 16'hffff});
			tmp5 = (abs_diff_2_reg <= tmp2_reg) && (w2_up_reg >= {FG_THRESHOLD, 16'hffff});
			tmp6 = (abs_diff_3_reg <= tmp3_reg) && (w3_up_reg >= {FG_THRESHOLD, 16'hffff});
			
			if(tmp4 | tmp5 | tmp6)
				begin
					is_fg_reg = 0;
				end
			else
				begin
					is_fg_reg = 1;
				end
		end
	
	always@(posedge clk)
		begin
//////////First Micro Stage///////////////////
			tmp1_reg <= tmp1;
			tmp2_reg <= tmp2;
			tmp3_reg <= tmp3;
			mean1_up_reg <= mean1_up;		//Guassian 1 Mean Parameter
			mean2_up_reg <= mean2_up;		//Gaussian 2 Mean Parameter
			mean3_up_reg <= mean3_up;		//Gaussian 3 Mean Parameter
			sd1_up_reg <= sd1_up;		//Guassian 1 Standard Deviation Parameter  
			sd2_up_reg <= sd2_up;	    //Guassian 2 Standard Deviation Parameter	
			sd3_up_reg <= sd3_up;		//Guassian 3 Standard Deviation Parameter
			w1_up_reg <= w1_up;		//Guassian 1 Weight Parameter
			w2_up_reg <= w2_up;		//Guassian 2 Weight Parameter
			w3_up_reg <= w3_up;		//Guassian 3 Weight Parameter
			abs_diff_1_reg <= abs_diff_1;
			abs_diff_2_reg <= abs_diff_2;
			abs_diff_3_reg <= abs_diff_3;
//////////Second Micro Stage///////////////////
			is_fg <= is_fg_reg;				//Foreground Indicator
			mean1_up_out <= mean1_up_reg;		//Guassian 1 Mean Parameter
			mean2_up_out <= mean2_up_reg;		//Gaussian 2 Mean Parameter
			mean3_up_out <= mean3_up_reg;		//Gaussian 3 Mean Parameter		
			sd1_up_out <= sd1_up_reg;		//Guassian 1 Standard Deviation Parameter  
			sd2_up_out <= sd2_up_reg;	    //Guassian 2 Standard Deviation Parameter	
			sd3_up_out <= sd3_up_reg;		//Guassian 3 Standard Deviation Parameter
			w1_up_out <= w1_up_reg;		//Guassian 1 Weight Parameter
			w2_up_out <= w2_up_reg;		//Guassian 2 Weight Parameter
			w3_up_out <= w3_up_reg;		//Guassian 3 Weight Parameter
		end
/////////fg_detection module end///////	
endmodule