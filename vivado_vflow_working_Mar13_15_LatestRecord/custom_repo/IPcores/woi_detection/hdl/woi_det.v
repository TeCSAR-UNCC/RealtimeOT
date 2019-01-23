//`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// This logic has 2 cycles delay.
// 
//////////////////////////////////////////////////////////////////////////////////
module woi_det (
    input wire clk,
    input wire rst,
    input wire input_video_vblank,
    input wire input_video_hblank,
    input wire [15:0] WIDTH_START,
    input wire [15:0] WIDTH_END,
    input wire [15:0] HEIGHT_START,
    input wire [15:0] HEIGHT_END,
    output reg window_enable,
    output reg [31:0] row_counter,
    output reg [31:0] pixel_counter,
    output reg eol,//window end of line
    output reg sow//start of window
    );

    reg row_enable;
    reg start_flag;
    //reg interest_vblank_reg;
    //reg interest_hblank_reg;    

    wire interest_vblank;
    wire interest_hblank;
    wire active_video;
    wire cond0, cond1, cond2, cond3, cond4, cond5, cond6, cond7, cond8;

    assign interest_vblank = input_video_vblank;
    assign interest_hblank = input_video_hblank;
    assign active_video = ~(interest_vblank | interest_hblank) & start_flag;
    //assign active_video = ~(interest_vblank | interest_hblank);

        //************************************************interest_window_pipe0**************************************//
      always @(posedge clk)
        begin      
            if (rst)
                begin
		    start_flag <= 1;
                    pixel_counter <= 0;
                    row_counter <= 0;
		    row_enable <= 0;
		    //interest_vblank_reg <= 0;
		    //interest_hblank_reg <= 0;
                end
            else
                begin
			
			//if(start_flag == 0)
				//begin
 		    		//	start_flag <= interest_vblank;
				//end			
			//else
				//begin
				   //pixel counter 
			//if(start_flag == 1)
				//begin               
				    if (active_video == 1'b1)
					begin
					    pixel_counter <= pixel_counter + 1;						
						//if(pixel_counter == (WIDTH_END - WIDTH_START))
							//begin
								//pixel_counter <= 0;
							//end
						//else
							//begin
							//end
					end
				     else 
					 begin
					    pixel_counter <= 0;
					 end
				   //Row counter
				    if (interest_hblank == 1'b0)
					begin 
					   row_enable <= 1;
					end
				     else 
					 begin
					      if (interest_vblank == 1'b1)
					            begin
					                row_counter <= 0;
					            end
					      else
					            begin 
					                row_counter <= row_counter + row_enable;
					            end
					   row_enable <= 0;
					 end						
				//end
                end 
          end  

	// > and < changed to >= and <=
	assign cond0 = pixel_counter == WIDTH_START;
	assign cond1 = pixel_counter > WIDTH_START;
	assign cond2 = pixel_counter == WIDTH_END;
	assign cond3 = pixel_counter < WIDTH_END;
	assign cond4 = row_counter == HEIGHT_START;
	assign cond5 = row_counter > HEIGHT_START;
	assign cond6 = row_counter == HEIGHT_END;
	assign cond7 = row_counter < HEIGHT_END;
	assign cond8 = active_video == 1'b1;

        //************************************************interest_window_pipe1**************************************//
    always @(posedge clk)
          begin
	     if(rst)
		begin
		     window_enable <= 0;
	             eol <= 0;
	             sow <= 0;
		end
	     else
		begin
		     //Vblank and Hblank is considered in window_en activation
		     if ( (cond0 | cond1) & ( cond2 | cond3 ) & (cond4 | cond5) & ( cond6 | cond7 ) & cond8 )
			begin
			     window_enable <= 1;
			     eol <= (pixel_counter == WIDTH_END);
			     sow <= (pixel_counter == WIDTH_START && row_counter == HEIGHT_START);
			end 
		     else
			begin
			     window_enable <= 0;
			     eol <= 0;
			     sow <= 0;
			end   
		end		 
           end
           
endmodule
