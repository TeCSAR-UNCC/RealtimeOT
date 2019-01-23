// Filename:          xTPG_app.c
// Version:           1.00.a
// Description:       xTPG Driver Source File
// Date:              Dec 05 2012
//////////////////////////////////////////////////////////////////////////////



/***************************** Include Files *******************************/

#include <stdio.h>


//#include "xuartps_hw.h"
/* BSP includes. */


// Located in: microblaze_0/include/xparameters.h
#include "xutil.h"
#include "xio.h"
#include "xparameters.h"
#include "xtpg_app.h"
#include "xaxivdma.h"
#include "xosd.h"
#include "tpg.h"

//#include "perf_dma.h"
#define SinTableDepth 2048
#define ENABLE_ZONEPLATE_AND_SWEEPS 1

#define FRAME_HORIZONTAL_LEN  0x1680   /* 1920 pixels, each pixel 3 bytes */
#define FRAME_VERTICAL_LEN    0x438    /* 1080 pixels */

#define NUMBER_OF_DMAS 8
#define SYSTEM_PERIOD 6.734

#define DATA_WIDTH 32
#define BYTE_PER_DATA_BEAT (DATA_WIDTH/8)
/* Definitions for peripheral AXI_PERF_MON_0 */
char inbyte(void);
void help(void);
void xTPG_help(void);
void xTPG_config(int FrameSize);
double read_bandwidth=0,write_bandwidth=0;
/* Struct instance for DMA block(s) */
#define PERFMON XPAR_AXI_PERF_MON_0_BASEADDR


extern volatile unsigned xTickCount;
extern XOSD Osd;
unsigned int blending=0;
int OsdInit(int DeviceID);
void OsdConfig(int Width, int Height);
unsigned int prev_tick;
extern unsigned int only_tpg;

void Init_TPG(Xuint32 Framesize)
{
         int i; 

	TPG_RegUpdateDisable(XPAR_TPG_0_BASEADDR);
	TPG_WriteReg(XPAR_TPG_0_BASEADDR, 0x20, Framesize);
	TPG_RegUpdateEnable(XPAR_TPG_0_BASEADDR);
}


void configure_TPG(Xuint32 inchar)
{
         int i; 
	TPG_RegUpdateDisable(XPAR_TPG_0_BASEADDR);
	TPG_WriteReg(XPAR_TPG_0_BASEADDR, 0x100, inchar);
	TPG_RegUpdateEnable(XPAR_TPG_0_BASEADDR);

}
void xTPG_help(void)
{

  print("-----------------------------------------------------\n\r");
  print("-- 		  		   Pattern Menu                 --\n\r");
  print("-----------------------------------------------------\n\r");
  print("\n\r");
  print(" Select option\n\r");
  print(" 0 = Horizontal RAMP\n\r");
  print(" 1 = Vertical RAMP  \n\r");
  print(" 2 = Flat RED\n\r");
  print(" 3 = Flat GREEN\n\r");
  print(" 4 = Flat BLUE\n\r");
  print(" 5 = Color Bars\n\r");
  print(" 6 = Zone Plates\n\r");
  print(" 7 = Tartan Bars\n\r");
  print(" 8 = Cross Hatch\n\r");
  print(" 9 = DDR Bandwidth\n\r");
  print("\n\r");
  print(" q = exit \n\r");
  print(" ?  = help \n\r");
  print("-----------------------------------------------------\n\r");
}

void help(void)
{
  print("\n\r");
  print("-----------------------------------------------------\n\r");
  print("-- Layer Switcher/Performance Menu                 --\n\r");
  print("-----------------------------------------------------\n\r");
  print("\n\r");
  print(" Select option\n\r");
  print(" 0 = Layer 0  - TPG input\n\r");
  print(" 1 = Layer 1  - DVI Input			\n\r");
  print(" 2 = Blending \n\r");
  print("\n\r");
  print(" q = exit \n\r");
  print(" ?  = help \n\r");
  print("-----------------------------------------------------\n\r");
}


void xTPG_main (int width, int height, int resolution, int frame_rate)
{
	Xuint32 Framesize=height<<16|width;
	unsigned char inchar;
	unsigned char select;
        Xuint32 Reg32Value ;
   char string_res[16][20] = { 	"640x480 @ 60 Hz" 	,"720x480 @ 60 Hz" 		,"800x600 @ 60 Hz" ,"1024x768 @ 60 Hz" ,
		   	   	   	   	    	"1280x720 @ 60 Hz"  ,"1280x1024 @ 60 Hz" 	,"1920x1080 @ 60 Hz" ,"1600x1200 @ 60 Hz" ,
		   	   	   	   	    	"640x480 @ 75 Hz" 	,"720x480 @ 75 Hz" 		,"800x600 @ 75 Hz" ,"1024x768 @ 75 Hz" ,
		   	   	   	   	    	"1280x720 @ 75 Hz"	,"1280x1024 @ 75 Hz" 	,"1920x1080 @ 75 Hz" ,"1600x1200 @ 75 Hz"    };

   int vid_clk_freq_Mhz = 185;
   	double Arith_value_frac, g2g_frac;
   	unsigned long long Arith_value, h8_llu, h7_llu;
   	unsigned int metric_count_7h;
   	unsigned int metric_count_7l;
   	unsigned int metric_count_8h;
   	unsigned int metric_count_8l;
   	unsigned int global_clk_count_h;
   	unsigned int global_clk_count_l;
   	int fr0l_g2g_clk_count;
   	int  i;
   		int print_counter;
	xTPG_help();
	 while (1)
   {


	   print(">");
      inchar = inbyte();
      //inchar='9';
      xil_printf("%c\n\r",inchar);
      switch (inchar)
      {
         case 0x1b :
         case 'q' :
            xil_printf("- exit menu -\n\n\r"); return; break;
         case '?' :
         {
            xTPG_help();
            break;
         }
         case 'R' :
         {


            break;
         }
         case 'r' :
         {

            break;
         }
         case '0':  // First layer only
         {

                 configure_TPG(2);




			//XIo_Out32(0x73A00030,0x00FF0101);
            break;
         }
         case '1': // Second layer only
         {

                 configure_TPG(1);

			//XIo_Out32(0x73A00030,0x00FF0103);
            break;
         }
         case '2': // Third layer only
         {

                 configure_TPG(4);


            break;
         }
         case '3': // Fourth layer only
         {

                 configure_TPG(5);

            break;
         }

         case '4': // Fifth layer only
         {

                 configure_TPG(6);

            break;
         }

         case '5': //Split up layers and show at same time
         {
                 configure_TPG(9);

            break;
         }


         case '6':
         {

                 configure_TPG(0xA);
            break;
         }

         case '7':
         {        	 
                 configure_TPG(0xB);

            break;
         }
         case '8':
           {     
                 configure_TPG(0xC);

              break;
           }

         case '9':
           {
                 configure_TPG(0xA);

           	global_clk_count_l = 0;
      	        	 global_clk_count_h = 0;



        *((volatile int*)(PERFMON+0x38))=0xFFF;
        *((volatile int*)(PERFMON+0x300))=0x0020002;
        *((volatile int*)(PERFMON+0x44))=0x03020100;
        *((volatile int*)(PERFMON+0x30))=0x00000001;
        *((volatile int*)(PERFMON+0x34))=0x00000002;
        *((volatile int*)(PERFMON+0x24))=0x05F5E100;   // 100M
        *((volatile int*)(PERFMON+0x28))=0x00000002;
        *((volatile int*)(PERFMON+0x28))=0x00000001;

      	        	 xil_printf("START\n\r");
        *((volatile int*)(PERFMON+0x300))=0x0020002;
	*((volatile int*)(PERFMON+0x300))=0x00010001;
         while((*((volatile int*)(PERFMON+0x38))& 0x00000002)!=0x00000002){
         }
        *((volatile int*)(PERFMON+0x28))=0x00000000;
        *((volatile int*)(PERFMON+0x300))=0x00000000;
	for(i=0;i<1000;i++);

	metric_count_7h = 0;
	metric_count_8h = 0;
	metric_count_7l = *(volatile int *)(PERFMON+0x220) ;
	metric_count_8l = *(volatile int *)(PERFMON+0x230) ;
	global_clk_count_l = *(volatile int *) (PERFMON+0x0004);
	global_clk_count_h = *(volatile int *) (PERFMON+0x0000);
       xil_printf("--GlblCnt : %x%x , Slot1 Wr Byte %x , Rd Byte:%x--\n\r",
    	        global_clk_count_h, global_clk_count_l,metric_count_7l,metric_count_8l
    		);

      	    		 xil_printf("\r\n ---------DDR3, AXI4 Slave Profile Summary........\n");
      	    		 xil_printf("\r\nTheoretical DDR Bandwidth                                    				= 6400000000 bytes/sec\n\r");


      	    		 h7_llu = metric_count_7h ;
      	    		 h8_llu = metric_count_8h ;
      	    		 Arith_value = (metric_count_7l + (h7_llu << 32) + metric_count_8l + (h8_llu << 32)) ;
      	    		 xil_printf("\r\nPractical DDR bandwidth                                          			=  %d bytes/sec\n\r", Arith_value);
      	    		 Arith_value_frac = (double)Arith_value/(double)(64000000) ;
                         unsigned int whole,fract;
                         whole= Arith_value_frac;
                         fract= (Arith_value_frac-whole)*100;
			 xil_printf("\n\rResolution: %s\n\r",string_res[frame_rate*8+resolution]);
      	    		 xil_printf("\r\nPercentage of DDDR Bandwidth consumed by frame of resolution (%s)(Approx.)= %d.%02d  \n\r", string_res[frame_rate*8 + resolution], whole,fract);

      	    		  // reset
      	    		 global_clk_count_l = 0;
      	    		 global_clk_count_h = 0;
                         *((volatile int*)(PERFMON+0x300))=0x0020002;


              break;
           }

      }
   }
}
