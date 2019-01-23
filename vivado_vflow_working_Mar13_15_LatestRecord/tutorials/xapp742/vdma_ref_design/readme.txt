*************************************************************************
   ____  ____ 
  /   /\/   / 
 /___/  \  /   
 \   \   \/    © Copyright 2012-2014 Xilinx, Inc. All rights reserved.
  \   \        This file contains confidential and proprietary 
  /   /        information of Xilinx, Inc. and is protected under U.S. 
 /___/   /\    and international copyright and other intellectual 
 \   \  /  \   property laws. 
  \___\/\___\ 
 
*************************************************************************

Vendor: Xilinx 
Current readme.txt Version: 2.0
Date Last Modified: 27JAN2014 
Date Created: 05DEC2013 

Associated Filename: xapp742.zip
Associated Document: xapp742.pdf
AXI VDMA Reference Design

Supported Device(s): Kintex-7 FPGAs
   
*************************************************************************

Disclaimer: 

      This disclaimer is not a license and does not grant any rights to 
      the materials distributed herewith. Except as otherwise provided in 
      a valid license issued to you by Xilinx, and to the maximum extent 
      permitted by applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE 
      "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL 
      WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
      INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, 
      NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and 
      (2) Xilinx shall not be liable (whether in contract or tort, 
      including negligence, or under any other theory of liability) for 
      any loss or damage of any kind or nature related to, arising under 
      or in connection with these materials, including for any direct, or 
      any indirect, special, incidental, or consequential loss or damage 
      (including loss of data, profits, goodwill, or any type of loss or 
      damage suffered as a result of any action brought by a third party) 
      even if such damage or loss was reasonably foreseeable or Xilinx 
      had been advised of the possibility of the same.

Critical Applications:

      Xilinx products are not designed or intended to be fail-safe, or 
      for use in any application requiring fail-safe performance, such as 
      life-support or safety devices or systems, Class III medical 
      devices, nuclear facilities, applications related to the deployment 
      of airbags, or any other applications that could lead to death, 
      personal injury, or severe property or environmental damage 
      (individually and collectively, "Critical Applications"). Customer 
      assumes the sole risk and liability of any use of Xilinx products 
      in Critical Applications, subject only to applicable laws and 
      regulations governing limitations on product liability.

THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS 
FILE AT ALL TIMES.

*************************************************************************

This readme file contains these sections:

1. REVISION HISTORY
2. OVERVIEW
3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS
4. HARDWARE REQUIREMENTS
5. DESIGN FILE HIERARCHY
6. EXECUTING THE REFERENCE SYSTEM USING THE PRE-BUILT BITSTREAM AND THE COMPILED SOFTWARE APPLICATION 
7. BUILDING HARDWARE
8. COMPILING SOFTWARE IN SDK
9. KNOWN ISSUES
10. SUPPORT


1. REVISION HISTORY 

            Readme  
Date        Version      Revision Description
=========================================================================
03/13/2012  1.0          Initial Xilinx release.
09/20/2012  1.1          1. Updated to 14.2 XPS flow
                         2. Added Vivado tool flow 
                         3. Software update to avoid applying hard reset to change the resolution.
                         4. Updated XSVI bridge to v_vid_in_axi4s 
27/01/2014  2.0          1. Regenerated for 2013.4 IPI flow
=========================================================================



2. OVERVIEW

This readme describes how to use the files that come with XAPP742

Source code for the XAPP is for processing desired frame rate and resolution. 
Ready for download directory contains "bit" and "elf" files of the system for processing
various frame rates and resolutions.


3. SOFTWARE TOOLS AND SYSTEM REQUIREMENTS

        Vivado Tool Suite 2013.4
        Vivado IP Integrator Tool 2013.4
	Vivado 2013.4 SDK 

4 HARDWARE REQUIREMENTS

	Xilinx KC705 evaluation board (revision C)
	Two USB Type-A to Mini-B 5-pin cables
	High Quality HDMI to DVI cable (otherwise colors are not seen properly)
        Display monitor supporting resolutions up to 75 frames/sec 
	(The reference design was tested on DELL-P2210t monitor for 60 and 75 Hz, upto 60 Hz on DELL-U2410F)
5. DESIGN FILE HIERARCHY

The directory structure underneath this <unzip_dir> is described below:

\HW
 | 
 |-------\project_1: Contains Vivado  IPI project
 |
 |   
\ready_for_download: Contain "bit" and "elf" files
 |
 |
 |
 /SW        
 |       
 |    
 |-------\SDK_Workspace: Contains source code of application.

6. EXECUTING THE REFERENCE SYSTEM USING THE PRE-BUILT BITSTREAM AND THE COMPILED SOFTWARE APPLICATION 

	
	a. Connect a USB cable from the host PC to the USB JTAG port. Ensure the appropriate device drivers are installed.
	b. Connect a second USB cable from the host PC to the USB UART port. Ensure that the USB UART drivers have been installed.
	c. Connect KC705 HDMI with DVI port of video monitor(DELL P2210t) by using high quality HDMI to DVI cable (otherwise colors are not seen properly).
           The design is tested on DELL-P2210t monitor for 60 and 75 Hz, upto 60 Hz on DELL-U2410F.
	d. Connect a power supply cable, Set power ON.
	e. Start a terminal program (e.g., HyperTerminal) on the host PC with these settings:
		• Baud Rate: 9600
		• Data Bits: 8
		• Parity: None
		• Stop Bits: 1
		• Flow Control: None
	f. Steps to execute the system using files in the ready_for_download directory of <unzip_dir>
		I.  In a XILINX command shell or terminal window, change directory to
			% cd <unzip dir>/ready_for_download/
		II. Invoke the Xilinx Microprocessor Debugger (XMD) tool:
			% xmd
		III. Download the bitstream inside XMD:
			XMD% fpga -f download_ipi.bit
		IV.  Connect to the processor inside XMD:
			XMD% connect mb mdm
		V.   Download the processor code (ELF) file:
			XMD% dow vdma_display.elf
		VI.  Run the software:
			XMD% run
	g. In hyper terminal, User is spposed to enter one of the number (0-7) from 
		"Resolution Select Menu"   
		0 = 640x480
		1 = 720x480
		2 = 800x600
		3 = 1024x768
		4 = 1280x720
		5 = 1280x1024
		6 = 1920x1080
		7 = 1600x1200
	h. After that, User is supposed to enter a letter(a, b) from frame rate selection menu
		a = 60 Hz
		b = 75 Hz
	I. After that from the pattern selection menu user is supposed to entera numer to select one of the patterns
		0 — Horizontal ramp
		1 — vertical ramp 
		2 — flat red 
		3 — flat green 
		4 — flat blue 
		5 — color bars 
		6 — zone plates  
		7 — tartan bars 
		8 — cross hatch 
		9 - DDR Bandwidth
		d - Glass to Glass Delay

		q - Exit
		? - Help
         II. On applying system reset, Reload the elf file to start fresh execution

7. BUILDING HARDWARE

        a. Open Vivado project from the "vivado" folder 
        b. Click on option "Generate Bitstream"

8. COMPILING SOFTWARE IN SDK

	a. Start SDK. In Linux, type xsdk to start SDK.
	b. In the workspace launcher, select this workspace: <unzipdir>/vdma_ref_design/SW/SDK_Workspace
	c. Click OK.
	h. Import the board support package (BSP), hardware platform, and software applications by selecting File > Import > General > Existing Projects into the workspace.
	I. Click Next, then browse to <unzip dir>/vdma_ref_deisgn/SW.
	j. Click OK.
	k. Ensure that all checkboxes are selected (including app and hw_platform_0).
	l. Ensure that the associated software applications are selected.
	m. Click Finish.

9. KNOWN ISSUES
	a. On some of the other monitors, even though the patterns are as expected, Colors of the patterns are slightly changed from actual.
       
	
10. SUPPORT

To obtain technical support for this XAPP, go to www.xilinx.com/support to locate answers to known issues in the Xilinx
Answers Database or to create a WebCase.  
