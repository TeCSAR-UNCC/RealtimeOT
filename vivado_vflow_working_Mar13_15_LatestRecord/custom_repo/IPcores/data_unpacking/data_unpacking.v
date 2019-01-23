//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Majid Sabbagh
// 
// Create Date: 04/06/2014 09:15:33 PM
// Design Name: 
// Module Name: data_unpacking
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// This modules unpacks a 32 bit data bit by bit each cycle
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

module data_unpacking  #(
    parameter IN_DATA_WIDTH = 32,
    parameter OUT_DATA_WIDTH = 16
    )
    (
    input wire clk,
    input wire rst,
    input wire unpack_enable,
    input wire window_en,
    input wire [IN_DATA_WIDTH - 1:0] in_data,
    output reg ready_to_unpack,
    output reg [OUT_DATA_WIDTH - 1:0] out_data
    );
 
    `LOG2_FUNC
   
    reg [log2(IN_DATA_WIDTH/OUT_DATA_WIDTH) - 1:0] bit_cnt;
    reg [IN_DATA_WIDTH - OUT_DATA_WIDTH:0] read_data_reg;
    reg unpack_start;	

    always@(posedge clk)
    begin
        if(rst)
            begin
                out_data <= 0;
                bit_cnt <= 0;
                read_data_reg <= 0;
                ready_to_unpack <= 1;
                unpack_start <= 0;
            end
        else
            begin
                        if(ready_to_unpack == 1 && unpack_enable == 1 && window_en == 1)
                            begin
                                read_data_reg <= in_data[IN_DATA_WIDTH - 1:0] >> OUT_DATA_WIDTH;
                                out_data <= in_data[OUT_DATA_WIDTH - 1:0];
                                ready_to_unpack <= 0;
                                bit_cnt <= 0;
                                unpack_start <= 1;                                                               
                            end   
                        else
                            begin
                                 out_data <= read_data_reg[OUT_DATA_WIDTH - 1:0];
                                   
                                if(window_en == 1)
                                    begin
			                read_data_reg <= read_data_reg >> OUT_DATA_WIDTH;
			                bit_cnt <= bit_cnt + 1;
                                    end

				if(bit_cnt == ((IN_DATA_WIDTH / OUT_DATA_WIDTH) - 2) && window_en == 1)
				    begin
			               ready_to_unpack <= 1;									
				    end
                                else
                                    begin
	                                if(unpack_start == 1)
	                                	begin
							if(bit_cnt == ((IN_DATA_WIDTH / OUT_DATA_WIDTH) - 1))
								begin
	                                     				ready_to_unpack <= 1; 									
								end
							else
								begin
									ready_to_unpack <= 0; 
								end                                                                  
	                                 	end
                                    end  
                            end  
            end 
    end
    
endmodule
