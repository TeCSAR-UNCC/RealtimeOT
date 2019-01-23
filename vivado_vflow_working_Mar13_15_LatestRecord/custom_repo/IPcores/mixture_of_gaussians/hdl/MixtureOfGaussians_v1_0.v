
`timescale 1 ns / 1 ps

	module MixtureOfGaussians_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        input wire rst,                     //Global Reset (for fifo)
        input wire clk,                    //MoG clock
        input wire window_en,            //window of interest enable input
        input wire [31:0] mean1,        //Guassian 1 Mean Parameter
        input wire [31:0] mean2,        //Gaussian 2 Mean Parameter
        input wire [31:0] mean3,        //Gaussian 3 Mean Parameter        
        input wire [31:0] sd1,            //Guassian 1 Standard Deviation Parameter  
        input wire [31:0] sd2,            //Guassian 2 Standard Deviation Parameter    
        input wire [31:0] sd3,            //Guassian 3 Standard Deviation Parameter
        input wire [31:0] w1,            //Guassian 1 Weight Parameter
        input wire [31:0] w2,            //Guassian 2 Weight Parameter
        input wire [31:0] w3,            //Guassian 3 Weight Parameter
        input wire [31:0] gp,        //Gray Pixel density
        output wire [31:0] mean1_up,        //Guassian 1 Mean Parameter
        output wire [31:0] mean2_up,        //Gaussian 2 Mean Parameter
        output wire [31:0] mean3_up,        //Gaussian 3 Mean Parameter        
        output wire [31:0] sd1_up,        //Guassian 1 Standard Deviation Parameter  
        output wire [31:0] sd2_up,        //Guassian 2 Standard Deviation Parameter    
        output wire [31:0] sd3_up,        //Guassian 3 Standard Deviation Parameter
        output wire [31:0] w1_up,        //Guassian 1 Weight Parameter
        output wire [31:0] w2_up,        //Guassian 2 Weight Parameter
        output wire [31:0] w3_up,        //Guassian 3 Weight Parameter    
        output wire window_en_out,        //window of interest enable output
        output wire [31:0] gp_out,         //The original gray pixel    
        output wire is_fg,                  //If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI
		input wire  s_axi_aclk,
		input wire  s_axi_aresetn,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
		input wire [2 : 0] s_axi_awprot,
		input wire  s_axi_awvalid,
		output wire  s_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
		input wire  s_axi_wvalid,
		output wire  s_axi_wready,
		output wire [1 : 0] s_axi_bresp,
		output wire  s_axi_bvalid,
		input wire  s_axi_bready,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
		input wire [2 : 0] s_axi_arprot,
		input wire  s_axi_arvalid,
		output wire  s_axi_arready,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
		output wire [1 : 0] s_axi_rresp,
		output wire  s_axi_rvalid,
		input wire  s_axi_rready
	);

	wire [31:0] MD_THRESHOLD;
	wire [31:0] LEARNING_FACTOR;
    	wire [31:0] FG_THRESHOLD;
    	wire [31:0] FGDM_THRESHOLD;
    
// Instantiation of Axi Bus Interface S_AXI
	MixtureOfGaussians_v1_0_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) MixtureOfGaussians_v1_0_S_AXI_inst (
		.S_AXI_ACLK(s_axi_aclk),
		.S_AXI_ARESETN(s_axi_aresetn),
		.S_AXI_AWADDR(s_axi_awaddr),
		.S_AXI_AWPROT(s_axi_awprot),
		.S_AXI_AWVALID(s_axi_awvalid),
		.S_AXI_AWREADY(s_axi_awready),
		.S_AXI_WDATA(s_axi_wdata),
		.S_AXI_WSTRB(s_axi_wstrb),
		.S_AXI_WVALID(s_axi_wvalid),
		.S_AXI_WREADY(s_axi_wready),
		.S_AXI_BRESP(s_axi_bresp),
		.S_AXI_BVALID(s_axi_bvalid),
		.S_AXI_BREADY(s_axi_bready),
		.S_AXI_ARADDR(s_axi_araddr),
		.S_AXI_ARPROT(s_axi_arprot),
		.S_AXI_ARVALID(s_axi_arvalid),
		.S_AXI_ARREADY(s_axi_arready),
		.S_AXI_RDATA(s_axi_rdata),
		.S_AXI_RRESP(s_axi_rresp),
		.S_AXI_RVALID(s_axi_rvalid),
		.S_AXI_RREADY(s_axi_rready),
        	.MD_THRESHOLD(MD_THRESHOLD),
		.LEARNING_FACTOR(LEARNING_FACTOR),
        	.FG_THRESHOLD(FG_THRESHOLD),
        	.FGDM_THRESHOLD(FGDM_THRESHOLD)
	);

	// Add user logic here
        mog_top mixture_of_gaussians
            (
            .rst(rst),                     //Global Reset (for fifo)
            .clk(clk),                    //MoG clock
            .window_en(window_en),            //window of interest enable input
            .mean1(mean1),        //Guassian 1 Mean Parameter
            .mean2(mean2),        //Gaussian 2 Mean Parameter
            .mean3(mean3),        //Gaussian 3 Mean Parameter        
            .sd1(sd1),            //Guassian 1 Standard Deviation Parameter  
            .sd2(sd2),            //Guassian 2 Standard Deviation Parameter    
            .sd3(sd3),            //Guassian 3 Standard Deviation Parameter
            .w1(w1),            //Guassian 1 Weight Parameter
            .w2(w2),            //Guassian 2 Weight Parameter
            .w3(w3),            //Guassian 3 Weight Parameter
            .gp(gp),        //Gray Pixel density
            .MD_THRESHOLD(MD_THRESHOLD), //Match Detection threshold
            .LEARNING_FACTOR(LEARNING_FACTOR), //[7:0] Left Shift Value, [15:8] Right Shift Value
            .FG_THRESHOLD(FG_THRESHOLD),    // 16'hXXFF, XX determines the foreground threshold value
            .FGDM_THRESHOLD(FGDM_THRESHOLD), //ForeGround Detection Match threshold
            .mean1_up(mean1_up),        //Guassian 1 Mean Parameter
            .mean2_up(mean2_up),        //Gaussian 2 Mean Parameter
            .mean3_up(mean3_up),        //Gaussian 3 Mean Parameter        
            .sd1_up(sd1_up),        //Guassian 1 Standard Deviation Parameter  
            .sd2_up(sd2_up),        //Guassian 2 Standard Deviation Parameter    
            .sd3_up(sd3_up),        //Guassian 3 Standard Deviation Parameter
            .w1_up(w1_up),        //Guassian 1 Weight Parameter
            .w2_up(w2_up),        //Guassian 2 Weight Parameter
            .w3_up(w3_up),        //Guassian 3 Weight Parameter    
            .window_en_out(window_en_out),        //window of interest enable output
            .gp_out(gp_out),         //The original gray pixel    
            .is_fg(is_fg)                  //If 1 the Foreground is detected (and the gp_out contains Foreground) else the FG is not detected and gp_out is not FG
            );    
	// User logic ends

	endmodule
