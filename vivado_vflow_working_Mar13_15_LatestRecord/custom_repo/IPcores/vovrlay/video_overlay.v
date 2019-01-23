//output_source 3'b000 grayscale input video forwarded to output screen
//output_source 3'b010 color input video forwarded to output screen
//output_source 3'b001 white and black fg and bg, outside of woi is black
//output_source 3'b011 color and black fg and bg, outside of woi is color
//output_source 3'b100 N/A
//output_source 3'b101 white and black fg and bg, outside of woi is grayscale
//output_source 3'b111 color and black fg and bg, outside of woi is color
//Latest Revision: July 3rd 2014 Majid Sabbagh, for migration to Vivado
module video_overlay (
    input wire rst,
    input wire clk,
    input wire [3:0] output_source,
    input wire vovrlay_is_fg,
    input wire mog_window_enable,
    input wire video_overlay_window_enable,
    input wire mog_is_fg,
    input wire [7:0] video_grayscale_data,
    input wire [15:0] video_color_data,
    output reg [15:0] video_data_out
);

reg [15:0] video_data;

always@(*)
begin
    video_data = video_data_out;  
    if(output_source[0] == 1)
    begin
        if(vovrlay_is_fg & video_overlay_window_enable)
        begin
		    video_data = 16'h8745;// Green Color
        end	
        else
        begin
            if(mog_is_fg & mog_window_enable) //Output MOG, this pixel is fg
            begin
                if(output_source[1] == 1)            
                    video_data = video_color_data;       
                else
                    video_data = 16'hFF80;   //white      
            end
            else
            begin
                if(mog_window_enable == 1) //this pixel is bg
                      video_data = video_color_data;
//                    video_data = 16'h0080;//black  
                    /*
                    if(output_source[1] == 1) 
                        video_data = video_color_data;
                    else
                    	video_data = 16'h0080;   //black  */ 
                else //not output MOG
                begin
                    if(output_source[1] == 1)
                        video_data = video_color_data;//forward the original color video to output screen
                    else
					if(output_source[2] == 1)
	                	video_data = {video_grayscale_data, 8'h80};//forward the original gray scaled video to output screen				
					else                                              		
						video_data = 16'h0080; //black				                                       
                end                
            end   
        end   
    end
    else
    begin
        if(output_source[1] == 1)
		begin
            video_data = video_color_data;//forward the original color video to output screen
		end
        else
		begin
            video_data = {video_grayscale_data, 8'h80};//forward the original gray scaled video to output screen
		end
    end
 	if(output_source[3] == 1)
	begin
	    if(video_data != 16'h8745) 
	    begin
	        video_data = video_color_data;
		end
	end
end


always @ (posedge clk)
    begin
        if(rst)
		begin
            		video_data_out <= 0;
		end
        else
		begin
            		video_data_out <= video_data;
		end
    end
    
endmodule
