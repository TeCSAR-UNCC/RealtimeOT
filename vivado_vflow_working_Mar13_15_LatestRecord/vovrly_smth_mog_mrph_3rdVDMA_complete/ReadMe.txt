=====================================================================================
Project Functionality:
1- Image Smoothing
2- Mixture of Gaussians
3- Video Overlay read and write path
4- Morphology 
5- Object Detection
6- Object Tracking/Kalman Filter

Resolution: 720p (1280x720) at 60fps
note: passthrough monitor resolution MUST be set to 720p (program FPGA, then go to Displays and set second monitor that appears to 720p)

Wires needed: DisplayPort to HDMI for input (or whatever wire you need to connect to the HDMI input expansion card from the development station)
	      HDMI to DVI-D for output (This is the only way we got an output successfully)

Video Overlay is only output to Morphology output, not original passthrough. 
=====================================================================================
=====================================================================================
INITIAL SYNTHESIS ISSUES:

PROBLEM:
Unable to connect to Zedboard through UART terminal

SOLUTION:
Cable drivers must be installed (are not installed automatically in Linux)
note: these instructions are for Vivado 2017.2. If you are using a newer version, change the paths and commands to suit the version. 

1.) Create an account on www.xilinx.com
2.) Download the Vivado Design Suite - HLx Editions found at https://www.xilinx.com/products/design-tools/vivado.html
3.) Open your terminal program
4.) Type in or copy and paste the following 
commands:
             cd Downloads/
             chmod +x {downloaded binary file}  //don't type the curly braces
             sudo ./{downloaded binary file}	//don't type the curly braces
5.) Allow the GUI to do the installation.  Choose webpack when prompted.
6.) Type in or copy and paste the following commands:
             cd /opt/Xilinx/Vivado/2017.2/data/xicom/cable_drivers/lin64/install_script/install_drivers/
             sudo ./install_drivers
             sudo dpkg --add-architecture i386
             cd
             gedit .bashrc
7.) At this point, a text editor window should pop up. Add the following lines to the end of the file.
             # Xilinx Vivado
             source /opt/Xilinx/Vivado/2017.2/settings64.sh
             source /opt/Xilinx/SDK/2017.2/settings64.sh
8.) Close the text editor and renavigate to your terminal window. Run the following 
commands.
              sudo apt-get update
               source .bashrc
               vivado &
9.) At this point the Vivado GUI should appear.  If your terminal starts putting out errors mentioning files and directories then run the following command in terminal.  Replace user with your username and group with the group that you belong to. If you're uncertain, it's likely the same 
as your username.
               sudo chown -R user:group .Xilinx
               vivado &
10.) Hopefully there are no error messages at this point. And you're done!
=====================================================================================
PROBLEM:
Locked HDMI passthrough ips in Vivado cannot be upgraded

SOLUTION:
Make sure /custom_repo/IPcores/ is included in IP repo paths
=====================================================================================
PROBLEM:
In sdk, some cache_disable.h and other header files not found

SOLUTION:
Right click on vision_flow_app, select properties, and go to C++ general, Paths and Symbols. Make sure /custom_repo/SWcodes/inc/ is included (this path may change based on local installation)
If this solution fails, just import the needed header files. 
=====================================================================================


