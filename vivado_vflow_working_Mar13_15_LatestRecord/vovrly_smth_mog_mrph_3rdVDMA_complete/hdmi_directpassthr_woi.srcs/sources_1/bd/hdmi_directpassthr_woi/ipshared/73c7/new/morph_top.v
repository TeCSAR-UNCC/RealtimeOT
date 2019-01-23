/***************************************************
This module has a Latency = 3 * ( ((window_size + 1) / 2) * row_length + (window_size + 1) / 2 )
Author: Chenyan Liu
****************************************************/

module morph_top(
    input wire rst,
    input wire clk,
    input wire de_in, 
    input wire hblank_in, 
    input wire vblank_in, 
    input wire spdif_in, 
    input wire win_enable_in, 
    input wire input_data_bit,
    output wire de_out, 
    output wire hblank_out, 
    output wire vblank_out, 
    output wire spdif_out, 
    output wire win_enable_out, 
    output wire output_data_bit
    );
    
    /************************* morph_closing ********************************/
    /************************* morph_dilation ********************************/
    
    wire data_enable_out_morph_dia;
    wire Hblank_out_morph_dia; 
    wire Vblank_out_morph_dia; 
    wire spdif_out_morph_dia;
    wire win_enable_out_morph_dia; 
    wire data_out_morph_dia;
    
        morph_dia morph_dilation (
        .reset(rst),
        .clk(clk), 
        .data_enable_in(de_in), 
        .Hblank_in(hblank_in), 
        .Vblank_in(vblank_in), 
        .spdif_in(spdif_in), 
        .win_enable_in(win_enable_in), 
        .data_in(input_data_bit),
        .data_enable_out(data_enable_out_morph_dia), 
        .Hblank_out(Hblank_out_morph_dia), 
        .Vblank_out(Vblank_out_morph_dia), 
        .spdif_out(spdif_out_morph_dia), 
        .win_enable_out(win_enable_out_morph_dia), 
        .data_out(data_out_morph_dia)
        );
    
    /************************* morph_err ********************************/
    
    wire data_enable_out_morph_err;
    wire Hblank_out_morph_err; 
    wire Vblank_out_morph_err; 
    wire spdif_out_morph_err;
    wire win_enable_out_morph_err; 
    wire data_out_morph_err;
    
        morph_err_l1 morph_erosion_level1 (
        .reset(rst),
        .clk(clk), 
        .data_enable_in(data_enable_out_morph_dia), 
        .Hblank_in(Hblank_out_morph_dia), 
        .Vblank_in(Vblank_out_morph_dia), 
        .spdif_in(spdif_out_morph_dia), 
        .win_enable_in(win_enable_out_morph_dia), 
        .data_in(data_out_morph_dia),
        .data_enable_out(data_enable_out_morph_err), 
        .Hblank_out(Hblank_out_morph_err), 
        .Vblank_out(Vblank_out_morph_err), 
        .spdif_out(spdif_out_morph_err), 
        .win_enable_out(win_enable_out_morph_err), 
        .data_out(data_out_morph_err)
        );
    
    
    /************************* morph_err_level2 ********************************/
    
    wire data_enable_out_morph_err_2;
    wire Hblank_out_morph_err_2; 
    wire Vblank_out_morph_err_2; 
    wire spdif_out_morph_err_2;
    wire win_enable_out_morph_err_2; 
    wire data_out_morph_err_2;
    
        morph_err_l2 morph_errosion_level2 (
        .reset(rst),
        .clk(clk), 
        .data_enable_in(data_enable_out_morph_err), 
        .Hblank_in(Hblank_out_morph_err), 
        .Vblank_in(Vblank_out_morph_err), 
        .spdif_in(spdif_out_morph_err), 
        .win_enable_in(win_enable_out_morph_err), 
        .data_in(data_out_morph_err),
        .data_enable_out(data_enable_out_morph_err_2), 
        .Hblank_out(Hblank_out_morph_err_2), 
        .Vblank_out(Vblank_out_morph_err_2), 
        .spdif_out(spdif_out_morph_err_2), 
        .win_enable_out(win_enable_out_morph_err_2), 
        .data_out(data_out_morph_err_2)
        );        


    /************************* morph_dilation_level2 ********************************/
    
    wire data_enable_out_morph_dia_l2;
    wire Hblank_out_morph_dia_l2; 
    wire Vblank_out_morph_dia_l2; 
    wire spdif_out_morph_dia_l2;
    wire win_enable_out_morph_dia_l2; 
    wire data_out_morph_dia_l2;
    
        morph_dia morph_dilation_level2 (
        .reset(rst),
        .clk(clk), 
        .data_enable_in(data_enable_out_morph_err_2), 
        .Hblank_in(Hblank_out_morph_err_2), 
        .Vblank_in(Vblank_out_morph_err_2), 
        .spdif_in(spdif_out_morph_err_2), 
        .win_enable_in(win_enable_out_morph_err_2), 
        .data_in(data_out_morph_err_2),
        .data_enable_out(de_out), 
        .Hblank_out(hblank_out), 
        .Vblank_out(vblank_out), 
        .spdif_out(spdif_out), 
        .win_enable_out(win_enable_out), 
        .data_out(output_data_bit)
        );    
    /****************************************************************************/
    
endmodule
