
module morph_buf_controller (
input wire rst,
input wire clk,
input wire start_buffering,
input wire [15:0] DELAY_CYCLES, 
output reg wr_en,
output reg rd_en
);

parameter CNT_WIDTH = 32;
//parameter DELAY_CYCLES = 18;

reg [CNT_WIDTH-1:0] cnt;
reg start_flag;

//Counter on hdmi enable
always@(posedge clk)
	begin
		if(rst)
			begin
			start_flag <= 0;
			wr_en <= 0;
			rd_en <= 0;
			cnt <= 0;
			end
		else
		    begin
			if(start_buffering==1)
			begin
				start_flag <= 1;
				wr_en <= 1;
			end
			if(start_flag==1)
				begin
				cnt <= cnt+1;
				if(cnt == DELAY_CYCLES-2)
				begin
				rd_en <= 1;
				start_flag <= 0;	
				end
			end
		end
	end

endmodule