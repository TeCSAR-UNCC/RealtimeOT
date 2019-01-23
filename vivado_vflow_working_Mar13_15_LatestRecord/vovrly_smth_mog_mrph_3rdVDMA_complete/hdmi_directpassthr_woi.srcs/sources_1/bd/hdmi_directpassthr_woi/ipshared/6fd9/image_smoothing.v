/***************************************************
This module has a Latency = ((window_size + 1) / 2) * row_length + (window_size + 1) / 2
Author: Chenyan Liu
****************************************************/
module image_smoothing (
input wire reset,
input wire clk,
input wire de_in, 
input wire Hblank_in, 
input wire Vblank_in, 
input wire spdif_in, 
input wire win_enable_in, 
input wire [15:0] data_in,
output wire de_out, 
output wire Hblank_out, 
output wire Vblank_out, 
output wire spdif_out, 
output wire win_enable_out, 
output wire [15:0] data_out
);

parameter COUNTER_WIDTH = 32;
//parameter DELAY = 23; 

wire [20:0] buf_temp_in, buf_temp_out, buf0_in, buf0_out, buf1_in, buf1_out, buf2_in, buf2_out, buf3_in, buf3_out, buf4_in, buf4_out, copy_in, copy_out;
wire wr_en_buf0, wr_en_buf1, wr_en_buf2, wr_en_buf3, wr_en_buf4, wr_en_copy;
wire rd_en_buf0, rd_en_buf1, rd_en_buf2, rd_en_buf3, rd_en_buf4, rd_en_copy;
reg start_buf0, start_buf1, start_buf2, start_buf3, start_buf4, start_copy;
reg wr_en_buf_temp, rd_en_buf_temp;
reg [20:0] buf_temp_reg[1:0], buf0_reg[1:0], buf1_reg[1:0], buf2_reg[1:0], buf3_reg[1:0], buf4_reg[1:0], copy_reg[1:0];
reg [20:0] row00, row01, row02, row03, row04;
reg [20:0] row10, row11, row12, row13, row14;
reg [20:0] row20, row21, row22, row23, row24;
reg [20:0] row30, row31, row32, row33, row34;
reg [20:0] row40, row41, row42, row43, row44;
reg [20:0] row_copy0, row_copy1, row_copy2, row_copy3, row_copy4;
reg [7:0] matrix00, matrix01, matrix02, matrix03, matrix04; 
reg [7:0] matrix10, matrix11, matrix12, matrix13, matrix14;
reg [7:0] matrix20, matrix21, matrix22, matrix23, matrix24;
reg [7:0] matrix30, matrix31, matrix32, matrix33, matrix34;
reg [7:0] matrix40, matrix41, matrix42, matrix43, matrix44; 
reg [7:0] temp00, temp01, temp02, temp03, temp04; 
reg [7:0] temp10, temp11, temp12, temp13, temp14;
reg [7:0] temp20, temp21, temp22, temp23, temp24;
reg [7:0] temp30, temp31, temp32, temp33, temp34;
reg [7:0] temp40, temp41, temp42, temp43, temp44;       
reg [7:0] del0, del1, del2, del3, del4, smooth_copy;

reg [15:0] DELAY;
reg [15:0] row_length;
reg row_length_enable, catch, row_ready;


//////////////////////////////////////////////////buf_temp: calculate the row length, and assign the DELAY to FIFOs
assign buf_temp_in = {de_in, Hblank_in, Vblank_in, spdif_in, win_enable_in, data_in};
  
always@(posedge clk)
  begin
    if (reset == 1)
      begin
  	    row_length_enable <= 0;
  	    row_length <= 0;
  	    row_ready <= 0;
  	    catch <= 0;
  	    wr_en_buf_temp <= 0;
  	    rd_en_buf_temp <= 0;
  	    DELAY <= 1024;
      end	
    else if (reset == 0)
      begin        
        if (row_length_enable == 0)
          begin
            if (de_in == 1)              
              begin
                if (row_ready == 0)
                  begin
                    if (catch == 0)
                      begin
                        wr_en_buf_temp <= 1;                    
                      end
                    row_length <= row_length + 1;
                    catch <= de_in;
                  end                
                else if (row_ready == 1)
                  begin
                    DELAY <= row_length - 7;
                    rd_en_buf_temp <= 1;
                    row_length_enable <= 1;
                  end
              end
            else if (de_in == 0)
              begin
                if (row_length != 0)
                  begin               
                    row_length <= row_length + 1;                
                    catch <= de_in;
                    row_ready <= 1;
                  end
              end
          end                  
                           
        buf_temp_reg[0] <= buf_temp_in;
        buf_temp_reg[1] <= buf_temp_reg[0]; 
      end
 end	
  
smoothing_fifo buf_temp(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf_temp_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf_temp), // input wr_en
  .rd_en(rd_en_buf_temp), // input rd_en
  .dout(buf_temp_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
  
  
//////////////////////////////////////////////////buf0
assign buf0_in = buf_temp_out;
//assign buf0_in = {de_in, Hblank_in, Vblank_in, spdif_in, win_enable_in, data_in};

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf0 <=0;
      end	
    else
      begin 
        if ((buf0_in[20] == 1) && (start_buf0 == 0))
          begin
            start_buf0 <= 1;
          end
        buf0_reg[0] <= buf0_in;
        row00 <= buf0_reg[0];
        row01 <= row00;
        row02 <= row01;
        row03 <= row02;
        row04 <= row03;             
        buf0_reg[1] <= row04; 
        matrix00 <= row00[15:8];
        matrix01 <= row01[15:8];
        matrix02 <= row02[15:8];
        matrix03 <= row03[15:8];
        matrix04 <= row04[15:8];
      end
	end	

smoothing_fifo buf0(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf0_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf0), // input wr_en
  .rd_en(rd_en_buf0), // input rd_en
  .dout(buf0_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf0_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf0),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf0),
.rd_en(rd_en_buf0)
);


/////////////////////////////////////////////////////////buf1

assign buf1_in = buf0_out; 

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf1 <=0;
      end	
    else
      begin 
        if ((buf1_in[20] == 1) && (start_buf1 == 0))
          begin
            start_buf1 <= 1;
          end
        buf1_reg[0] <= buf1_in;
        row10 <= buf1_reg[0];
        row11 <= row10;
        row12 <= row11;
        row13 <= row12;
        row14 <= row13;
        buf1_reg[1] <= row14; 
        matrix10 <= row10[15:8];
        matrix11 <= row11[15:8];
        matrix12 <= row12[15:8];
        matrix13 <= row13[15:8];
        matrix14 <= row14[15:8];
      end
	end
	
smoothing_fifo buf1(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf1_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf1), // input wr_en
  .rd_en(rd_en_buf1), // input rd_en
  .dout(buf1_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf1_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf1),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf1),
.rd_en(rd_en_buf1)
);


///////////////////////////////////////////////////////////////////////////////buf2

assign buf2_in = buf1_out; 

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf2 <=0;
      end	
    else
      begin 
        if ((buf2_in[20] == 1) && (start_buf2 == 0))
          begin
            start_buf2 <= 1;
          end
        buf2_reg[0] <= buf2_in;
        row20 <= buf2_reg[0];
        row21 <= row20;
        row22 <= row21;
        row23 <= row22;
        row24 <= row23;
        buf2_reg[1] <= row24; 
        matrix20 <= row20[15:8];
        matrix21 <= row21[15:8];
        matrix22 <= row22[15:8];
        matrix23 <= row23[15:8];
        matrix24 <= row24[15:8];   
      end
	end
	
smoothing_fifo buf2(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf2_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf2), // input wr_en
  .rd_en(rd_en_buf2), // input rd_en
  .dout(buf2_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf2_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf2),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf2),
.rd_en(rd_en_buf2)
);


////////////////////////////////////////////////////////////copy

assign copy_in = buf1_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_copy <= 0;
      end	
    else
      begin 
        if ((copy_in[20] == 1) && (start_copy == 0))
          begin
            start_copy <= 1;
          end
        copy_reg[0] <= copy_in;
        row_copy0 <= copy_reg[0];
        row_copy1 <= row_copy0;
        row_copy2 <= row_copy1;
        row_copy3 <= row_copy2;
        row_copy4[20:16] <= row_copy3[20:16];
        row_copy4[7:0] <= row_copy3[7:0];
        row_copy4[15:8] <= smooth_copy;       
        copy_reg[1] <= row_copy4; 
      end
	end
	
smoothing_fifo buf_copy(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(copy_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_copy), // input wr_en
  .rd_en(rd_en_copy), // input rd_en
  .dout(copy_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf_copy_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_copy),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_copy),
.rd_en(rd_en_copy)
);

 
///////////////////////////////////////////////////////////////buf3

assign buf3_in = buf2_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf3 <=0;
      end	
    else
      begin 
        if ((buf3_in[20] == 1) && (start_buf3 == 0))
          begin
            start_buf3 <= 1;
          end
        buf3_reg[0] <= buf3_in;
        row30 <= buf3_reg[0];
        row31 <= row30;
        row32 <= row31;
        row33 <= row32;
        row34 <= row33;
        buf3_reg[1] <= row34; 
        matrix30 <= row30[15:8];
        matrix31 <= row31[15:8];
        matrix32 <= row32[15:8];
        matrix33 <= row33[15:8];
        matrix34 <= row34[15:8];
      end
	end
	
smoothing_fifo buf3(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf3_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf3), // input wr_en
  .rd_en(rd_en_buf3), // input rd_en
  .dout(buf3_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf3_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf3),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf3),
.rd_en(rd_en_buf3)
);

////////////////////////////////////////////////////////////buf4

assign buf4_in = buf3_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf4 <=0;
      end	
    else
      begin 
        if ((buf4_in[20] == 1) && (start_buf4 == 0))
          begin
            start_buf4 <= 1;
          end
        buf4_reg[0] <= buf4_in;
        row40 <= buf4_reg[0];
        row41 <= row40;
        row42 <= row41;
        row43 <= row42;
        row44 <= row43;
        buf4_reg[1] <= row44; 
        matrix40 <= row40[15:8];
        matrix41 <= row41[15:8];
        matrix42 <= row42[15:8];
        matrix43 <= row43[15:8];
        matrix44 <= row44[15:8];
      end
	end
	
smoothing_fifo buf4(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf4_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf4), // input wr_en
  .rd_en(rd_en_buf4), // input rd_en
  .dout(buf4_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
init_fifo_wr_rd_controller_smooth #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf4_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf4),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf4),
.rd_en(rd_en_buf4)
);

/************************* output connection ********************************/

assign de_out = copy_out[20];
assign Hblank_out = copy_out[19];
assign Vblank_out = copy_out[18];
assign spdif_out = copy_out[17];
assign win_enable_out = copy_out[16];
assign data_out = copy_out[15:0];

/**************************** Morph operations ***************************/
always @(*)
  begin
    if (reset == 1)
      begin
        smooth_copy = 0;
      end    
    else if (reset == 0)
      begin
        temp00 = (matrix00 >> 6);
        temp01 = (matrix01 >> 6);
        temp02 = (matrix02 >> 5);
        temp03 = (matrix03 >> 6);
        temp04 = (matrix04 >> 6);
        temp10 = (matrix10 >> 5);
        temp11 = (matrix11 >> 4);
        temp12 = (matrix12 >> 4);
        temp13 = (matrix13 >> 4);
        temp14 = (matrix14 >> 5);
        temp20 = (matrix20 >> 5);
        temp21 = (matrix21 >> 4);
        temp22 = (matrix22 >> 3);
        temp23 = (matrix23 >> 4);
        temp24 = (matrix24 >> 5);
        temp30 = (matrix30 >> 5);
        temp31 = (matrix31 >> 4);
        temp32 = (matrix32 >> 4);
        temp33 = (matrix33 >> 4);
        temp34 = (matrix34 >> 5);
        temp40 = (matrix40 >> 6);
        temp41 = (matrix41 >> 6);
        temp42 = (matrix42 >> 5);
        temp43 = (matrix43 >> 6);
        temp44 = (matrix44 >> 6);
        
        
        del0 = (temp00 + temp01 + temp02 + temp03 + temp04);
        del1 = (temp10 + temp11 + temp12 + temp13 + temp14);
        del2 = (temp20 + temp21 + temp22 + temp23 + temp24);
        del3 = (temp30 + temp31 + temp32 + temp33 + temp34);
        del4 = (temp40 + temp41 + temp42 + temp43 + temp44);

        smooth_copy = (del0 + del1 + del2 + del3 + del4);           
           
      end
  end

endmodule
