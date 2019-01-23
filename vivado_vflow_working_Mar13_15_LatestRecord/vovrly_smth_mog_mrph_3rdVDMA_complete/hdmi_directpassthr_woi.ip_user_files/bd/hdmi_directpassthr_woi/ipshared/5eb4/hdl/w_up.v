`timescale 1ns / 10ps
/*********************************************************************/
/* Title: Updating Weight Module				    							   */	
/* Action: Updates the weight parameter of each guassian	            */
/* 								    												   */	
/* Takes 1 Cycle						    										   */
/*								    													   */
/*								    													   */
/*								     														*/	
/*********************************************************************/
module w_up (
	input wire clk,
	input wire g_match_in,
	input wire [31:0] mean_in,
	input wire [31:0] sd_in,
	input wire [31:0] w_in,
	input wire [31:0] abs_diff_in, //Just to pass
	input wire [15:0] LEARNING_FACTOR,//[7:0] Left Shift Value, [15:8] Right Shift Value
	output reg g_match_out,
	output reg [31:0] mean_out,
	output reg [31:0] sd_out,
	output reg [31:0] w_up,
	output reg [31:0] b_w_up,
	//output reg sqrt_en,
	output reg [31:0] abs_diff_out
	);
	////////***********************pass window_en and gp over me
	reg [31:0] w_notm;
	reg [31:0] w_up_reg;
	reg sqrt_en_reg;
	reg [63:0] w64_reg;
	//reg [39:0] w40_reg;
	////////Weight Updating//////////
	always@(*)
		begin
		///////////////Set the default values/////////////
		w64_reg = 0;
		//w40_reg = 0;
		w_notm = 0;
		w_up_reg = w_up;
		//////////////////////////////////////////////////
	    case(LEARNING_FACTOR[2:0])
		        1:begin
			     	if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 1);
					           w_notm = (w64_reg - w_in) >> 1;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 1);
					                    w_up_reg = (w64_reg - w_in) >> 1;
					                end
					       end
			     end
			     2:begin
			     	if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 2);
					           w_notm = (w64_reg - w_in) >> 2;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 2);
					                    w_up_reg = (w64_reg - w_in) >> 2;
					                end
					       end
			        end
			     3:begin
			         if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 3);
					           w_notm = (w64_reg - w_in) >> 3;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 3);
					                    w_up_reg = (w64_reg - w_in) >> 3;
					                end
					       end
			        end
			     4:begin
			     	 if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 4);
					           w_notm = (w64_reg - w_in) >> 4;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 4);
					                    w_up_reg = (w64_reg - w_in) >> 4;
					                end
					       end
			        end
			     5:begin
			     if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 5);
					           w_notm = (w64_reg - w_in) >> 5;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 5);
					                    w_up_reg = (w64_reg - w_in) >> 5;
					                end
					       end
			        end
			     6:begin
			     if(g_match_in)
                           		begin
			     	           w64_reg = (w_in << 7);
					           w_notm = (w64_reg - w_in) >> 7;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 7);
					                    w_up_reg = (w64_reg - w_in) >> 7;
					                end
					       end
			     end
			     default:begin
			     if(g_match_in)
                           begin
			     	           w64_reg = (w_in << 7);
					           w_notm = (w64_reg - w_in) >> 7;
					           w_up_reg = w_notm + 32'h02000000;
			               end
				    else
					       begin
					           if (w_in > 32'h01000000) 
					                begin 
					                    w64_reg = (w_in << 7);
					                    w_up_reg = (w64_reg - w_in) >> 7;
					                end
					       end
			     end
			   endcase
		end
		
//		mult_gen_v11_2_0 mult_32_8_40 (
//          .a(w_in), // input [31 : 0] a
//          .b(LEARNING_FACTOR[7:0]), // input [7 : 0] b
//          .p(w40_reg) // output [39 : 0] p
//        );	
        
	always@(posedge clk)
		begin
					///////////pass the signals//////////////			
					mean_out <= mean_in;
					sd_out <= sd_in;
					w_up <= w_up_reg;
					b_w_up <= w_up_reg;
					g_match_out <= g_match_in;
					abs_diff_out <= abs_diff_in;
		end
	/////////w_up module end///////
endmodule