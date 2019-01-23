`timescale 1ns / 10ps
/******************************************************************************/
/* Title: Virtual Component Creation Module									  */
/* Action: Creates a virtual component to ensure correct foreground detection */
/* 																			  */
/* Takes 3 Cycle															  */
/*																			  */
/*																			  */
/*																			  */
/******************************************************************************/
module vcomp (
	input wire clk,
	input wire [31:0] gp_in,
	input wire g1_match_in,
	input wire g2_match_in,
	input wire g3_match_in,
	input wire [31:0] mean1_up_in,		//Guassian 1 Mean Parameter
	input wire [31:0] mean2_up_in,		//Gaussian 2 Mean Parameter
	input wire [31:0] mean3_up_in,		//Gaussian 3 Mean Parameter		
	input wire [31:0] sd1_up_in,		//Guassian 1 Standard Deviation Parameter  
	input wire [31:0] sd2_up_in,	    //Guassian 2 Standard Deviation Parameter	
	input wire [31:0] sd3_up_in,		//Guassian 3 Standard Deviation Parameter
	input wire [31:0] w1_up_in,		//Guassian 1 Weight Parameter
	input wire [31:0] w2_up_in,		//Guassian 2 Weight Parameter
	input wire [31:0] w3_up_in,		//Guassian 3 Weight Parameter	
	input wire [31:0] abs_diff_1_in,		//Passed absoulute difference 1  
	input wire [31:0] abs_diff_2_in,		//Passed absoulute difference 2 	
	input wire [31:0] abs_diff_3_in,		//Passed absoulute difference 3
	output reg [31:0] mean1_up_out,		//Guassian 1 Mean Parameter
	output reg [31:0] mean2_up_out,		//Gaussian 2 Mean Parameter
	output reg [31:0] mean3_up_out,		//Gaussian 3 Mean Parameter		
	output reg [31:0] sd1_up_out,		//Guassian 1 Standard Deviation Parameter  
	output reg [31:0] sd2_up_out,	    //Guassian 2 Standard Deviation Parameter	
	output reg [31:0] sd3_up_out,		//Guassian 3 Standard Deviation Parameter	
	output reg [31:0] w1_up_out,		//Guassian 1 Weight Parameter
	output reg [31:0] w2_up_out,		//Guassian 2 Weight Parameter
	output reg [31:0] w3_up_out,		//Guassian 3 Weight Parameter	
	output reg [31:0] abs_diff_1_out,		//Passed absoulute difference 1  
	output reg [31:0] abs_diff_2_out,		//Passed absoulute difference 2 	
	output reg [31:0] abs_diff_3_out		//Passed absoulute difference 3 
	);
	
	wire no_match;
	
	reg no_match_reg;
	reg [31:0] w_min;
	reg [1:0] i, i_reg;
	
	reg [31:0] gp_in_reg;
    	reg [31:0] mean1_up_in_reg, mean1_up_reg, mean1_up_reg2;
    	reg [31:0] mean2_up_in_reg, mean2_up_reg, mean2_up_reg2;
    	reg [31:0] mean3_up_in_reg, mean3_up_reg, mean3_up_reg2;
    	reg [31:0] sd1_up_in_reg, sd1_up_reg, sd1_up_reg2;
    	reg [31:0] sd2_up_in_reg, sd2_up_reg, sd2_up_reg2;
    	reg [31:0] sd3_up_in_reg, sd3_up_reg, sd3_up_reg2;
    	reg [31:0] w1_up_in_reg, w1_up_reg, w1_up_reg2;
    	reg [31:0] w2_up_in_reg, w2_up_reg, w2_up_reg2;
    	reg [31:0] w3_up_in_reg, w3_up_reg, w3_up_reg2;
    	reg [31:0] abs_diff_1_in_reg, abs_diff_1_reg, abs_diff_1_reg2;
    	reg [31:0] abs_diff_2_in_reg, abs_diff_2_reg, abs_diff_2_reg2;
    	reg [31:0] abs_diff_3_in_reg, abs_diff_3_reg, abs_diff_3_reg2;
    
    
	assign no_match = ~(g1_match_in | g2_match_in | g3_match_in);
	
	always@(*)
		begin
			////////////////////////////////Set the Default Values////////////////////////////////////
			w_min = 0;
			i = 0;		
			//////////////////////////////Creating Virtual Component//////////////////////////////////
			if(no_match)
				begin //Find the minimum of weights
					if(w1_up_in<w2_up_in)
						begin
							w_min = w1_up_in;
							i = 1;
						end
					else
						begin
							w_min = w2_up_in;
							i = 2;
						end
					
					if(w3_up_in<w_min)
						begin
							i = 3;
						end
                end
        end        
				          
				          
		always@(posedge clk)
		      begin
		          w1_up_reg <= w1_up_in_reg;
                  w2_up_reg <= w2_up_in_reg;
                  w3_up_reg <= w3_up_in_reg;
                  abs_diff_1_reg <= abs_diff_1_in_reg;
                  abs_diff_2_reg <= abs_diff_2_in_reg;
                  abs_diff_3_reg <= abs_diff_3_in_reg;
		       if(no_match_reg)
		  		  case(i_reg)
						1:begin
								mean1_up_reg <= gp_in_reg;
								mean2_up_reg <= mean2_up_in_reg;
								mean3_up_reg <= mean3_up_in_reg;
								sd1_up_reg <= 32'h06000000;
								sd2_up_reg <= sd2_up_in_reg;
								sd3_up_reg <= sd3_up_in_reg;
							end
						2:begin
								mean1_up_reg <= mean1_up_in_reg;
								mean2_up_reg <= gp_in_reg;
								mean3_up_reg <= mean3_up_in_reg;
								sd1_up_reg <= sd1_up_in_reg;
								sd2_up_reg <= 32'h06000000;
								sd3_up_reg <= sd3_up_in_reg;
							end
						3:begin
								mean1_up_reg <= mean1_up_in_reg;
								mean2_up_reg <= mean2_up_in_reg;
								mean3_up_reg <= gp_in_reg;
								sd1_up_reg <= sd1_up_in_reg;
								sd2_up_reg <= sd2_up_in_reg;
								sd3_up_reg <= 32'h06000000;
							end
							default: 
							begin
								mean1_up_reg <= 0;
								mean2_up_reg <= 0;
								mean3_up_reg <= 0;
								sd1_up_reg <= 0;
								sd2_up_reg <= 0;
								sd3_up_reg <= 0;
							end
					endcase
				else
						begin
				    	   mean1_up_reg <= mean1_up_in_reg;
					       mean2_up_reg <= mean2_up_in_reg;
					       mean3_up_reg <= mean3_up_in_reg;
					       sd1_up_reg <= sd1_up_in_reg;
					       sd2_up_reg <= sd2_up_in_reg;
					       sd3_up_reg <= sd3_up_in_reg;
				          end
				end		
				
	always@(posedge clk)
		begin	
		//register layer
		    i_reg <= i;
		    no_match_reg <= no_match;
		    gp_in_reg <= gp_in;
		    mean1_up_in_reg <= mean1_up_in;
		    mean2_up_in_reg <= mean2_up_in;
		    mean3_up_in_reg <= mean3_up_in;
		    sd1_up_in_reg <= sd1_up_in;
		    sd2_up_in_reg <= sd2_up_in;
		    sd3_up_in_reg <= sd3_up_in;
		    w1_up_in_reg <= w1_up_in;
		    w2_up_in_reg <= w2_up_in;
		    w3_up_in_reg <= w3_up_in;
		    abs_diff_1_in_reg <= abs_diff_1_in;
		    abs_diff_2_in_reg <= abs_diff_2_in;
		    abs_diff_3_in_reg <= abs_diff_3_in;
        //register layer
			mean1_up_reg2 <= mean1_up_reg;
			sd1_up_reg2 <= sd1_up_reg;
			w1_up_reg2 <= w1_up_reg;
			mean2_up_reg2 <= mean2_up_reg;
			sd2_up_reg2 <= sd2_up_reg;
			w2_up_reg2 <= w2_up_reg;
			mean3_up_reg2 <= mean3_up_reg;
			sd3_up_reg2 <= sd3_up_reg;
			w3_up_reg2 <= w3_up_reg;
			abs_diff_1_reg2 <= abs_diff_1_reg;
			abs_diff_2_reg2 <= abs_diff_2_reg;
			abs_diff_3_reg2 <= abs_diff_3_reg;
        //register layer
			mean1_up_out <= mean1_up_reg2;
			sd1_up_out <= sd1_up_reg2;
			w1_up_out <= w1_up_reg2;
			mean2_up_out <= mean2_up_reg2;
			sd2_up_out <= sd2_up_reg2;
			w2_up_out <= w2_up_reg2;
			mean3_up_out <= mean3_up_reg2;
			sd3_up_out <= sd3_up_reg2;
			w3_up_out <= w3_up_reg2;
			abs_diff_1_out <= abs_diff_1_reg2;
			abs_diff_2_out <= abs_diff_2_reg2;
			abs_diff_3_out <= abs_diff_3_reg2;
		end
/////////v_comp module end///////	
endmodule