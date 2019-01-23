`timescale 1ns / 10ps
/*************************************************************************/
/* Title: Weight Parameters Nomrmalization Module								 */
/* Action: Normalizes the weights of all guassians								 */
/*																							    */ 
/* Takes 2 Cycles																          */
/*																								 */
/*																								 */
/*																								 */
/*************************************************************************/
module wnorm (
	input wire rst,
	input wire clk,
	input wire window_en,
	input wire [31:0] gp_in,			 	//input wire Gray Pixel
	input wire [31:0] mean1_up,
	input wire [31:0] sd1_up,
	input wire [31:0] w1_up,
	input wire [31:0] mean2_up,
	input wire [31:0] sd2_up,
	input wire [31:0] w2_up,
	input wire [31:0] mean3_up,
	input wire [31:0] sd3_up,
	input wire [31:0] w3_up,
	input wire [31:0] b1_w_up,
	input wire [31:0] b2_w_up,
	input wire [31:0] b3_w_up,
	input wire g1_match,					//Pixel Captured with Guassian 1 
	input wire g2_match,					//Pixel Captured with Guassian 1	
	input wire g3_match,					//Pixel Captured with Guassian 1 
	input wire [31:0] abs_diff_1,
	input wire [31:0] abs_diff_2,
	input wire [31:0] abs_diff_3,
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
	output reg [31:0] abs_diff_3_out,		//Passed absoulute difference 3 
	output reg g1_match_out,					//Pixel Captured with Guassian 1 
	output reg g2_match_out,					//Pixel Captured with Guassian 1	
	output reg g3_match_out					//Pixel Captured with Guassian 1 
	);
	
	wire g3_match_out_wire ,g2_match_out_wire ,g1_match_out_wire;
	wire [31:0] abs_diff_3_out_wire ,abs_diff_2_out_wire ,abs_diff_1_out_wire ,sd3_up_out_wire ,sd2_up_out_wire ,sd1_up_out_wire ,mean3_up_out_wire ,mean2_up_out_wire ,mean1_up_out_wire;
	reg g1_match_reg, g2_match_reg, g3_match_reg;
	reg g1_match_reg2, g2_match_reg2, g3_match_reg2;
	reg window_en_reg;
	reg [31:0] mean1_up_reg, mean1_up_reg2;
	reg [31:0] sd1_up_reg, sd1_up_reg2;
	reg [31:0] w1_up_reg, w1_up_reg2;
	reg [31:0] mean2_up_reg, mean2_up_reg2;
	reg [31:0] sd2_up_reg, sd2_up_reg2;
	reg [31:0] w2_up_reg, w2_up_reg2;
	reg [31:0] mean3_up_reg, mean3_up_reg2;
	reg [31:0] sd3_up_reg, sd3_up_reg2;
	reg [31:0] w3_up_reg, w3_up_reg2;
	reg [31:0] abs_diff_1_reg, abs_diff_2_reg, abs_diff_3_reg;
	reg [31:0] abs_diff_1_reg2, abs_diff_2_reg2, abs_diff_3_reg2;
	reg [31:0] b1_w_up_reg, b2_w_up_reg, b3_w_up_reg;
	reg [31:0] b1_w_up_reg2, b2_w_up_reg2, b3_w_up_reg2;
	reg [32:0] sum_reg, sum_reg2;
	reg [31:0] w_min;
	reg [1:0] i;
	wire [15:0] quotient1, quotient2, quotient3;
	wire wr_en, rd_en;	
    wire [31:0] div1_out, div2_out, div3_out;
    wire [15:0] com_divisor;
	//assign w1_up_out = {quotient1[7:0],24'b0};
	//assign w2_up_out = {quotient2[7:0],24'b0};
	//assign w3_up_out = {quotient3[7:0],24'b0};
	
//init_fifo_wr_rd_controller  #(
//.CNT_WIDTH(5),
//.DELAY_CYCLES(18)
//) w_norm_fifo_init
//(
//.rst(rst),
//.clk(clk),
//.window_en(window_en_reg),
//.wr_en(wr_en),
//.rd_en(rd_en)
//);
	
//	fifo_div16_9 initialization_fifo (
//  .clk(clk), // input clk
//  .srst(rst), // input srst
//  .din({g3_match_reg2 ,g2_match_reg2 ,g1_match_reg2 ,abs_diff_3_reg2 ,abs_diff_2_reg2 ,abs_diff_1_reg2 ,sd3_up_reg2 ,sd2_up_reg2 ,sd1_up_reg2 ,mean3_up_reg2 ,mean2_up_reg2 ,mean1_up_reg2}), // input [386 : 0] din
//  .wr_en(wr_en), // input wr_en
//  .rd_en(rd_en), // input rd_en
//  .dout({g3_match_out_wire ,g2_match_out_wire ,g1_match_out_wire ,abs_diff_3_out_wire ,abs_diff_2_out_wire ,abs_diff_1_out_wire ,sd3_up_out_wire ,sd2_up_out_wire ,sd1_up_out_wire ,mean3_up_out_wire ,mean2_up_out_wire ,mean1_up_out_wire}), // output [386 : 0] dout
//  .full(), // output full
//  .empty() // output empty
//);

pipeline_registers #(
.BIT_WIDTH(291),
.NUMBER_OF_STAGES(18)//to be ready for foreground detection
) hdmi_signals_regs
  (
   .clk(clk),
   .reset_n(~rst),
   .pipe_in({g3_match_reg2 ,g2_match_reg2 ,g1_match_reg2 ,abs_diff_3_reg2 ,abs_diff_2_reg2 ,abs_diff_1_reg2 ,sd3_up_reg2 ,sd2_up_reg2 ,sd1_up_reg2 ,mean3_up_reg2 ,mean2_up_reg2 ,mean1_up_reg2}),
   .pipe_out({g3_match_out_wire ,g2_match_out_wire ,g1_match_out_wire ,abs_diff_3_out_wire ,abs_diff_2_out_wire ,abs_diff_1_out_wire ,sd3_up_out_wire ,sd2_up_out_wire ,sd1_up_out_wire ,mean3_up_out_wire ,mean2_up_out_wire ,mean1_up_out_wire})
   );
   
//	divider_16_9 div1 (
//	.clk(clk), // input clk
//	.rfd(), // output rfd
//	.dividend(b1_w_up_reg2[31:16]), // input [15 : 0] dividend
//	.divisor(sum_reg2[32:24]), // input [8 : 0] divisor
//	.quotient(quotient1), // output [15 : 0] quotient
//	.fractional()); // output [15 : 0] fractional
	
//	divider_16_9 div2 (
//	.clk(clk), // input clk
//	.rfd(), // output rfd
//	.dividend(b2_w_up_reg2[31:16]), // input [15 : 0] dividend
//	.divisor(sum_reg2[32:24]), // input [15 : 0] divisor
//	.quotient(quotient2), // output [15 : 0] quotient
//	.fractional()); // output [15 : 0] fractional
	
//	divider_16_9 div3 (
//	.clk(clk), // input clk
//	.rfd(), // output rfd
//	.dividend(b3_w_up_reg2[31:16]), // input [15 : 0] dividend
//	.divisor(sum_reg2[32:24]), // input [15 : 0] divisor
//	.quotient(quotient3), // output [15 : 0] quotient
//	.fractional()); // output [15 : 0] fractional

assign com_divisor = {7'b0000000, sum_reg2[32:24]};

    divider_16_9 div1 (
      .aclk(clk),                                      // input wire aclk
      .s_axis_divisor_tvalid(1'b1),    // input wire s_axis_divisor_tvalid
      .s_axis_divisor_tdata(com_divisor),      // input wire [15 : 0] s_axis_divisor_tdata
      .s_axis_dividend_tvalid(1'b1),  // input wire s_axis_dividend_tvalid
      .s_axis_dividend_tdata(b1_w_up_reg2[31:16]),    // input wire [15 : 0] s_axis_dividend_tdata
      .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(div1_out)            // output wire [31 : 0] m_axis_dout_tdata
    );

    divider_16_9 div2 (
      .aclk(clk),                                      // input wire aclk
      .s_axis_divisor_tvalid(1'b1),    // input wire s_axis_divisor_tvalid
      .s_axis_divisor_tdata(com_divisor),      // input wire [15 : 0] s_axis_divisor_tdata
      .s_axis_dividend_tvalid(1'b1),  // input wire s_axis_dividend_tvalid
      .s_axis_dividend_tdata(b2_w_up_reg2[31:16]),    // input wire [15 : 0] s_axis_dividend_tdata
      .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(div2_out)            // output wire [31 : 0] m_axis_dout_tdata
    );

    divider_16_9 div3 (
      .aclk(clk),                                      // input wire aclk
      .s_axis_divisor_tvalid(1'b1),    // input wire s_axis_divisor_tvalid
      .s_axis_divisor_tdata(com_divisor),      // input wire [15 : 0] s_axis_divisor_tdata
      .s_axis_dividend_tvalid(1'b1),  // input wire s_axis_dividend_tvalid
      .s_axis_dividend_tdata(b3_w_up_reg2[31:16]),    // input wire [15 : 0] s_axis_dividend_tdata
      .m_axis_dout_tvalid(),          // output wire m_axis_dout_tvalid
      .m_axis_dout_tdata(div3_out)            // output wire [31 : 0] m_axis_dout_tdata
    );

assign quotient1 = div1_out[31:16];
assign quotient2 = div2_out[31:16];
assign quotient3 = div2_out[31:16];

	always@(posedge clk)
		begin
                    window_en_reg <= window_en;
                    sum_reg <= b1_w_up + b2_w_up + b3_w_up;//
                    b1_w_up_reg <= b1_w_up;//
                    b2_w_up_reg <= b2_w_up;//
                    b3_w_up_reg <= b3_w_up;//
                    mean1_up_reg <= mean1_up;
                    //mean1_up_out <= mean1_up_reg;
                    sd1_up_reg <= sd1_up;
                    //sd1_up_out <= sd1_up_reg;
                    mean2_up_reg <= mean2_up;
                    //mean2_up_out <= mean2_up_reg;
                    sd2_up_reg <= sd2_up;
                    //sd2_up_out <= sd2_up_reg;
                    mean3_up_reg <= mean3_up;
                    //mean3_up_out <= mean3_up_reg;
                    sd3_up_reg <= sd3_up;
                    //sd3_up_out <= sd3_up_reg;
                    abs_diff_1_reg <= abs_diff_1;
                    //abs_diff_1_out <= abs_diff_1_reg;
                    abs_diff_2_reg <= abs_diff_2;
                    //abs_diff_2_out <= abs_diff_2_reg;
                    abs_diff_3_reg <= abs_diff_3;
                    //abs_diff_3_out <= abs_diff_3_reg;
                    g1_match_reg <= g1_match;
                    //g1_match_out <= g1_match_reg ;
                    g2_match_reg <= g2_match;
                    //g2_match_out <= g2_match_reg;
                    g3_match_reg <= g3_match;
                    //g3_match_out <= g3_match_reg;
                    ///1 Cycle delay for to support new fifo initializer
                    sum_reg2 <= sum_reg;//
                    b1_w_up_reg2 <= b1_w_up_reg;//
                    b2_w_up_reg2 <= b2_w_up_reg;//
                    b3_w_up_reg2 <= b3_w_up_reg;//
                    mean1_up_reg2 <= mean1_up_reg;
                    sd1_up_reg2 <= sd1_up_reg;
                    mean2_up_reg2 <= mean2_up_reg;
                    sd2_up_reg2 <= sd2_up_reg;
                    mean3_up_reg2 <= mean3_up_reg;
                    sd3_up_reg2 <= sd3_up_reg;
                    abs_diff_1_reg2 <= abs_diff_1_reg;
                    abs_diff_2_reg2 <= abs_diff_2_reg;
                    abs_diff_3_reg2 <= abs_diff_3_reg;
                    g1_match_reg2 <= g1_match_reg;
                    g2_match_reg2 <= g2_match_reg;
                    g3_match_reg2 <= g3_match_reg;	
        /////////////////////////////output registering/////////////////////////////////
        
                    g1_match_out <= g1_match_out_wire;
                    g2_match_out <= g2_match_out_wire;
                    g3_match_out <= g3_match_out_wire;  
                    abs_diff_1_out <= abs_diff_1_out_wire;
                    abs_diff_2_out <= abs_diff_2_out_wire;
                    abs_diff_3_out <= abs_diff_3_out_wire;
                    sd1_up_out <= sd1_up_out_wire;
                    sd2_up_out <= sd2_up_out_wire;
                    sd3_up_out <= sd3_up_out_wire;
                    mean1_up_out <= mean1_up_out_wire;
                    mean2_up_out <= mean2_up_out_wire;
                    mean3_up_out <= mean3_up_out_wire;
                    w1_up_out <= {quotient1[7:0],24'b0};
                    w2_up_out <= {quotient2[7:0],24'b0};
                    w3_up_out <= {quotient3[7:0],24'b0};	
		end
/////////w_norm module end///////	
endmodule