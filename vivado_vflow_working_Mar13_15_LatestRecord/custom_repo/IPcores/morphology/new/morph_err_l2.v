/***************************************************
This module has a Latency = ((window_size + 1) / 2) * row_length + (window_size + 1) / 2
Author: Chenyan Liu
****************************************************/
module morph_err_l2 (
input wire reset,
input wire clk,
input wire data_enable_in, 
input wire Hblank_in, 
input wire Vblank_in, 
input wire spdif_in, 
input wire win_enable_in, 
input wire data_in,
output wire data_enable_out, 
output wire Hblank_out, 
output wire Vblank_out, 
output wire spdif_out, 
output wire win_enable_out, 
output wire data_out
);

parameter COUNTER_WIDTH = 32;
parameter window_width = 9, window_height = 9;
//parameter WINDOW0 = 9'b000010000, WINDOW1 = 9'b000111000, WINDOW2 = 9'b001111100, WINDOW3 = 9'b011111110, WINDOW4 = 9'b111111111;
//parameter WINDOW5 = 9'b011111110, WINDOW6 = 9'b001111100, WINDOW7 = 9'b000111000, WINDOW8 = 9'b000010000;      
parameter WINDOW0 = 9'b111111111, WINDOW1 = 9'b111111111, WINDOW2 = 9'b111111111, WINDOW3 = 9'b111111111, WINDOW4 = 9'b111111111;
parameter WINDOW5 = 9'b111111111, WINDOW6 = 9'b111111111, WINDOW7 = 9'b111111111, WINDOW8 = 9'b111111111;      

wire [window_width-1:0] window [window_height-1:0];
wire [5:0] buf_temp_in, buf_temp_out, buf0_in, buf0_out, buf1_in, buf1_out, buf2_in, buf2_out, buf3_in, buf3_out, buf4_in, buf4_out;
wire [5:0] buf5_in, buf5_out, buf6_in, buf6_out, buf7_in, buf7_out, buf8_in, buf8_out, copy_in, copy_out;
wire wr_en_buf0, wr_en_buf1, wr_en_buf2, wr_en_buf3, wr_en_buf4, wr_en_buf5, wr_en_buf6, wr_en_buf7, wr_en_buf8, wr_en_copy;
wire rd_en_buf0, rd_en_buf1, rd_en_buf2, rd_en_buf3, rd_en_buf4, rd_en_buf5, rd_en_buf6, rd_en_buf7, rd_en_buf8, rd_en_copy;
reg start_buf0, start_buf1, start_buf2, start_buf3, start_buf4, start_buf5, start_buf6, start_buf7, start_buf8, start_copy;
reg wr_en_buf_temp, rd_en_buf_temp;
reg [5:0] buf_temp_reg[1:0], buf0_reg[1:0], buf1_reg[1:0], buf2_reg[1:0], buf3_reg[1:0], buf4_reg[1:0], buf5_reg[1:0], buf6_reg[1:0], buf7_reg[1:0], buf8_reg[1:0], copy_reg[1:0];
reg [5:0] row00, row01, row02, row03, row04, row05, row06, row07, row08;
reg [5:0] row10, row11, row12, row13, row14, row15, row16, row17, row18;
reg [5:0] row20, row21, row22, row23, row24, row25, row26, row27, row28;
reg [5:0] row30, row31, row32, row33, row34, row35, row36, row37, row38;
reg [5:0] row40, row41, row42, row43, row44, row45, row46, row47, row48;
reg [5:0] row50, row51, row52, row53, row54, row55, row56, row57, row58;
reg [5:0] row60, row61, row62, row63, row64, row65, row66, row67, row68;
reg [5:0] row70, row71, row72, row73, row74, row75, row76, row77, row78;
reg [5:0] row80, row81, row82, row83, row84, row85, row86, row87, row88;
reg [5:0] row_copy0, row_copy1, row_copy2, row_copy3, row_copy4, row_copy5, row_copy6, row_copy7, row_copy8;
     
reg [window_width-1:0] morph_temp0, morph_temp1, morph_temp2, morph_temp3, morph_temp4, morph_temp5, morph_temp6, morph_temp7, morph_temp8;
reg [window_width-1:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;
reg del, del0, del1, del2, del3, del4, del5, del6, del7, del8, morph_copy;
reg [15:0] DELAY;
reg [15:0] row_length;
reg row_length_enable, catch, row_ready;


assign window[0] = WINDOW0; 
assign window[1] = WINDOW1;
assign window[2] = WINDOW2;
assign window[3] = WINDOW3;
assign window[4] = WINDOW4;
assign window[5] = WINDOW5;
assign window[6] = WINDOW6;
assign window[7] = WINDOW7;
assign window[8] = WINDOW8; 


//////////////////////////////////////////////////buf_temp: calculate the row length, and assign the DELAY to FIFOs
assign buf_temp_in = {data_enable_in, Hblank_in, Vblank_in, spdif_in, win_enable_in, data_in};
  
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
            if (data_enable_in == 1)              
              begin
                if (row_ready == 0)
                  begin
                    if (catch == 0)
                      begin
                        wr_en_buf_temp <= 1;                    
                      end
                    row_length <= row_length + 1;
                    catch <= data_enable_in;
                  end                
                else if (row_ready == 1)
                  begin
                    DELAY <= row_length - (window_width + 2);
                    rd_en_buf_temp <= 1;
                    row_length_enable <= 1;
                  end
              end
            else if (data_enable_in == 0)
              begin
                if (row_length != 0)
                  begin               
                    row_length <= row_length + 1;                
                    catch <= data_enable_in;
                    row_ready <= 1;
                  end
              end
          end                  
                           
        buf_temp_reg[0] <= buf_temp_in;
        buf_temp_reg[1] <= buf_temp_reg[0]; 
      end
 end	
  
morphology_fifo buf_temp(
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
//assign buf0_in = {data_enable_in, Hblank_in, Vblank_in, spdif_in, win_enable_in, data_in};

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf0 <=0;
      end	
    else
      begin 
        if ((buf0_in[5] == 1) && (start_buf0 == 0))
          begin
            start_buf0 <= 1;
          end
        buf0_reg[0] <= buf0_in;
        row00 <= buf0_reg[0];
        row01 <= row00;
        row02 <= row01;
        row03 <= row02;
        row04 <= row03;
        row05 <= row04;
        row06 <= row05;
        row07 <= row06;
        row08 <= row07;
        buf0_reg[1] <= row08; 
        morph_temp0 <= {row08[0], row07[0], row06[0], row05[0], row04[0], row03[0], row02[0], row01[0], row00[0]};
      end
	end	

morphology_fifo buf0(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf0_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf0), // input wr_en
  .rd_en(rd_en_buf0), // input rd_en
  .dout(buf0_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
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
        if ((buf1_in[5] == 1) && (start_buf1 == 0))
          begin
            start_buf1 <= 1;
          end
        buf1_reg[0] <= buf1_in;
        row10 <= buf1_reg[0];
        row11 <= row10;
        row12 <= row11;
        row13 <= row12;
        row14 <= row13;
        row15 <= row14;
        row16 <= row15;
        row17 <= row16;
        row18 <= row17;
        buf1_reg[1] <= row18; 
        morph_temp1 <= {row18[0], row17[0], row16[0], row15[0], row14[0], row13[0], row12[0], row11[0], row10[0]};
      end
	end
	
morphology_fifo buf1(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf1_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf1), // input wr_en
  .rd_en(rd_en_buf1), // input rd_en
  .dout(buf1_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
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
        if ((buf2_in[5] == 1) && (start_buf2 == 0))
          begin
            start_buf2 <= 1;
          end
        buf2_reg[0] <= buf2_in;
        row20 <= buf2_reg[0];
        row21 <= row20;
        row22 <= row21;
        row23 <= row22;
        row24 <= row23;
        row25 <= row24;
        row26 <= row25;
        row27 <= row26;
        row28 <= row27;
        buf2_reg[1] <= row28; 
        morph_temp2 <= {row28[0], row27[0], row26[0], row25[0], row24[0], row23[0], row22[0], row21[0], row20[0]};   
      end
	end
	
morphology_fifo buf2(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf2_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf2), // input wr_en
  .rd_en(rd_en_buf2), // input rd_en
  .dout(buf2_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf2_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf2),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf2),
.rd_en(rd_en_buf2)
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
        if ((buf3_in[5] == 1) && (start_buf3 == 0))
          begin
            start_buf3 <= 1;
          end
        buf3_reg[0] <= buf3_in;
        row30 <= buf3_reg[0];
        row31 <= row30;
        row32 <= row31;
        row33 <= row32;
        row34 <= row33;
        row35 <= row34;
        row36 <= row35;
        row37 <= row36;
        row38 <= row37;
        buf3_reg[1] <= row38; 
        morph_temp3 <= {row38[0], row37[0], row36[0], row35[0], row34[0], row33[0], row32[0], row31[0], row30[0]};
      end
	end
	
morphology_fifo buf3(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf3_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf3), // input wr_en
  .rd_en(rd_en_buf3), // input rd_en
  .dout(buf3_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
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
        if ((buf4_in[5] == 1) && (start_buf4 == 0))
          begin
            start_buf4 <= 1;
          end
        buf4_reg[0] <= buf4_in;
        row40 <= buf4_reg[0];
        row41 <= row40;
        row42 <= row41;
        row43 <= row42;
        row44 <= row43;
        row45 <= row44;
        row46 <= row45;
        row47 <= row46;
        row48 <= row47;
        buf4_reg[1] <= row48; 
        morph_temp4 <= {row48[0], row47[0], row46[0], row45[0], row44[0], row43[0], row42[0], row41[0], row40[0]};
      end
	end
	
morphology_fifo buf4(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf4_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf4), // input wr_en
  .rd_en(rd_en_buf4), // input rd_en
  .dout(buf4_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf4_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf4),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf4),
.rd_en(rd_en_buf4)
);


////////////////////////////////////////////////////////////copy

assign copy_in = buf3_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_copy <= 0;
      end	
    else
      begin 
        if ((copy_in[5] == 1) && (start_copy == 0))
          begin
            start_copy <= 1;
          end
        copy_reg[0] <= copy_in;
        row_copy0 <= copy_reg[0];
        row_copy1 <= row_copy0;
        row_copy2 <= row_copy1;
        row_copy3 <= row_copy2;
        row_copy4 <= row_copy3;
        row_copy5 <= row_copy4;
        row_copy6[5:1] <= row_copy5[5:1];
        row_copy6[0] <= morph_copy;
        row_copy7 <= row_copy6;
        row_copy8 <= row_copy7;
        copy_reg[1] <= row_copy8; 
      end
	end
	
morphology_fifo buf_copy(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(copy_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_copy), // input wr_en
  .rd_en(rd_en_copy), // input rd_en
  .dout(copy_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf_copy_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_copy),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_copy),
.rd_en(rd_en_copy)
);

/************************* output connection ********************************/

assign data_enable_out = copy_out[5];
assign Hblank_out = copy_out[4];
assign Vblank_out = copy_out[3];
assign spdif_out = copy_out[2];
assign win_enable_out = copy_out[1];
assign data_out = copy_out[0];


////////////////////////////////////////////////buf5

assign buf5_in = buf4_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf5 <=0;
      end	
    else
      begin 
        if ((buf5_in[5] == 1) && (start_buf5 == 0))
          begin
            start_buf5 <= 1;
          end
        buf5_reg[0] <= buf5_in;
        row50 <= buf5_reg[0];
        row51 <= row50;
        row52 <= row51;
        row53 <= row52;
        row54 <= row53;
        row55 <= row54;
        row56 <= row55;
        row57 <= row56;
        row58 <= row57;
        buf5_reg[1] <= row58; 
        morph_temp5 <= {row58[0], row57[0], row56[0], row55[0], row54[0], row53[0], row52[0], row51[0], row50[0]};
      end
	end
	
morphology_fifo buf5(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf5_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf5), // input wr_en
  .rd_en(rd_en_buf5), // input rd_en
  .dout(buf5_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf5_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf5),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf5),
.rd_en(rd_en_buf5)
);



//////////////////////////////////////////////buf6

assign buf6_in = buf5_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf6 <=0;
      end	
    else
      begin 
        if ((buf6_in[5] == 1) && (start_buf6 == 0))
          begin
            start_buf6 <= 1;
          end
        buf6_reg[0] <= buf6_in;
        row60 <= buf6_reg[0];
        row61 <= row60;
        row62 <= row61;
        row63 <= row62;
        row64 <= row63;
        row65 <= row64;
        row66 <= row65;
        row67 <= row66;
        row68 <= row67;
        buf6_reg[1] <= row68; 
        morph_temp6 <= {row68[0], row67[0], row66[0], row65[0], row64[0], row63[0], row62[0], row61[0], row60[0]};
      end
	end
	
morphology_fifo buf6(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf6_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf6), // input wr_en
  .rd_en(rd_en_buf6), // input rd_en
  .dout(buf6_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);

morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf6_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf6),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf6),
.rd_en(rd_en_buf6)
);



//////////////////////////////////////////////buf7

assign buf7_in = buf6_out;

always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf7 <=0;
      end	
    else
      begin 
        if ((buf7_in[5] == 1) && (start_buf7 == 0))
          begin
            start_buf7 <= 1;
          end
        buf7_reg[0] <= buf7_in;
        row70 <= buf7_reg[0];
        row71 <= row70;
        row72 <= row71;
        row73 <= row72;
        row74 <= row73;
        row75 <= row74;
        row76 <= row75;
        row77 <= row76;
        row78 <= row77;
        buf7_reg[1] <= row78; 
        morph_temp7 <= {row78[0], row77[0], row76[0], row75[0], row74[0], row73[0], row72[0], row71[0], row70[0]};
      end
	end
	
morphology_fifo buf7(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf7_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf7), // input wr_en
  .rd_en(rd_en_buf7), // input rd_en
  .dout(buf7_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf7_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf7),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf7),
.rd_en(rd_en_buf7)
);



//////////////////////////////////////////buf8

assign buf8_in = buf7_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf8 <=0;
      end	
    else
      begin 
        if ((buf8_in[5] == 1) && (start_buf8 == 0))
          begin
            start_buf8 <= 1;
          end
        buf8_reg[0] <= buf8_in;
        row80 <= buf8_reg[0];
        row81 <= row80;
        row82 <= row81;
        row83 <= row82;
        row84 <= row83;
        row85 <= row84;
        row86 <= row85;
        row87 <= row86;
        row88 <= row87;
        buf8_reg[1] <= row88; 
        morph_temp8 <= {row88[0], row87[0], row86[0], row85[0], row84[0], row83[0], row82[0], row81[0], row80[0]};
      end
	end
	
morphology_fifo buf8(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf8_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf8), // input wr_en
  .rd_en(rd_en_buf8), // input rd_en
  .dout(buf8_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf8_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf8),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf8),
.rd_en(rd_en_buf8)
);


/**************************** Morph operations ***************************/
//always @(posedge clk)
always @(*)
  begin
    if (reset == 1)
      begin
        morph_copy = 0;
      end    
    else if (reset == 0)
      begin
        temp0 = morph_temp0 & window[0];
        temp1 = morph_temp1 & window[1];
        temp2 = morph_temp2 & window[2];
        temp3 = morph_temp3 & window[3];
        temp4 = morph_temp4 & window[4];
        temp5 = morph_temp5 & window[5];
        temp6 = morph_temp6 & window[6];
        temp7 = morph_temp7 & window[7];
        temp8 = morph_temp8 & window[8];
        
///////// 9*9 erosion, all "1"        
//        del0 = (temp0[4]);
//        del1 = (temp1[3] & temp1[4] & temp1[5]);
//        del2 = (temp2[2] & temp2[3] & temp2[4] & temp2[5] & temp2[6]);
//        del3 = (temp3[1] & temp3[2] & temp3[3] & temp3[4] & temp3[5] & temp3[6] & temp3[7]);
//        del4 = (temp4[0] & temp4[1] & temp4[2] & temp4[3] & temp4[4] & temp4[5] & temp4[6] & temp4[7] & temp4[8]);
//        del5 = (temp5[1] & temp5[2] & temp5[3] & temp5[4] & temp5[5] & temp5[6] & temp5[7]);
//        del6 = (temp6[2] & temp6[3] & temp6[4] & temp6[5] & temp6[6]);
//        del7 = (temp7[3] & temp7[4] & temp7[5]);
//        del8 = (temp8[4]);
//        del = (del0 & del1 & del2 & del3 & del4 & del5 & del6 & del7 & del8);

///////// 5*5 erosion, all "1"        
        del2 = (temp2[4]);
        del3 = (temp3[3] & temp3[4] & temp3[5]);
        del4 = (temp4[2] & temp4[3] & temp4[4] & temp4[5] & temp4[6]);
        del5 = (temp5[3] & temp5[4] & temp5[5]);
        del6 = (temp6[4]);
        del = (del2 & del3 & del4 & del5 & del6);


/////////// 9*9 erosion, cross        
//        del0 = (temp0[4]);
//        del1 = (temp1[3] & temp1[5]);
//        del2 = (temp2[2] & temp2[6]);
//        del3 = (temp3[1] & temp3[7]);
//        del4 = (temp4[0] & temp4[4] & temp4[8]);
//        del5 = (temp5[1] & temp5[7]);
//        del6 = (temp6[2] & temp6[6]);
//        del7 = (temp7[3] & temp7[5]);
//        del8 = (temp8[4]);
//        del = (del0 & del1 & del2 & del3 & del4 & del5 & del6 & del7 & del8);


///////// 7*7 erosion, cross        
//        del1 = (temp1[4]);
//        del2 = (temp2[3] & temp2[5]);
//        del3 = (temp3[2] & temp3[6]);
//        del4 = (temp4[1] & temp4[4] & temp4[7]);
//        del5 = (temp5[2] & temp5[6]);
//        del6 = (temp6[3] & temp6[5]);
//        del7 = (temp7[4]);        
//        del = (del1 & del2 & del3 & del4 & del5 & del6 & del7);
        
        if (del == 1)
          morph_copy = 1;
        else
          morph_copy = 0;     
      end
  end

endmodule