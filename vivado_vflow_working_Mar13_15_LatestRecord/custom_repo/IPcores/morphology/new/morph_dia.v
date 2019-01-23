/***************************************************
This module has a Latency = ((window_size + 1) / 2) * row_length + (window_size + 1) / 2
Author: Chenyan Liu
****************************************************/
module morph_dia (
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
parameter window_width = 15, window_height = 15;
//parameter WINDOW0 = 15'b000000010000000, WINDOW1 = 15'b000000111000000, WINDOW2 = 15'b000001111100000, WINDOW3 = 15'b000011111110000, WINDOW4 = 15'b000111111111000;
//parameter WINDOW5 = 15'b001111111111100, WINDOW6 = 15'b011111111111110, WINDOW7 = 15'b111111111111111, WINDOW8 = 15'b011111111111110, WINDOW9 = 15'b001111111111100;   
//parameter WINDOW10 = 15'b000111111111000, WINDOW11 = 15'b000011111110000, WINDOW12 = 15'b000001111100000, WINDOW13 = 15'b000000111000000, WINDOW14 = 15'b000000010000000;    
parameter WINDOW0 = 15'b111111111111111, WINDOW1 = 15'b111111111111111, WINDOW2 = 15'b111111111111111, WINDOW3 = 15'b111111111111111, WINDOW4 = 15'b111111111111111;
parameter WINDOW5 = 15'b111111111111111, WINDOW6 = 15'b111111111111111, WINDOW7 = 15'b111111111111111, WINDOW8 = 15'b111111111111111, WINDOW9 = 15'b111111111111111;   
parameter WINDOW10 = 15'b111111111111111, WINDOW11 = 15'b111111111111111, WINDOW12 = 15'b111111111111111, WINDOW13 = 15'b111111111111111, WINDOW14 = 15'b111111111111111;   

wire [window_width-1:0] window [window_height-1:0];
wire [5:0] buf_temp_in, buf_temp_out, buf0_in, buf0_out, buf1_in, buf1_out, buf2_in, buf2_out, buf3_in, buf3_out, buf4_in, buf4_out;
wire [5:0] buf5_in, buf5_out, buf6_in, buf6_out, buf7_in, buf7_out, buf8_in, buf8_out, copy_in, copy_out;
wire [5:0] buf9_in, buf9_out, buf10_in, buf10_out, buf11_in, buf11_out, buf12_in, buf12_out, buf13_in, buf13_out, buf14_in, buf14_out; 
wire wr_en_buf0, wr_en_buf1, wr_en_buf2, wr_en_buf3, wr_en_buf4, wr_en_buf5, wr_en_buf6, wr_en_buf7, wr_en_buf8, wr_en_buf9, wr_en_buf10, wr_en_buf11, wr_en_buf12, wr_en_buf13, wr_en_buf14, wr_en_copy;
wire rd_en_buf0, rd_en_buf1, rd_en_buf2, rd_en_buf3, rd_en_buf4, rd_en_buf5, rd_en_buf6, rd_en_buf7, rd_en_buf8, rd_en_buf9, rd_en_buf10, rd_en_buf11, rd_en_buf12, rd_en_buf13, rd_en_buf14, rd_en_copy;
reg start_buf0, start_buf1, start_buf2, start_buf3, start_buf4, start_buf5, start_buf6, start_buf7, start_buf8, start_buf9, start_buf10, start_buf11, start_buf12, start_buf13, start_buf14, start_copy;
reg wr_en_buf_temp, rd_en_buf_temp;
reg [5:0] buf_temp_reg[1:0], buf0_reg[1:0], buf1_reg[1:0], buf2_reg[1:0], buf3_reg[1:0], buf4_reg[1:0], buf5_reg[1:0], buf6_reg[1:0], buf7_reg[1:0], buf8_reg[1:0], copy_reg[1:0];
reg [5:0] buf9_reg[1:0], buf10_reg[1:0], buf11_reg[1:0], buf12_reg[1:0], buf13_reg[1:0], buf14_reg[1:0];
reg [5:0] row0000, row0001, row0002, row0003, row0004, row0005, row0006, row0007, row0008, row0009, row0010, row0011, row0012, row0013, row0014;
reg [5:0] row0100, row0101, row0102, row0103, row0104, row0105, row0106, row0107, row0108, row0109, row0110, row0111, row0112, row0113, row0114;
reg [5:0] row0200, row0201, row0202, row0203, row0204, row0205, row0206, row0207, row0208, row0209, row0210, row0211, row0212, row0213, row0214;
reg [5:0] row0300, row0301, row0302, row0303, row0304, row0305, row0306, row0307, row0308, row0309, row0310, row0311, row0312, row0313, row0314;
reg [5:0] row0400, row0401, row0402, row0403, row0404, row0405, row0406, row0407, row0408, row0409, row0410, row0411, row0412, row0413, row0414;
reg [5:0] row0500, row0501, row0502, row0503, row0504, row0505, row0506, row0507, row0508, row0509, row0510, row0511, row0512, row0513, row0514;
reg [5:0] row0600, row0601, row0602, row0603, row0604, row0605, row0606, row0607, row0608, row0609, row0610, row0611, row0612, row0613, row0614;
reg [5:0] row0700, row0701, row0702, row0703, row0704, row0705, row0706, row0707, row0708, row0709, row0710, row0711, row0712, row0713, row0714;
reg [5:0] row0800, row0801, row0802, row0803, row0804, row0805, row0806, row0807, row0808, row0809, row0810, row0811, row0812, row0813, row0814;
reg [5:0] row0900, row0901, row0902, row0903, row0904, row0905, row0906, row0907, row0908, row0909, row0910, row0911, row0912, row0913, row0914;
reg [5:0] row1000, row1001, row1002, row1003, row1004, row1005, row1006, row1007, row1008, row1009, row1010, row1011, row1012, row1013, row1014;
reg [5:0] row1100, row1101, row1102, row1103, row1104, row1105, row1106, row1107, row1108, row1109, row1110, row1111, row1112, row1113, row1114;
reg [5:0] row1200, row1201, row1202, row1203, row1204, row1205, row1206, row1207, row1208, row1209, row1210, row1211, row1212, row1213, row1214;
reg [5:0] row1300, row1301, row1302, row1303, row1304, row1305, row1306, row1307, row1308, row1309, row1310, row1311, row1312, row1313, row1314;
reg [5:0] row1400, row1401, row1402, row1403, row1404, row1405, row1406, row1407, row1408, row1409, row1410, row1411, row1412, row1413, row1414;
reg [5:0] row_copy0, row_copy1, row_copy2, row_copy3, row_copy4, row_copy5, row_copy6, row_copy7, row_copy8, row_copy9, row_copy10, row_copy11, row_copy12, row_copy13, row_copy14;
     
reg [window_width-1:0] morph_temp0, morph_temp1, morph_temp2, morph_temp3, morph_temp4, morph_temp5, morph_temp6, morph_temp7, morph_temp8, morph_temp9, morph_temp10, morph_temp11, morph_temp12, morph_temp13, morph_temp14;
reg [window_width-1:0] temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8, temp9, temp10, temp11, temp12, temp13, temp14;
reg del, del0, del1, del2, del3, del4, del5, del6, del7, del8, del9, del10, del11, del12, del13, del14, morph_copy;
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
assign window[9] = WINDOW9;
assign window[10] = WINDOW10;
assign window[11] = WINDOW11;
assign window[12] = WINDOW12;
assign window[13] = WINDOW13;
assign window[14] = WINDOW14; 


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
        row0000 <= buf0_reg[0];
        row0001 <= row0000;
        row0002 <= row0001;
        row0003 <= row0002;
        row0004 <= row0003;
        row0005 <= row0004;
        row0006 <= row0005;
        row0007 <= row0006;
        row0008 <= row0007;
        row0009 <= row0008;
        row0010 <= row0009;
        row0011 <= row0010;
        row0012 <= row0011;
        row0013 <= row0012;
        row0014 <= row0013;
        buf0_reg[1] <= row0014; 
        morph_temp0 <= {row0014[0], row0013[0], row0012[0], row0011[0], row0010[0], row0009[0], row0008[0], row0007[0], row0006[0], row0005[0], row0004[0], row0003[0], row0002[0], row0001[0], row0000[0]};
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
        row0100 <= buf1_reg[0];
        row0101 <= row0100;
        row0102 <= row0101;
        row0103 <= row0102;
        row0104 <= row0103;
        row0105 <= row0104;
        row0106 <= row0105;
        row0107 <= row0106;
        row0108 <= row0107;
        row0109 <= row0108;
        row0110 <= row0109;
        row0111 <= row0110;
        row0112 <= row0111;
        row0113 <= row0112;
        row0114 <= row0113;
        buf1_reg[1] <= row0114; 
        morph_temp1 <= {row0114[0], row0113[0], row0112[0], row0111[0], row0110[0], row0109[0], row0108[0], row0107[0], row0106[0], row0105[0], row0104[0], row0103[0], row0102[0], row0101[0], row0100[0]};
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
        row0200 <= buf2_reg[0];
        row0201 <= row0200;
        row0202 <= row0201;
        row0203 <= row0202;
        row0204 <= row0203;
        row0205 <= row0204;
        row0206 <= row0205;
        row0207 <= row0206;
        row0208 <= row0207;
        row0209 <= row0208;
        row0210 <= row0209;
        row0211 <= row0210;
        row0212 <= row0211;
        row0213 <= row0212;
        row0214 <= row0213;
        buf2_reg[1] <= row0214; 
        morph_temp2 <= {row0214[0], row0213[0], row0212[0], row0211[0], row0210[0], row0209[0], row0208[0], row0207[0], row0206[0], row0205[0], row0204[0], row0203[0], row0202[0], row0201[0], row0200[0]};   
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
        row0300 <= buf3_reg[0];
        row0301 <= row0300;
        row0302 <= row0301;
        row0303 <= row0302;
        row0304 <= row0303;
        row0305 <= row0304;
        row0306 <= row0305;
        row0307 <= row0306;
        row0308 <= row0307;
        row0309 <= row0308;
        row0310 <= row0309;
        row0311 <= row0310;
        row0312 <= row0311;
        row0313 <= row0312;
        row0314 <= row0313;
        buf3_reg[1] <= row0314;
        morph_temp3 <= {row0314[0], row0313[0], row0312[0], row0311[0], row0310[0], row0309[0], row0308[0], row0307[0], row0306[0], row0305[0], row0304[0], row0303[0], row0302[0], row0301[0], row0300[0]};
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
        row0400 <= buf4_reg[0];
        row0401 <= row0400;
        row0402 <= row0401;
        row0403 <= row0402;
        row0404 <= row0403;
        row0405 <= row0404;
        row0406 <= row0405;
        row0407 <= row0406;
        row0408 <= row0407;
        row0409 <= row0408;
        row0410 <= row0409;
        row0411 <= row0410;
        row0412 <= row0411;
        row0413 <= row0412;
        row0414 <= row0413;
        buf4_reg[1] <= row0414; 
        morph_temp4 <= {row0414[0], row0413[0], row0412[0], row0411[0], row0410[0], row0409[0], row0408[0], row0407[0], row0406[0], row0405[0], row0404[0], row0403[0], row0402[0], row0401[0], row0400[0]};
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
        row0500 <= buf5_reg[0];
        row0501 <= row0500;
        row0502 <= row0501;
        row0503 <= row0502;
        row0504 <= row0503;
        row0505 <= row0504;
        row0506 <= row0505;
        row0507 <= row0506;
        row0508 <= row0507;
        row0509 <= row0508;
        row0510 <= row0509;
        row0511 <= row0510;
        row0512 <= row0511;
        row0513 <= row0512;
        row0514 <= row0513;
        buf5_reg[1] <= row0514; 
        morph_temp5 <= {row0514[0], row0513[0], row0512[0], row0511[0], row0510[0], row0509[0], row0508[0], row0507[0], row0506[0], row0505[0], row0504[0], row0503[0], row0502[0], row0501[0], row0500[0]};
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
        row0600 <= buf6_reg[0];
        row0601 <= row0600;
        row0602 <= row0601;
        row0603 <= row0602;
        row0604 <= row0603;
        row0605 <= row0604;
        row0606 <= row0605;
        row0607 <= row0606;
        row0608 <= row0607;
        row0609 <= row0608;
        row0610 <= row0609;
        row0611 <= row0610;
        row0612 <= row0611;
        row0613 <= row0612;
        row0614 <= row0613;
        buf6_reg[1] <= row0614; 
        morph_temp6 <= {row0614[0], row0613[0], row0612[0], row0611[0], row0610[0], row0609[0], row0608[0], row0607[0], row0606[0], row0605[0], row0604[0], row0603[0], row0602[0], row0601[0], row0600[0]};
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
        row0700 <= buf7_reg[0];
        row0701 <= row0700;
        row0702 <= row0701;
        row0703 <= row0702;
        row0704 <= row0703;
        row0705 <= row0704;
        row0706 <= row0705;
        row0707 <= row0706;
        row0708 <= row0707;
        row0709 <= row0708;
        row0710 <= row0709;
        row0711 <= row0710;
        row0712 <= row0711;
        row0713 <= row0712;
        row0714 <= row0713;
        buf7_reg[1] <= row0714; 
        morph_temp7 <= {row0714[0], row0713[0], row0712[0], row0711[0], row0710[0], row0709[0], row0708[0], row0707[0], row0706[0], row0705[0], row0704[0], row0703[0], row0702[0], row0701[0], row0700[0]};
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



////////////////////////////////////////////////////buf8

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
        row0800 <= buf8_reg[0];
        row0801 <= row0800;
        row0802 <= row0801;
        row0803 <= row0802;
        row0804 <= row0803;
        row0805 <= row0804;
        row0806 <= row0805;
        row0807 <= row0806;
        row0808 <= row0807;
        row0809 <= row0808;
        row0810 <= row0809;
        row0811 <= row0810;
        row0812 <= row0811;
        row0813 <= row0812;
        row0814 <= row0813;
        buf8_reg[1] <= row0814; 
        morph_temp8 <= {row0814[0], row0813[0], row0812[0], row0811[0], row0810[0], row0809[0], row0808[0], row0807[0], row0806[0], row0805[0], row0804[0], row0803[0], row0802[0], row0801[0], row0800[0]};
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



////////////////////////////////////////////////////buf9

assign buf9_in = buf8_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf9 <=0;
      end	
    else
      begin 
        if ((buf9_in[5] == 1) && (start_buf9 == 0))
          begin
            start_buf9 <= 1;
          end
        buf9_reg[0] <= buf9_in;
        row0900 <= buf9_reg[0];
        row0901 <= row0900;
        row0902 <= row0901;
        row0903 <= row0902;
        row0904 <= row0903;
        row0905 <= row0904;
        row0906 <= row0905;
        row0907 <= row0906;
        row0908 <= row0907;
        row0909 <= row0908;
        row0910 <= row0909;
        row0911 <= row0910;
        row0912 <= row0911;
        row0913 <= row0912;
        row0914 <= row0913;
        buf9_reg[1] <= row0914; 
        morph_temp9 <= {row0914[0], row0913[0], row0912[0], row0911[0], row0910[0], row0909[0], row0908[0], row0907[0], row0906[0], row0905[0], row0904[0], row0903[0], row0902[0], row0901[0], row0900[0]};
      end
	end
	
morphology_fifo buf9(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf9_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf9), // input wr_en
  .rd_en(rd_en_buf9), // input rd_en
  .dout(buf9_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf9_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf9),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf9),
.rd_en(rd_en_buf9)
);



////////////////////////////////////////////////////buf10

assign buf10_in = buf9_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf10 <=0;
      end	
    else
      begin 
        if ((buf10_in[5] == 1) && (start_buf10 == 0))
          begin
            start_buf10 <= 1;
          end
        buf10_reg[0] <= buf10_in;
        row1000 <= buf10_reg[0];
        row1001 <= row1000;
        row1002 <= row1001;
        row1003 <= row1002;
        row1004 <= row1003;
        row1005 <= row1004;
        row1006 <= row1005;
        row1007 <= row1006;
        row1008 <= row1007;
        row1009 <= row1008;
        row1010 <= row1009;
        row1011 <= row1010;
        row1012 <= row1011;
        row1013 <= row1012;
        row1014 <= row1013;
        buf10_reg[1] <= row1014; 
        morph_temp10 <= {row1014[0], row1013[0], row1012[0], row1011[0], row1010[0], row1009[0], row1008[0], row1007[0], row1006[0], row1005[0], row1004[0], row1003[0], row1002[0], row1001[0], row1000[0]};
      end
	end
	
morphology_fifo buf10(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf10_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf10), // input wr_en
  .rd_en(rd_en_buf10), // input rd_en
  .dout(buf10_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf10_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf10),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf10),
.rd_en(rd_en_buf10)
);



////////////////////////////////////////////////////buf11

assign buf11_in = buf10_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf11 <=0;
      end	
    else
      begin 
        if ((buf11_in[5] == 1) && (start_buf11 == 0))
          begin
            start_buf11 <= 1;
          end
        buf11_reg[0] <= buf11_in;
        row1100 <= buf11_reg[0];
        row1101 <= row1100;
        row1102 <= row1101;
        row1103 <= row1102;
        row1104 <= row1103;
        row1105 <= row1104;
        row1106 <= row1105;
        row1107 <= row1106;
        row1108 <= row1107;
        row1109 <= row1108;
        row1110 <= row1109;
        row1111 <= row1110;
        row1112 <= row1111;
        row1113 <= row1112;
        row1114 <= row1113;
        buf11_reg[1] <= row1114; 
        morph_temp11 <= {row1114[0], row1113[0], row1112[0], row1111[0], row1110[0], row1109[0], row1108[0], row1107[0], row1106[0], row1105[0], row1104[0], row1103[0], row1102[0], row1101[0], row1100[0]};
      end
	end
	
morphology_fifo buf11(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf11_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf11), // input wr_en
  .rd_en(rd_en_buf11), // input rd_en
  .dout(buf11_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf11_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf11),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf11),
.rd_en(rd_en_buf11)
);



////////////////////////////////////////////////////buf12

assign buf12_in = buf11_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf12 <=0;
      end	
    else
      begin 
        if ((buf12_in[5] == 1) && (start_buf12 == 0))
          begin
            start_buf12 <= 1;
          end
        buf12_reg[0] <= buf12_in;
        row1200 <= buf12_reg[0];
        row1201 <= row1200;
        row1202 <= row1201;
        row1203 <= row1202;
        row1204 <= row1203;
        row1205 <= row1204;
        row1206 <= row1205;
        row1207 <= row1206;
        row1208 <= row1207;
        row1209 <= row1208;
        row1210 <= row1209;
        row1211 <= row1210;
        row1212 <= row1211;
        row1213 <= row1212;
        row1214 <= row1213;
        buf12_reg[1] <= row1214; 
        morph_temp12 <= {row1214[0], row1213[0], row1212[0], row1211[0], row1210[0], row1209[0], row1208[0], row1207[0], row1206[0], row1205[0], row1204[0], row1203[0], row1202[0], row1201[0], row1200[0]};
      end
	end
	
morphology_fifo buf12(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf12_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf12), // input wr_en
  .rd_en(rd_en_buf12), // input rd_en
  .dout(buf12_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf12_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf12),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf12),
.rd_en(rd_en_buf12)
);



////////////////////////////////////////////////////buf13

assign buf13_in = buf12_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf13 <=0;
      end	
    else
      begin 
        if ((buf13_in[5] == 1) && (start_buf13 == 0))
          begin
            start_buf13 <= 1;
          end
        buf13_reg[0] <= buf13_in;
        row1300 <= buf13_reg[0];
        row1301 <= row1300;
        row1302 <= row1301;
        row1303 <= row1302;
        row1304 <= row1303;
        row1305 <= row1304;
        row1306 <= row1305;
        row1307 <= row1306;
        row1308 <= row1307;
        row1309 <= row1308;
        row1310 <= row1309;
        row1311 <= row1310;
        row1312 <= row1311;
        row1313 <= row1312;
        row1314 <= row1313;
        buf13_reg[1] <= row1314; 
        morph_temp13 <= {row1314[0], row1313[0], row1312[0], row1311[0], row1310[0], row1309[0], row1308[0], row1307[0], row1306[0], row1305[0], row1304[0], row1303[0], row1302[0], row1301[0], row1300[0]};
      end
	end
	
morphology_fifo buf13(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf13_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf13), // input wr_en
  .rd_en(rd_en_buf13), // input rd_en
  .dout(buf13_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf13_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf13),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf13),
.rd_en(rd_en_buf13)
);



////////////////////////////////////////////////////buf14

assign buf14_in = buf13_out;


always@(posedge clk)
  begin
    if (reset == 1)
	  begin
	    start_buf14 <=0;
      end	
    else
      begin 
        if ((buf14_in[5] == 1) && (start_buf14 == 0))
          begin
            start_buf14 <= 1;
          end
        buf14_reg[0] <= buf14_in;
        row1400 <= buf14_reg[0];
        row1401 <= row1400;
        row1402 <= row1401;
        row1403 <= row1402;
        row1404 <= row1403;
        row1405 <= row1404;
        row1406 <= row1405;
        row1407 <= row1406;
        row1408 <= row1407;
        row1409 <= row1408;
        row1410 <= row1409;
        row1411 <= row1410;
        row1412 <= row1411;
        row1413 <= row1412;
        row1414 <= row1413;
        buf14_reg[1] <= row1414; 
        morph_temp14 <= {row1414[0], row1413[0], row1412[0], row1411[0], row1410[0], row1409[0], row1408[0], row1407[0], row1406[0], row1405[0], row1404[0], row1403[0], row1402[0], row1401[0], row1400[0]};
      end
	end
	
morphology_fifo buf14(
  .clk(clk), // input clk
  .rst(reset), // input rst
  .din(buf14_reg[1]), // input [0 : 0] din
  .wr_en(wr_en_buf14), // input wr_en
  .rd_en(rd_en_buf14), // input rd_en
  .dout(buf14_out), // output [0 : 0] dout
  .full(), // output full
  .empty() // output empty
);
morph_buf_controller #(
.CNT_WIDTH(COUNTER_WIDTH)
)buf14_controller (
.rst(reset),
.clk(clk),
.start_buffering(start_buf14),
.DELAY_CYCLES(DELAY),
.wr_en(wr_en_buf14),
.rd_en(rd_en_buf14)
);



////////////////////////////////////////////////////////////copy

assign copy_in = buf6_out;

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
        row_copy6 <= row_copy5;
        row_copy7 <= row_copy6;
        row_copy8 <= row_copy7;
        row_copy9[5:1] <= row_copy8[5:1];
        row_copy9[0] <= morph_copy;
        row_copy10 <= row_copy9;
        row_copy11 <= row_copy10;
        row_copy12 <= row_copy11;
        row_copy13 <= row_copy12;
        row_copy14 <= row_copy13;
        copy_reg[1] <= row_copy14; 
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
        temp9 = morph_temp9 & window[9];
        temp10 = morph_temp10 & window[10];
        temp11 = morph_temp11 & window[11];
        temp12 = morph_temp12 & window[12];
        temp13 = morph_temp13 & window[13];
        temp14 = morph_temp14 & window[14];                       

//        del0 = (temp0[0] | temp0[1] | temp0[2] | temp0[3] | temp0[4] | temp0[5] | temp0[6] | temp0[7] | temp0[8] | temp0[9] | temp0[10] | temp0[11] | temp0[12] | temp0[13] | temp0[14]);
//        del1 = (temp1[0] | temp1[1] | temp1[2] | temp1[3] | temp1[4] | temp1[5] | temp1[6] | temp1[7] | temp1[8] | temp1[9] | temp1[10] | temp1[11] | temp1[12] | temp1[13] | temp1[14]);
//        del2 = (temp2[0] | temp2[1] | temp2[2] | temp2[3] | temp2[4] | temp2[5] | temp2[6] | temp2[7] | temp2[8] | temp2[9] | temp2[10] | temp2[11] | temp2[12] | temp2[13] | temp2[14]);
//        del3 = (temp3[0] | temp3[1] | temp3[2] | temp3[3] | temp3[4] | temp3[5] | temp3[6] | temp3[7] | temp3[8] | temp3[9] | temp3[10] | temp3[11] | temp3[12] | temp3[13] | temp3[14]);
//        del4 = (temp4[0] | temp4[1] | temp4[2] | temp4[3] | temp4[4] | temp4[5] | temp4[6] | temp4[7] | temp4[8] | temp4[9] | temp4[10] | temp4[11] | temp4[12] | temp4[13] | temp4[14]);
//        del5 = (temp5[0] | temp5[1] | temp5[2] | temp5[3] | temp5[4] | temp5[5] | temp5[6] | temp5[7] | temp5[8] | temp5[9] | temp5[10] | temp5[11] | temp5[12] | temp5[13] | temp5[14]);
//        del6 = (temp6[0] | temp6[1] | temp6[2] | temp6[3] | temp6[4] | temp6[5] | temp6[6] | temp6[7] | temp6[8] | temp6[9] | temp6[10] | temp6[11] | temp6[12] | temp6[13] | temp6[14]);
//        del7 = (temp7[0] | temp7[1] | temp7[2] | temp7[3] | temp7[4] | temp7[5] | temp7[6] | temp7[7] | temp7[8] | temp7[9] | temp7[10] | temp7[11] | temp7[12] | temp7[13] | temp7[14]);
//        del8 = (temp8[0] | temp8[1] | temp8[2] | temp8[3] | temp8[4] | temp8[5] | temp8[6] | temp8[7] | temp8[8] | temp8[9] | temp8[10] | temp8[11] | temp8[12] | temp8[13] | temp8[14]);
//        del9 = (temp9[0] | temp9[1] | temp9[2] | temp9[3] | temp9[4] | temp9[5] | temp9[6] | temp9[7] | temp9[8] | temp9[9] | temp9[10] | temp9[11] | temp9[12] | temp9[13] | temp9[14]);
//        del10 = (temp10[0] | temp10[1] | temp10[2] | temp10[3] | temp10[4] | temp10[5] | temp10[6] | temp10[7] | temp10[8] | temp10[9] | temp10[10] | temp10[11] | temp10[12] | temp10[13] | temp10[14]);
//        del11 = (temp11[0] | temp11[1] | temp11[2] | temp11[3] | temp11[4] | temp11[5] | temp11[6] | temp11[7] | temp11[8] | temp11[9] | temp11[10] | temp11[11] | temp11[12] | temp11[13] | temp11[14]);
//        del12 = (temp12[0] | temp12[1] | temp12[2] | temp12[3] | temp12[4] | temp12[5] | temp12[6] | temp12[7] | temp12[8] | temp12[9] | temp12[10] | temp12[11] | temp12[12] | temp12[13] | temp12[14]);
//        del13 = (temp13[0] | temp13[1] | temp13[2] | temp13[3] | temp13[4] | temp13[5] | temp13[6] | temp13[7] | temp13[8] | temp13[9] | temp13[10] | temp13[11] | temp13[12] | temp13[13] | temp13[14]);
//        del14 = (temp14[0] | temp14[1] | temp14[2] | temp14[3] | temp14[4] | temp14[5] | temp14[6] | temp14[7] | temp14[8] | temp14[9] | temp14[10] | temp14[11] | temp14[12] | temp14[13] | temp14[14]);     
//        del = (del0 | del1 | del2 | del3 | del4 | del5 | del6 | del7 | del8 | del9 | del10 | del11 | del12 | del13 | del14);


/////////// 15*15 dilation, 4 corner
//        del0 = (temp0[7]);
//        del7 = (temp7[0] | temp7[7] | temp7[14]);
//        del14 = (temp14[7]);     
//        del = (del0 | del7 | del14);


////////// 9*9 dilation, all "1"
        del3 = (temp3[7]);
        del4 = (temp4[6] | temp4[7] | temp4[8]);
        del5 = (temp5[5] | temp5[6] | temp5[7] | temp5[8] | temp5[9]);
        del6 = (temp6[4] | temp6[5] | temp6[6] | temp6[7] | temp6[8] | temp6[9] | temp6[10]);
        del7 = (temp7[3] | temp7[4] | temp7[5] | temp7[6] | temp7[7] | temp7[8] | temp7[9] | temp7[10] | temp7[11]);
        del8 = (temp8[4] | temp8[5] | temp8[6] | temp8[7] | temp8[8] | temp8[9] | temp8[10]);
        del9 = (temp9[5] | temp9[6] | temp9[7] | temp9[8] | temp9[9]);
        del10 = (temp10[6] | temp10[7] | temp10[8]);
        del11 = (temp11[7]);
        del = (del3 | del4 | del5 | del6 | del7 | del8 | del9 | del10 | del11);


//////// 7*7 dilation, all "1"
        
//        del4 = (temp4[7]);
//        del5 = (temp5[6] | temp5[7] | temp5[8]);
//        del6 = (temp6[5] | temp6[6] | temp6[7] | temp6[8] | temp6[9]);
//        del7 = (temp7[4] | temp7[5] | temp7[6] | temp7[7] | temp7[8] | temp7[9] | temp7[10]);
//        del8 = (temp8[5] | temp8[6] | temp8[7] | temp8[8] | temp8[9]);
//        del9 = (temp9[6] | temp9[7] | temp9[8]);
//        del10 = (temp10[7]);
 
//        del = (del4 | del5 | del6 | del7 | del8 | del9 | del10);


                      
        if (del == 1)
          morph_copy = 1;
        else
          morph_copy = 0;     
      end
  end

endmodule
