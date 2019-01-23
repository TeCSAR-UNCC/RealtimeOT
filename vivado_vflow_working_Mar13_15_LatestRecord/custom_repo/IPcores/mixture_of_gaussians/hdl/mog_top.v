`timescale 1ns / 10ps
/***************************************************
This module has 80 cycles latency (including input and output registering).
Author: Majid Sabbagh
****************************************************/
module mog_top
	(
	input wire rst, 					//Global Reset (for fifo)
	input wire clk,					//MoG clock
	input wire window_en,			//window of interest enable input
	input wire [31:0] mean1,		//Guassian 1 Mean Parameter
	input wire [31:0] mean2,		//Gaussian 2 Mean Parameter
	input wire [31:0] mean3,		//Gaussian 3 Mean Parameter		
	input wire [31:0] sd1,			//Guassian 1 Standard Deviation Parameter  
	input wire [31:0] sd2,	    	//Guassian 2 Standard Deviation Parameter	
	input wire [31:0] sd3,			//Guassian 3 Standard Deviation Parameter
	input wire [31:0] w1,			//Guassian 1 Weight Parameter
	input wire [31:0] w2,			//Guassian 2 Weight Parameter
	input wire [31:0] w3,			//Guassian 3 Weight Parameter
	input wire [31:0] gp,		//Gray Pixel density
//	input wire [15:0] LEARNING_FACTOR, //[7:0] Left Shift Value, [15:8] Right Shift Value
//	input wire [15:0] FG_THRESHOLD,    // 16'hXXFF, XX determines the foreground threshold value
//	input wire [7:0]  MATCH_THRESHOLD,
    	output wire [31:0] MD_THRESHOLD,
	output wire [31:0] LEARNING_FACTOR,
    	output wire [31:0] FG_THRESHOLD,
    	output wire [31:0] FGDM_THRESHOLD,
	output wire [31:0] mean1_up,		//Guassian 1 Mean Parameter
	output wire [31:0] mean2_up,		//Gaussian 2 Mean Parameter
	output wire [31:0] mean3_up,		//Gaussian 3 Mean Parameter		
	output wire [31:0] sd1_up,		//Guassian 1 Standard Deviation Parameter  
	output wire [31:0] sd2_up,	    //Guassian 2 Standard Deviation Parameter	
	output wire [31:0] sd3_up,		//Guassian 3 Standard Deviation Parameter
	output wire [31:0] w1_up,		//Guassian 1 Weight Parameter
	output wire [31:0] w2_up,		//Guassian 2 Weight Parameter
	output wire [31:0] w3_up,		//Guassian 3 Weight Parameter	
	output wire window_en_out,		//window of interest enable output
	output wire [31:0] gp_out,     	//The original gray pixel	
	output wire is_fg			  	//If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
	);
	
	///////////////// Input Registering Signals/////////////////////
    wire window_en_in;                //window of interest enable
    wire [31:0] mean1_in;        //Guassian 1 Mean Parameter
    wire [31:0] mean2_in;        //Gaussian 2 Mean Parameter
    wire [31:0] mean3_in;        //Gaussian 3 Mean Parameter        
    wire [31:0] sd1_in;            //Guassian 1 Standard Deviation Parameter  
    wire [31:0] sd2_in;            //Guassian 2 Standard Deviation Parameter    
    wire [31:0] sd3_in;            //Guassian 3 Standard Deviation Parameter
    wire [31:0] w1_in;            //Guassian 1 Weight Parameter
    wire [31:0] w2_in;            //Guassian 2 Weight Parameter
    wire [31:0] w3_in;            //Guassian 3 Weight Parameter
    wire [31:0] gp_in;        //Gray Pixel density
    ///////////////////////////////////////////////////////////////
      	
	/////////////////STAGE 0 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s0;
	wire [31:0] gp_s0;
	/////////////////////////////////////////////////////////	
	wire g_match_1_s0;
	wire [31:0] mean1_s0, sd1_s0, w1_s0;
	wire [31:0] abs_diff1_s0;
	/////////////////////////////////////////////////////////	
	wire g_match_2_s0;
	wire [31:0] mean2_s0, sd2_s0, w2_s0;
	wire [31:0] abs_diff2_s0;
	////////////////////////////////////////////////////////
	wire g_match_3_s0;
	wire [31:0] mean3_s0, sd3_s0, w3_s0;
	wire [31:0] abs_diff3_s0;
	/////////////////STAGE 1 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s1;
	wire [31:0] gp_s1;
	/////////////////////////////////////////////////////////	
	wire g_match_1_s1;
	wire [31:0] mean1_s1, sd1_s1, w1_s1;
	wire [31:0] abs_diff1_s1;
	wire [31:0] b_w1_up_s1, c_w1_up_s1;
	/////////////////////////////////////////////////////////	
	wire g_match_2_s1;
	wire [31:0] mean2_s1, sd2_s1, w2_s1;
	wire [31:0] abs_diff2_s1;
	wire [31:0] b_w2_up_s1, c_w2_up_s1;
	////////////////////////////////////////////////////////
	wire g_match_3_s1;
	wire [31:0] mean3_s1, sd3_s1, w3_s1;
	wire [31:0] abs_diff3_s1;
	wire [31:0] b_w3_up_s1, c_w3_up_s1;
	/////////////////STAGE 2 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s2_wire;
	wire [31:0] gp_s2_wire;
	wire window_en_s2;
	wire [31:0] gp_s2;
	wire wr_en_s2, rd_en_s2;
	/////////////////////////////////////////////////////////	
	wire g_match_1_s2;
	wire [31:0] mean1_s2, sd1_s2, w1_s2;
	wire [31:0] abs_diff1_s2;
	wire [31:0] b_w1_up_s2, c_w1_up_s2;
	wire [31:0] tmp1_reg1_up_s2, tmp1_reg2_up_s2;
	/////////////////////////////////////////////////////////	
	wire g_match_2_s2;
	wire [31:0] mean2_s2, sd2_s2, w2_s2;
	wire [31:0] abs_diff2_s2;
	wire [31:0] b_w2_up_s2, c_w2_up_s2;
	wire [31:0] tmp2_reg1_up_s2, tmp2_reg2_up_s2;
	////////////////////////////////////////////////////////
	wire g_match_3_s2;
	wire [31:0] mean3_s2, sd3_s2, w3_s2;
	wire [31:0] abs_diff3_s2;
	wire [31:0] b_w3_up_s2, c_w3_up_s2;
	wire [31:0] tmp3_reg1_up_s2, tmp3_reg2_up_s2;
	/////////////////STAGE 3 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s3;
	wire [31:0] gp_s3;
	/////////////////////////////////////////////////////////	
	wire g_match_1_s3;
	wire [31:0] mean1_s3, sd1_s3, w1_s3;
	wire [31:0] abs_diff1_s3;
	wire [31:0] b_w1_up_s3, c_w1_up_s3;
	wire [63:0] sqrt1_in_s3;
	wire [31:0] tmp1_reg1_s3, tmp1_reg2_s3;
	wire [31:0] powd1_00_s3, powd1_11_s3;
	/////////////////////////////////////////////////////////	
	wire g_match_2_s3;
	wire [31:0] mean2_s3, sd2_s3, w2_s3;
	wire [31:0] abs_diff2_s3;
	wire [31:0] b_w2_up_s3, c_w2_up_s3;
	wire [63:0] sqrt2_in_s3;
	wire [31:0] tmp2_reg1_s3, tmp2_reg2_s3;
	wire [31:0] powd2_00_s3, powd2_11_s3;
	////////////////////////////////////////////////////////
	wire g_match_3_s3;
	wire [31:0] mean3_s3, sd3_s3, w3_s3;
	wire [31:0] abs_diff3_s3;
	wire [31:0] b_w3_up_s3, c_w3_up_s3;
	wire [63:0] sqrt3_in_s3;
	wire [31:0] tmp3_reg1_s3, tmp3_reg2_s3;
	wire [31:0] powd3_00_s3, powd3_11_s3;
	/////////////////STAGE 4 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s4;
	wire [31:0] gp_s4;
	/////////////////////////////////////////////////////////
	wire [31:0] tmp1_reg1_s4;
	wire [31:0] tmp1_reg2_s4;
	wire [31:0] powd1_00_s4;
	wire [31:0] powd1_11_s4;	
	wire [31:0] mean1_s4;
	wire [31:0] sd1_s4;
	wire [31:0] w1_s4;
	wire [31:0] b_w1_up_s4;
	wire [31:0] c_w1_up_s4;
	wire g_match_1_s4;
	wire [31:0] sqrt1_in_s4;
	wire [31:0] abs_diff1_s4;
		/////////////////////////////////////////////////////////
	wire [31:0] tmp2_reg1_s4;
	wire [31:0] tmp2_reg2_s4;
	wire [31:0] powd2_00_s4;
	wire [31:0] powd2_11_s4;	
	wire [31:0] mean2_s4;
	wire [31:0] sd2_s4;
	wire [31:0] w2_s4;
	wire [31:0] b_w2_up_s4;
	wire [31:0] c_w2_up_s4;
	wire g_match_2_s4;
	wire [31:0] sqrt2_in_s4;
	wire [31:0] abs_diff2_s4;
		/////////////////////////////////////////////////////////
	wire [31:0] tmp3_reg1_s4;
	wire [31:0] tmp3_reg2_s4;
	wire [31:0] powd3_00_s4;
	wire [31:0] powd3_11_s4;	
	wire [31:0] mean3_s4;
	wire [31:0] sd3_s4;
	wire [31:0] w3_s4;
	wire [31:0] b_w3_up_s4;
	wire [31:0] c_w3_up_s4;
	wire g_match_3_s4;
	wire [31:0] sqrt3_in_s4;
	wire [31:0] abs_diff3_s4;
	/////////////////STAGE 5 signals//////////////////////
	/////////////////////////////////////////////////////////
	wire window_en_s5;
	wire [31:0] gp_s5;
	/////////////////////////////////////////////////////////	
	wire g_match_1_s5;
	wire [31:0] mean1_s5, sd1_s5, w1_s5;
	wire [31:0] abs_diff1_s5;
	wire [31:0] b_w1_up_s5, c_w1_up_s5;
	/////////////////////////////////////////////////////////	
	wire g_match_2_s5;
	wire [31:0] mean2_s5, sd2_s5, w2_s5;
	wire [31:0] abs_diff2_s5;
	wire [31:0] b_w2_up_s5, c_w2_up_s5;
	////////////////////////////////////////////////////////
	wire g_match_3_s5;
	wire [31:0] mean3_s5, sd3_s5, w3_s5;
	wire [31:0] abs_diff3_s5;
	wire [31:0] b_w3_up_s5, c_w3_up_s5;

	/////////////////Added for Configuration Parameters registering/////////////////////
	    wire [31:0] MD_THRESHOLD_reg;
	    wire [31:0] LEARNING_FACTOR_reg;
	    wire [31:0] FG_THRESHOLD_reg;
	    wire [31:0] FGDM_THRESHOLD_reg;
	///////////////////////////////////////////////////////////////

	///////////////// Output Registering Signals/////////////////////
    wire [31:0] mean1_out;	   //Guassian 1 Mean Parameter
    wire [31:0] mean2_out;     //Gaussian 2 Mean Parameter
    wire [31:0] mean3_out;     //Gaussian 3 Mean Parameter        
    wire [31:0] sd1_out;       //Guassian 1 Standard Deviation Parameter  
    wire [31:0] sd2_out;       //Guassian 2 Standard Deviation Parameter    
    wire [31:0] sd3_out;       //Guassian 3 Standard Deviation Parameter
    wire [31:0] w1_out;        //Guassian 1 Weight Parameter
    wire [31:0] w2_out;        //Guassian 2 Weight Parameter
    wire [31:0] w3_out;        //Guassian 3 Weight Parameter      
    wire is_fg_out;            //If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
	///////////////////////////////////////////////////////////////
	
	/***********************************************Configuration Parameters registering************************************************/
//	//////// Config Params Registering //////
//    pipeline_registers #(
//        .BIT_WIDTH(40),
//        .NUMBER_OF_STAGES(5)
//        ) config_params_registering
//          (
//           .clk(clk),
//           .reset_n(1),
//           .pipe_in({FG_THRESHOLD, LEARNING_FACTOR, MATCH_THRESHOLD}),
//           .pipe_out({FG_THRESHOLD_reg, LEARNING_FACTOR_reg, MATCH_THRESHOLD_reg})
//           );	
           
         //  assign MD_THRESHOLD_reg = MD_THRESHOLD;
	  // assign LEARNING_FACTOR_reg = LEARNING_FACTOR;
	  // assign FGDM_THRESHOLD_reg = FGDM_THRESHOLD;
	   //assign FG_THRESHOLD_reg = FG_THRESHOLD;
	 //  assign FG_THRESHOLD_reg = MD_THRESHOLD;//USE the same value for both math detection and foreground detection thresholds	 
////// Config Params Registering //////
////// Config Params Registering //////
   //Match Detection Threshold
   pipeline_registers #(
       .BIT_WIDTH(32),
       .NUMBER_OF_STAGES(1)
       ) MD_THRESHOLD_registering
         (
          .clk(clk),
          .reset_n(1),
          .pipe_in(MD_THRESHOLD),
          .pipe_out(MD_THRESHOLD_reg)
          );
          
   //Learning Factor
      pipeline_registers #(
          .BIT_WIDTH(32),
          .NUMBER_OF_STAGES(3)
          ) LEARNING_FACTOR_registering
            (
             .clk(clk),
             .reset_n(1),
             .pipe_in(LEARNING_FACTOR),
             .pipe_out(LEARNING_FACTOR_reg)
             );       
             
     //ForeGround Detection Threshold
          //pipeline_registers #(
             // .BIT_WIDTH(32),
             // .NUMBER_OF_STAGES(77)
              //) FG_THRESHOLD_registering
              //  (
               //  .clk(clk),
               //  .reset_n(1),
               //  .pipe_in(FG_THRESHOLD),
               //  .pipe_out(FG_THRESHOLD_reg)
               //  ); 

    //ForeGround Detection Match Threshold
        pipeline_registers #(
            .BIT_WIDTH(32),
            .NUMBER_OF_STAGES(77)
            ) FGDM_THRESHOLD_registering
              (
               .clk(clk),
               .reset_n(1),
               .pipe_in(FGDM_THRESHOLD),
               .pipe_out(FGDM_THRESHOLD_reg)
               );  
                              
	/***********************************************Input Registering************************************************/
	
	//////// Params Registering //////
    pipeline_registers #(
        .BIT_WIDTH(288),
        .NUMBER_OF_STAGES(1)
        ) input_params_registering
          (
           .clk(clk),
           .reset_n(~rst),
           .pipe_in({w3, w2, w1, sd3, sd2, sd1, mean3, mean2, mean1}),
           .pipe_out({w3_in, w2_in, w1_in, sd3_in, sd2_in, sd1_in, mean3_in, mean2_in, mean1_in})
           );
           
     //////// Window of Interest enable registering //////
     pipeline_registers #(
         .BIT_WIDTH(1),
         .NUMBER_OF_STAGES(1)
         ) input_window_en
           (
            .clk(clk),
            .reset_n(~rst),
            .pipe_in(window_en),
            .pipe_out(window_en_in)
            ); 
                      
    //////// Gray Scale pixel registering //////
    pipeline_registers #(
        .BIT_WIDTH(32),
        .NUMBER_OF_STAGES(1)
        ) input_gp
          (
           .clk(clk),
           .reset_n(~rst),
           .pipe_in(gp),
           .pipe_out(gp_in)
           );  
                   
	/************************************************Pipeline Stage 0************************************************/
	///////////////////////////////Gaussian 1 Match Detection//////////////////////////////// 		
	match_detection g1_match(
		.clk(clk),					//MoG clock
		.gp_in(gp_in),				//Gray Pixel density
		.mean(mean1_in),		    	//Guassian Mean Parameter	
		.sd(sd1_in),					//Guassian Standard Deviation Parameter  
		.w(w1_in),					//Guassian Weight Parameter	
		.MATCH_THRESHOLD(MD_THRESHOLD_reg[3:0]),
		.g_match(g_match_1_s0),				//Pixel Captured with the Guassian
		.mean_out(mean1_s0),			//Guassian Mean Parameter
		.sd_out(sd1_s0), 				//sd out
		.w_out(w1_s0),		    	//Guassian Weight Parameter
		.abs_diff_out(abs_diff1_s0) 		//abs diff passed
		);
	///////////////////////////////Gaussian 2 Match Detection//////////////////////////////// 		
	match_detection g2_match(
		.clk(clk),					//MoG clock
		.gp_in(gp_in),				//Gray Pixel density (input in gray 0-255)
		.mean(mean2_in),		    	//Guassian Mean Parameter	
		.sd(sd2_in),					//Guassian Standard Deviation Parameter  
		.w(w2_in),					//Guassian Weight Parameter	
		.MATCH_THRESHOLD(MD_THRESHOLD_reg[3:0]),
		.g_match(g_match_2_s0),				//Pixel Captured with the Guassian
		.mean_out(mean2_s0),			//Guassian Mean Parameter
		.sd_out(sd2_s0), 				//sd out
		.w_out(w2_s0),		    	//Guassian Weight Parameter
		.abs_diff_out(abs_diff2_s0) 		//abs diff passed
		);
	///////////////////////////////Gaussian 3 Match Detection//////////////////////////////// 		
	match_detection g3_match(
		.clk(clk),					//MoG clock
		.gp_in(gp_in),				//Gray Pixel density (input in gray 0-255)
		.mean(mean3_in),		    	//Guassian Mean Parameter	
		.sd(sd3_in),					//Guassian Standard Deviation Parameter  
		.w(w3_in),					//Guassian Weight Parameter	
		.MATCH_THRESHOLD(MD_THRESHOLD_reg[3:0]),
		.g_match(g_match_3_s0),				//Pixel Captured with the Guassian
		.mean_out(mean3_s0),			//Guassian Mean Parameter
		.sd_out(sd3_s0), 				//sd out
		.w_out(w3_s0),		    	//Guassian Weight Parameter
		.abs_diff_out(abs_diff3_s0) 		//abs diff passed
		);
		
	//////////////////////////////////Window Enable and Gray Pixel Density Passing//////////////////////////////////
        pipeline_registers #(
            .BIT_WIDTH(33),
            .NUMBER_OF_STAGES(2)
            ) match_det_registering
              (
               .clk(clk),
               .reset_n(~rst),
               .pipe_in({window_en_in, gp_in}),
               .pipe_out({window_en_s0, gp_s0})
               );    			
	/************************************************Pipeline Stage 1************************************************/
	///////////////////////////////Gaussian 1 Weight Parameter Updating///////////////////////////////
	w_up w1_update(
		.clk(clk),
		.g_match_in(g_match_1_s0),
		.mean_in(mean1_s0),
		.sd_in(sd1_s0),
		.w_in(w1_s0),
		.abs_diff_in(abs_diff1_s0),
		.LEARNING_FACTOR(LEARNING_FACTOR_reg[15:0]),
		.g_match_out(g_match_1_s1),
		.mean_out(mean1_s1),
		.sd_out(sd1_s1),
		.w_up(w1_s1),
		.b_w_up(b_w1_up_s1),
		.abs_diff_out(abs_diff1_s1)
		);
	///////////////////////////////Gaussian 2 Weight Parameter Updating///////////////////////////////	
	w_up w2_update(
		.clk(clk),
		.g_match_in(g_match_2_s0),
		.mean_in(mean2_s0),
		.sd_in(sd2_s0),
		.w_in(w2_s0),
		.abs_diff_in(abs_diff2_s0),
		.LEARNING_FACTOR(LEARNING_FACTOR_reg[15:0]),
		.g_match_out(g_match_2_s1),
		.mean_out(mean2_s1),
		.sd_out(sd2_s1),
		.w_up(w2_s1),
		.b_w_up(b_w2_up_s1),
		.abs_diff_out(abs_diff2_s1)
		);
	///////////////////////////////Gaussian 3 Weight Parameter Updating///////////////////////////////
	w_up w3_update (
		.clk(clk),
		.g_match_in(g_match_3_s0),
		.mean_in(mean3_s0),
		.sd_in(sd3_s0),
		.w_in(w3_s0),
		.abs_diff_in(abs_diff3_s0),
		.LEARNING_FACTOR(LEARNING_FACTOR_reg[15:0]),
		.g_match_out(g_match_3_s1),
		.mean_out(mean3_s1),
		.sd_out(sd3_s1),
		.w_up(w3_s1),
		.b_w_up(b_w3_up_s1),
		.abs_diff_out(abs_diff3_s1)
		);
		
	//////////////////////////////////Window Enable and Gray Pixel Density Passing//////////////////////////////////		
	////////////////////Window Enable and Gray Pixel Density Passing///////////////
          pipeline_registers #(
              .BIT_WIDTH(33),
              .NUMBER_OF_STAGES(1)
              ) w_up_registering
                (
                 .clk(clk),
                 .reset_n(~rst),
                 .pipe_in({window_en_s0, gp_s0}),
                 .pipe_out({window_en_s1, gp_s1})
                 );             
	/************************************************Pipeline Stage 2************************************************/
	///////////////////////////////Gaussian 1 Mean Parameter Updating///////////////////////////////
	mean_up mean1_update(
		.rst(rst),
		.clk(clk),
		.gp(gp_s1),
		.g_match(g_match_1_s1),
		.mean_in(mean1_s1),
		.sd_in(sd1_s1),
		.w_up_in(w1_s1),
		.b_w_up_in(b_w1_up_s1),
		.abs_diff_in(abs_diff1_s1),
		.window_en(window_en_s1),
		.g_match_out(g_match_1_s2),
		.mean_up(mean1_s2),
		.sd_out(sd1_s2),
		.w_up(w1_s2),
		.b_w_up(b_w1_up_s2),
		.tmp_reg1_up(tmp1_reg1_up_s2),
		.tmp_reg2_up(tmp1_reg2_up_s2),
		.abs_diff_out(abs_diff1_s2)
		);
	///////////////////////////////Gaussian 2 Mean Parameter Updating///////////////////////////////	
	mean_up mean2_update(
		.rst(rst),
		.clk(clk),
		.gp(gp_s1),
		.g_match(g_match_2_s1),
		.mean_in(mean2_s1),
		.sd_in(sd2_s1),
		.w_up_in(w2_s1),
		.b_w_up_in(b_w2_up_s1),
		.abs_diff_in(abs_diff2_s1),
		.window_en(window_en_s1),
		.g_match_out(g_match_2_s2),
		.mean_up(mean2_s2),
		.sd_out(sd2_s2),
		.w_up(w2_s2),
		.b_w_up(b_w2_up_s2),
		.tmp_reg1_up(tmp2_reg1_up_s2),
		.tmp_reg2_up(tmp2_reg2_up_s2),
		.abs_diff_out(abs_diff2_s2)
		);
	///////////////////////////////Gaussian 3 Mean Parameter Updating///////////////////////////////
	mean_up mean3_update(
		.rst(rst),
		.clk(clk),
		.gp(gp_s1),
		.g_match(g_match_3_s1),
		.mean_in(mean3_s1),
		.sd_in(sd3_s1),
		.w_up_in(w3_s1),
		.b_w_up_in(b_w3_up_s1),
		.abs_diff_in(abs_diff3_s1),
		.window_en(window_en_s1),
		.g_match_out(g_match_3_s2),
		.mean_up(mean3_s2),
		.sd_out(sd3_s2),
		.w_up(w3_s2),
		.b_w_up(b_w3_up_s2),
		.tmp_reg1_up(tmp3_reg1_up_s2),
		.tmp_reg2_up(tmp3_reg2_up_s2),
		.abs_diff_out(abs_diff3_s2)
		);
	////////////////////Window Enable and Gray Pixel Density Passing///////////////
    pipeline_registers #(
    .BIT_WIDTH(33),
    .NUMBER_OF_STAGES(24)
    ) mean_up_regs
      (
       .clk(clk),
       .reset_n(~rst),
       .pipe_in({window_en_s1, gp_s1}),
       .pipe_out({window_en_s2, gp_s2})
       );
	/************************************************Pipe Stage 3************************************************/
//////////////////////////////////Gaussian 1 Standard Deviation Updating/////////////////////
sd_up standard_deviation_1_update (
	.clk(clk),
	.rst(rst),
	.mean_up(mean1_s2),
	.sd(sd1_s2),
	.w_up(w1_s2),
	.b_w(b_w1_up_s2),
	.gp(gp_s2),
	.g_match(g_match_1_s2),
	.abs_diff(abs_diff1_s2),
	.tmp_reg1(tmp1_reg1_up_s2),
	.tmp_reg2(tmp1_reg2_up_s2),
	.mean_up_out(mean1_s3),
	.sd_up(sd1_s3),
	.w_up_out(w1_s3),
	.b_w_up_out(b_w1_up_s3),
	.g_match_out(g_match_1_s3),
	.abs_diff_out(abs_diff1_s3)
	);
//////////////////////////////////Gaussian 2 Standard Deviation Updating/////////////////////
sd_up standard_deviation_2_update (
	.clk(clk),
	.rst(rst),
	.mean_up(mean2_s2),
	.sd(sd2_s2),
	.w_up(w2_s2),
	.b_w(b_w2_up_s2),
	.gp(gp_s2),
	.g_match(g_match_2_s2),
	.abs_diff(abs_diff2_s2),
	.tmp_reg1(tmp2_reg1_up_s2),
	.tmp_reg2(tmp2_reg2_up_s2),
	.mean_up_out(mean2_s3),
	.sd_up(sd2_s3),
	.w_up_out(w2_s3),
	.b_w_up_out(b_w2_up_s3),
	.g_match_out(g_match_2_s3),
	.abs_diff_out(abs_diff2_s3)
	);
//////////////////////////////////Gaussian 3 Standard Deviation Updating/////////////////////
sd_up standard_deviation_3_update (
	.clk(clk),
	.rst(rst),
	.mean_up(mean3_s2),
	.sd(sd3_s2),
	.w_up(w3_s2),
	.b_w(b_w3_up_s2),
	.gp(gp_s2),
	.g_match(g_match_3_s2),
	.abs_diff(abs_diff3_s2),
	.tmp_reg1(tmp3_reg1_up_s2),
	.tmp_reg2(tmp3_reg2_up_s2),
	.mean_up_out(mean3_s3),
	.sd_up(sd3_s3),
	.w_up_out(w3_s3),
	.b_w_up_out(b_w3_up_s3),
	.g_match_out(g_match_3_s3),
	.abs_diff_out(abs_diff3_s3)
	);
	
	//////////////////////////////////Window Enable and Gray Pixel Density Passing//////////////////////////////////
    pipeline_registers #(
    .BIT_WIDTH(33),
    .NUMBER_OF_STAGES(24)
    ) sd_up_regs
      (
       .clk(clk),
       .reset_n(~rst),
       .pipe_in({window_en_s2, gp_s2}),
       .pipe_out({window_en_s3, gp_s3})
       );
	/************************************************Pipe Stage 4************************************************/
	////////////////////////////////////////Gaussians Weight Normalization////////////////////////////////////////
	wnorm weight_norm (
		.rst(rst),
		.clk(clk),
		.window_en(window_en_s3),
		.gp_in(gp_s3),			 	
		.mean1_up(mean1_s3),
		.sd1_up(sd1_s3),
		.w1_up(w1_s3),
		.mean2_up(mean2_s3),
		.sd2_up(sd2_s3),
		.w2_up(w2_s3),
		.mean3_up(mean3_s3),
		.sd3_up(sd3_s3),
		.w3_up(w3_s3),
		.b1_w_up(b_w1_up_s3),
		.b2_w_up(b_w2_up_s3),
		.b3_w_up(b_w3_up_s3),
		.g1_match(g_match_1_s3),					//Pixel Captured with Guassian 1 
		.g2_match(g_match_2_s3),					//Pixel Captured with Guassian 1	
		.g3_match(g_match_3_s3),					//Pixel Captured with Guassian 1 
		.abs_diff_1(abs_diff1_s3),
		.abs_diff_2(abs_diff2_s3),
		.abs_diff_3(abs_diff3_s3),
		.mean1_up_out(mean1_s4),		//Guassian 1 Mean Parameter
		.mean2_up_out(mean2_s4),		//Gaussian 2 Mean Parameter
		.mean3_up_out(mean3_s4),		//Gaussian 3 Mean Parameter		
		.sd1_up_out(sd1_s4),		//Guassian 1 Standard Deviation Parameter  
		.sd2_up_out(sd2_s4),	    //Guassian 2 Standard Deviation Parameter	
		.sd3_up_out(sd3_s4),		//Guassian 3 Standard Deviation Parameter
		.w1_up_out(w1_s4),		//Guassian 1 Weight Parameter
		.w2_up_out(w2_s4),		//Guassian 2 Weight Parameter
		.w3_up_out(w3_s4),		//Guassian 3 Weight Parameter	
		.abs_diff_1_out(abs_diff1_s4),		//Passed absoulute difference 1  
		.abs_diff_2_out(abs_diff2_s4),		//Passed absoulute difference 2 	
		.abs_diff_3_out(abs_diff3_s4),		//Passed absoulute difference 3 
		.g1_match_out(g_match_1_s4),
		.g2_match_out(g_match_2_s4),
		.g3_match_out(g_match_3_s4)
		);
		
	//////////////////////////////////Window Enable and Gray Pixel Density Passing//////////////////////////////////
    pipeline_registers #(
    .BIT_WIDTH(33),
    .NUMBER_OF_STAGES(21)
    ) wnorm_regs
      (
       .clk(clk),
       .reset_n(~rst),
       .pipe_in({window_en_s3, gp_s3}),
       .pipe_out({window_en_s4, gp_s4})
       );
	/************************************************Pipe Stage 5************************************************/
	/////////////////////////////////////////Virtual Component Creation///////////////////////////////////////////
   vcomp virtual_component(
	.clk(clk),
	.gp_in(gp_s4),
	.g1_match_in(g_match_1_s4),
	.g2_match_in(g_match_2_s4),
	.g3_match_in(g_match_3_s4),
	.mean1_up_in(mean1_s4),		//Guassian 1 Mean Parameter
	.mean2_up_in(mean2_s4),		//Gaussian 2 Mean Parameter
	.mean3_up_in(mean3_s4),		//Gaussian 3 Mean Parameter		
	.sd1_up_in(sd1_s4),		//Guassian 1 Standard Deviation Parameter  
	.sd2_up_in(sd2_s4),	    //Guassian 2 Standard Deviation Parameter	
	.sd3_up_in(sd3_s4),		//Guassian 3 Standard Deviation Parameter
	.w1_up_in(w1_s4),		//Guassian 1 Weight Parameter
	.w2_up_in(w2_s4),		//Guassian 2 Weight Parameter
	.w3_up_in(w3_s4),		//Guassian 3 Weight Parameter	
	.abs_diff_1_in(abs_diff1_s4),		//Passed absoulute difference 1  
	.abs_diff_2_in(abs_diff2_s4),		//Passed absoulute difference 2 	
	.abs_diff_3_in(abs_diff3_s4),		//Passed absoulute difference 3
	.mean1_up_out(mean1_s5),		//Guassian 1 Mean Parameter
	.mean2_up_out(mean2_s5),		//Gaussian 2 Mean Parameter
	.mean3_up_out(mean3_s5),		//Gaussian 3 Mean Parameter		
	.sd1_up_out(sd1_s5),		//Guassian 1 Standard Deviation Parameter  
	.sd2_up_out(sd2_s5),	    //Guassian 2 Standard Deviation Parameter	
	.sd3_up_out(sd3_s5),		//Guassian 3 Standard Deviation Parameter	
	.w1_up_out(w1_s5),		//Guassian 1 Weight Parameter
	.w2_up_out(w2_s5),		//Guassian 2 Weight Parameter
	.w3_up_out(w3_s5),		//Guassian 3 Weight Parameter	
	.abs_diff_1_out(abs_diff1_s5),		//Passed absoulute difference 1  
	.abs_diff_2_out(abs_diff2_s5),		//Passed absoulute difference 2 	
	.abs_diff_3_out(abs_diff3_s5)		//Passed absoulute difference 3 
	);
    //////////////////////////////////Window Enable and Gray Pixel Density Passing//////////////////////////////////
    pipeline_registers #(
    .BIT_WIDTH(33),
    .NUMBER_OF_STAGES(4)
    ) vcomp_regs
      (
       .clk(clk),
       .reset_n(~rst),
       .pipe_in({window_en_s4, gp_s4}),
       .pipe_out({window_en_s5, gp_s5})
       );
	/************************************************Pipe Stage 6************************************************/
	////////////////////////////////////////////Foreground Detection//////////////////////////////////////////////
	fg_detection foreground_detection (
		.clk(clk),
		.mean1_up(mean1_s5),
		.sd1_up(sd1_s5),
		.w1_up(w1_s5),
		.mean2_up(mean2_s5),
		.sd2_up(sd2_s5),
		.w2_up(w2_s5),
		.mean3_up(mean3_s5),
		.sd3_up(sd3_s5),
		.w3_up(w3_s5),
		.abs_diff_1(abs_diff1_s5),					//Passed absoulute difference 1  
		.abs_diff_2(abs_diff2_s5),					//Passed absoulute difference 2 	
		.abs_diff_3(abs_diff3_s5),					//Passed absoulute difference 3  
		.FG_THRESHOLD(FG_THRESHOLD_reg[15:0]),
		.MATCH_THRESHOLD(FGDM_THRESHOLD_reg[3:0]),
		.mean1_up_out(mean1_out),		//Guassian 1 Mean Parameter
		.mean2_up_out(mean2_out),		//Gaussian 2 Mean Parameter
		.mean3_up_out(mean3_out),		//Gaussian 3 Mean Parameter		
		.sd1_up_out(sd1_out),		//Guassian 1 Standard Deviation Parameter  
		.sd2_up_out(sd2_out),	    //Guassian 2 Standard Deviation Parameter	
		.sd3_up_out(sd3_out),		//Guassian 3 Standard Deviation Parameter
		.w1_up_out(w1_out),		//Guassian 1 Weight Parameter
		.w2_up_out(w2_out),		//Guassian 2 Weight Parameter
		.w3_up_out(w3_out),		//Guassian 3 Weight Parameter
		.is_fg(is_fg_out)			  		//If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
		);
		
		
	   /***********************************************Output Registering************************************************/   
        //////// Params Registering //////
        pipeline_registers #(
            .BIT_WIDTH(288),
            .NUMBER_OF_STAGES(1)
            ) output_params_registering
              (
               .clk(clk),
               .reset_n(~rst),
               .pipe_in({w3_out, w2_out, w1_out, sd3_out, sd2_out, sd1_out, mean3_out, mean2_out, mean1_out}),
               .pipe_out({w3_up, w2_up, w1_up, sd3_up, sd2_up, sd1_up, mean3_up, mean2_up, mean1_up})
               );
               
        //////// Foreground mask registering //////
       pipeline_registers #(
           .BIT_WIDTH(1),
           .NUMBER_OF_STAGES(1)
           ) output_is_fg_registering
             (
              .clk(clk),
              .reset_n(~rst),
              .pipe_in(is_fg_out),
              .pipe_out(is_fg)
              );                    
               
         //////// Window of Interest enable registering //////
         pipeline_registers #(
             .BIT_WIDTH(1),
             .NUMBER_OF_STAGES(3)
             ) output_window_en_registering
               (
                .clk(clk),
                .reset_n(~rst),
                .pipe_in(window_en_s5),
                .pipe_out(window_en_out)
                ); 
                          
        //////// Gray Scale pixel registering //////
        pipeline_registers #(
            .BIT_WIDTH(32),
            .NUMBER_OF_STAGES(3)
            ) output_gp_registering
              (
               .clk(clk),
               .reset_n(~rst),
               .pipe_in(gp_s5),
               .pipe_out(gp_out)
               );  
          /****************************************************************************************************************/
          
	///////////end mog_top	
endmodule
