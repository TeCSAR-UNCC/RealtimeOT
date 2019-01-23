// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: NEU-ESL:user:image_smoothing:1.0
// IP Revision: 2

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module hdmi_directpassthr_woi_image_smoothing_1_0 (
  reset,
  clk,
  de_in,
  Hblank_in,
  Vblank_in,
  spdif_in,
  win_enable_in,
  data_in,
  de_out,
  Hblank_out,
  Vblank_out,
  spdif_out,
  win_enable_out,
  data_out
);

input wire reset;
input wire clk;
input wire de_in;
input wire Hblank_in;
input wire Vblank_in;
input wire spdif_in;
input wire win_enable_in;
input wire [15 : 0] data_in;
output wire de_out;
output wire Hblank_out;
output wire Vblank_out;
output wire spdif_out;
output wire win_enable_out;
output wire [15 : 0] data_out;

  image_smoothing #(
    .COUNTER_WIDTH(32)
  ) inst (
    .reset(reset),
    .clk(clk),
    .de_in(de_in),
    .Hblank_in(Hblank_in),
    .Vblank_in(Vblank_in),
    .spdif_in(spdif_in),
    .win_enable_in(win_enable_in),
    .data_in(data_in),
    .de_out(de_out),
    .Hblank_out(Hblank_out),
    .Vblank_out(Vblank_out),
    .spdif_out(spdif_out),
    .win_enable_out(win_enable_out),
    .data_out(data_out)
  );
endmodule
