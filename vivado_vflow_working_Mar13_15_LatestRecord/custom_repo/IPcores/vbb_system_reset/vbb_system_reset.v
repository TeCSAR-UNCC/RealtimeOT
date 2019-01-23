`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hamed Tabkhi
// 
// Create Date:
// Design Name: 
// Module Name: vbb_system_reset
// Project Name: Vision Flow - NEU ESL
// Target Devices: 
// Tool Versions: 
// Description: 
// This logic produces system reset for the vision flow project.
// Dependencies: 
// 
// Revision: Majid Sabbagh 07/05/2014
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vbb_system_reset(
    input wire clk,
    input wire ext_reset_n,
    input wire ext_reset,
    input wire vblank,
    output wire system_reset_n,
    output reg system_reset
    );
    
    //reg vblank_reg;
    
       always@(posedge clk)
         begin
             //vblank_reg <= vblank;
                //system reset generation     
              if (ext_reset_n == 0 || ext_reset == 1)
                  begin
                      system_reset <= 1;
                  end
              else if (ext_reset_n == 1 &&  vblank == 1 || ext_reset == 0 &&  vblank == 1)
                  begin
                      system_reset <= 0;
                  end
          end 
  
      assign system_reset_n = ~ system_reset;
          
endmodule
