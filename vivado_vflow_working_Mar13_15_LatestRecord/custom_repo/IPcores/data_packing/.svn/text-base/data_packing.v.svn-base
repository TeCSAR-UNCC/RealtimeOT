`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: NEU-ESL
// Engineer: Majid Sabbagh
// 
// Create Date: 04/06/2014 09:30:53 PM
// Design Name: 
// Module Name: data_packing
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//This macro is got from the netfpga project (stanford university)
`define LOG2_FUNC \
function integer log2; \
      input integer number; \
      begin \
         log2=0; \
         while(2**log2<number) begin \
            log2=log2+1; \
         end \
      end \
endfunction

module data_packing
    #(
    parameter IN_DATA_WIDTH = 1,
    parameter OUT_DATA_WIDTH = 32
    )
    (
    input wire clk,
    input wire rst,
    input wire [IN_DATA_WIDTH - 1:0] data_to_pack,
    input wire packing_en,
    output reg [OUT_DATA_WIDTH - 1:0] write_data,
    output reg write_data_valid
    );
    
    `LOG2_FUNC
    
    reg [log2(OUT_DATA_WIDTH/IN_DATA_WIDTH) - 1:0] delay_cnt;
    
    always@(posedge clk)
     begin
         if(rst)
             begin
                 write_data <= 0;
                 delay_cnt <= 0;
                 write_data_valid <= 0;
             end
         else
             begin
                 if(packing_en == 1)
                     begin
                           delay_cnt <= delay_cnt + 1;
                           write_data[ ((OUT_DATA_WIDTH - 1) - IN_DATA_WIDTH) : 0] <= write_data[ OUT_DATA_WIDTH - 1 : IN_DATA_WIDTH ];
                           write_data[ OUT_DATA_WIDTH - 1 : OUT_DATA_WIDTH - IN_DATA_WIDTH] <= data_to_pack;
                     end      
                         if(delay_cnt == ( (OUT_DATA_WIDTH/IN_DATA_WIDTH) - 1 ) )
                             write_data_valid <= 1;
                         else
                             write_data_valid <= 0; 
             end    
     end
               
endmodule
