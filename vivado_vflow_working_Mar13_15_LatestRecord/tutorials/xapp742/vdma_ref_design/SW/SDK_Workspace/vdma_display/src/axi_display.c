/*
 * Copyright (c) 2013 Xilinx, Inc.  All rights reserved.
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 *
 */

#include <stdio.h>
#include "platform.h"
#include "xparameters.h"
#include "xintc.h"
#include "xosd.h"
#include "ivk_osd.h"
#include "ivk_video_resolution.h"
#include "xtpg_app.h"
#include "xiic.h"
#include "xio.h"

#include "tpg.h"
#include "cresample.h"
#include "rgb2ycrcb.h"
#include "xvtc.h"
#include "xaxivdma.h"



#define PERFMON                          XPAR_AXI_PERF_MON_0_BASEADDR
void exit(int);
int start_main();
int vtc_config(Xuint32 resolution);


void xTPG_main (int width, int height,int resolution,int frame_rate);

u32 FRAME_HORIZONTAL_LEN = 0x1680;
u32 FRAME_VERTICAL_LEN   = 0x438;
u32 FRAME_LENGTH         =0x7EA000;
u32 SUBFRAME_HORIZONTAL_SIZE; 
u32 SUBFRAME_VERTICAL_SIZE   ;

#define SUBFRAME_START_OFFSET    0//(FRAME_HORIZONTAL_LEN * 5 + 32)

#define NUMBER_OF_READ_FRAMES    XPAR_AXIVDMA_0_NUM_FSTORES
#define NUMBER_OF_WRITE_FRAMES   XPAR_AXIVDMA_0_NUM_FSTORES

extern XOSD Osd;
#define OSD_OUTPUT_RESOLUTION_720P 4
#define XOSD_INS_ENTRY_NUMBER   48
#define OSD_GC_LAYER 0

#define NUMBER_OF_DMAS 			XPAR_XAXIVDMA_NUM_INSTANCES
#define NUMBER_OF_DMAS_MAX		NUMBER_OF_DMAS

#define DDR_MEMORY			(XPAR_MIG7SERIES_0_BASEADDR +  0x1000000)
/*
 * Device instance definitions
 */
/* Struct instance for DMA block(s) */
struct dma_chan_parms {

	u32 Dma_Base_Addr;
	u32 Perf_Dma_Base_Addr;
	u32 AXIVDMA_DEVICE_ID;
	u32 Tx_Intr;
	u32 Rx_Intr;
    u32 RD_ADDR_BASE;
    u32 WR_ADDR_BASE;
    u32 TX_BD_ADDR_BASE;
    u32 RX_BD_ADDR_BASE;
	u32 BlockStartOffset;
	u32 BlockHoriz;
	u32 BlockVert;
	XAxiVdma AxiVdma;
	XAxiVdma_DmaSetup ReadCfg;
	XAxiVdma_DmaSetup WriteCfg;
	XAxiVdma_Config *Config;
	XAxiVdma_FrameCounter FrameCfg;
};

struct dma_chan_parms dma_struct[NUMBER_OF_DMAS_MAX];

typedef enum
{
	ONLY_READ=1,
	ONLY_WRITE,
	BOTH
}vdma_run_mode;

/* Transfer statics
 */


extern XVtc TimeBaseGen;
XIntc sys_intc; // in ivk_video_resolution.c
u16 DeviceId = XPAR_INTC_0_DEVICE_ID;

int tbgen_fsync_cnt = 0;
#define SET 1
#define SET7 0

#define IIC_BASE_ADDRESS	XPAR_IIC_0_BASEADDR

#define IIC_DEVICE_ID               XPAR_IIC_0_DEVICE_ID
#define INTC_DEVICE_ID              XPAR_INTC_0_DEVICE_ID
#define IIC_INTR_ID                 XPAR_INTC_0_IIC_0_VEC_ID

/*
 * The Starting address in the IIC EEPROM on which this test is performed.
 */
#define EEPROM_TEST_START_ADDRESS	0x80

/*
 * The following constant defines the address of the IIC Slave device on the
 * IIC bus. Note that since the address is only 7 bits, this constant is the
 * address divided by 2.
 * The 7 bit IIC Slave address of the IIC EEPROM on the ML300/ML310/ML403/ML410/
 * ML501/ML505/ML507/ML510 boards is 0x50. The 7 bit IIC Slave address of the IIC
 * EEPROM on the ML605/SP601/SP605 boards is 0x54.
 * Please refer the User Guide's of the respective boards for further
 * information about the IIC slave address of IIC EEPROM's.
 */
#define EEPROM_ADDRESS		0x50


/*
 * The page size determines how much data should be written at a time.
 * The ML310/ML300 board supports a page size of 32 and 16.
 * The write function should be called with this as a maximum byte count.
 */
#define PAGE_SIZE	16

#define IIC_SLAVE_ADDRESS	1

// PCA9548 8-port IIC Switch
#define IIC_SWITCH_ADDRESS 0x74
// Connected to IIC Buses
// Bus 0
#define IIC_SI570_ADDRESS  0x5D
// Bus 1
#define IIC_FMC_HPC_ADDRESS 0x70
// Bus 2
#define IIC_FMC_LPC_ADDRESS 0x70
// Bus 3
#define IIC_EEPROM_ADDRESS 0x54
// Bus 4
#define IIC_SFP_ADDRESS 0x50
// Bus 5
#define IIC_ADV7511_ADDRESS 0x39
// Bus 6
#define IIC_DDR3_SPD_ADDRESS 0x50
#define IIC_DDR3_TEMP_ADDRESS 0x18
// Bus 7
#define IIC_SI5326_ADDRESS 0x50

#define IIC_BUS_0 0x01
#define IIC_BUS_1 0x02
#define IIC_BUS_2 0x04
#define IIC_BUS_3 0x08
#define IIC_BUS_4 0x10
#define IIC_BUS_5 0x20
#define IIC_BUS_6 0x40
#define IIC_BUS_7 0x80
/************************** Variable Definitions *****************************/
extern char inbyte(void);
extern void outbyte(char c);

typedef u8 AddressType;
typedef struct {
	u8 addr;
	u8 data;
	u8 init;
} HDMI_REG;

#define NUMBER_OF_HDMI_REGS  56


 HDMI_REG hdmi_iic[NUMBER_OF_HDMI_REGS] =
{
	    {0x41, 0x00, 0x10}, // Power Down Control
	                        //    R0x41[  6] = PowerDown = 0 (power-up)
	    {0xD6, 0x00, 0xC0}, // HPD Control
	                        //    R0xD6[7:6] = HPD Control = 11 (always high)
	    {0x15, 0x00, 0x01}, // Input YCbCr 4:2:2 with separate syncs
	    {0x16, 0x00, 0x3C}, // Output format 444, Input Color Depth = 8
	                        //    R0x16[  7] = Output Video Format = 0 (444)
	                        //    R0x16[5:4] = Input Video Color Depth = 11 (8 bits/color)
	                        //    R0x16[3:2] = Input Video Style = 11 (style 3)
	                        //    R0x16[  1] = DDR Input Edge = 0 (falling edge)
	                        //    R0x16[  0] = Output Color Space = 0 (RGB)
	    {0x18, 0x00, 0xAB}, // Color Space Conversion
	                        //    R0x18[  7] = CSC enable = 1 (CSC enabled)
	                        //    R0x18[6:5] = CSC Scaling Factor = 01 (+/- 2.0, -8192 - 8190)
	                        //    R0x18[4:0] = CSC coefficient A1[12:8]
	    {0x19, 0x00, 0x37}, //    R0x19[7:0] = CSC coefficient A1[ 7:0]
	    {0x1A, 0x00, 0x08}, //    R0x1A[  5] = CSC coefficient update
	                        //    R0x1A[4:0] = CSC coefficient A2[12:8]
	    {0x1B, 0x00, 0x00}, //    R0x1B[7:0] = CSC coefficient A2[ 7:0]
	    {0x1C, 0x00, 0x00}, //    R0x1C[4:0] = CSC coefficient A3[12:8]
	    {0x1D, 0x00, 0x00}, //    R0x1D[7:0] = CSC coefficient A3[ 7:0]
	    {0x1E, 0x00, 0x1A}, //    R0x1E[4:0] = CSC coefficient A4[12:8]
	    {0x1F, 0x00, 0x86}, //    R0x1F[7:0] = CSC coefficient A4[ 7:0]
	    {0x20, 0x00, 0x1A}, //    R0x20[4:0] = CSC coefficient B1[12:8]
	    {0x21, 0x00, 0x49}, //    R0x21[7:0] = CSC coefficient B1[ 7:0]
	    {0x22, 0x00, 0x08}, //    R0x22[4:0] = CSC coefficient B2[12:8]
	    {0x23, 0x00, 0x00}, //    R0x23[7:0] = CSC coefficient B2[ 7:0]
	    {0x24, 0x00, 0x1D}, //    R0x24[4:0] = CSC coefficient B3[12:8]
	    {0x25, 0x00, 0x3F}, //    R0x25[7:0] = CSC coefficient B3[ 7:0]
	    {0x26, 0x00, 0x04}, //    R0x26[4:0] = CSC coefficient B4[12:8]
	    {0x27, 0x00, 0x22}, //    R0x27[7:0] = CSC coefficient B4[ 7:0]
	    {0x28, 0x00, 0x00}, //    R0x28[4:0] = CSC coefficient C1[12:8]
	    {0x29, 0x00, 0x00}, //    R0x29[7:0] = CSC coefficient C1[ 7:0]
	    {0x2A, 0x00, 0x08}, //    R0x2A[4:0] = CSC coefficient C2[12:8]
	    {0x2B, 0x00, 0x00}, //    R0x2B[7:0] = CSC coefficient C2[ 7:0]
	    {0x2C, 0x00, 0x0E}, //    R0x2C[4:0] = CSC coefficient C3[12:8]
	    {0x2D, 0x00, 0x2D}, //    R0x2D[7:0] = CSC coefficient C3[ 7:0]
	    {0x2E, 0x00, 0x19}, //    R0x2E[4:0] = CSC coefficient C4[12:8]
	    {0x2F, 0x00, 0x14}, //    R0x2F[7:0] = CSC coefficient C4[ 7:0]
	    {0x48, 0x00, 0x08}, // Video Input Justification
	                        //    R0x48[4:3] = Video Input Justification = 01 (right justified)
	    {0x55, 0x00, 0x00}, // Set RGB in AVinfo Frame
	                        //    R0x55[6:5] = Output Format = 00 (RGB)
	    {0x56, 0x00, 0x28}, // Aspect Ratio
	                        //    R0x56[5:4] = Picture Aspect Ratio = 10 (16:9)
	                        //    R0x56[3:0] = Active Format Aspect Ratio = 1000 (Same as Aspect Ratio)
	    {0x98, 0x00, 0x03}, // ADI Recommended Write
	    {0x9A, 0x00, 0xE0}, // ADI Recommended Write
	    {0x9C, 0x00, 0x30}, // PLL Filter R1 Value
	    {0x9D, 0x00, 0x61}, // Set clock divide
	    {0xA2, 0x00, 0xA4}, // ADI Recommended Write
	    {0xA3, 0x00, 0xA4}, // ADI Recommended Write
	    {0xAF, 0x00, 0x04}, // HDMI/DVI Modes
	                        //    R0xAF[  7] = HDCP Enable = 0 (HDCP disabled)
	                        //    R0xAF[  4] = Frame Encryption = 0 (Current frame NOT HDCP encrypted)
	                        //    R0xAF[3:2] = 01 (fixed)
	                        //    R0xAF[  1] = HDMI/DVI Mode Select = 0 (DVI Mode)
	    {0xE0, 0x00, 0xD0}, // Must be set to 0xD0 for proper operation
	    {0xF9, 0x00, 0x00}  // Fixed I2C Address (This should be set to a non-conflicting I2C address)

};

u8 EepromIicAddr; /* Variable for storing Eeprom IIC address */

/************************** Function Prototypes ******************************/

int IicLowLevelDynEeprom();

u8 EepromReadByte(AddressType Address, u8 *BufferPtr, u8 ByteCount);
u8 EepromWriteByte(AddressType Address, u8 *BufferPtr, u8 ByteCount);

/************************** Variable Definitions *****************************/


typedef struct {
	u16 horiz_lines;
	u16 horiz_front_porch;
	u16 horiz_back_porch;
	u16 horiz_sync;
	u16 vert_lines;
	u16 vert_front_porch;
	u16 vert_back_porch;
	u16 vert_sync;
} VIDEO_CONFIG;

void print(char *str);
u8 WriteBuffer[sizeof(AddressType)+PAGE_SIZE]; /* Write buffer for writing a page. */

u8 ReadBuffer[PAGE_SIZE]; /* Read buffer for reading a page.  */

u8 DataBuf[PAGE_SIZE];

#define BUF_SIZE 40
u8 UpdateBuffer[sizeof(AddressType) + PAGE_SIZE];



int gethex2(char s[]);
int read_si570();
int write_si570();



int IicEepromExample();

int EepromWriteData(u16 ByteCount);

int EepromReadData(u8 *BufferPtr, u16 ByteCount);

int EepromReadData2(AddressType addr, u8 *BufferPtr, u16 ByteCount);
static int SetupInterruptSystem(XIic * IicInstPtr);

static void SendHandler(XIic * InstancePtr);

static void ReceiveHandler(XIic * InstancePtr);

static void StatusHandler(XIic * InstancePtr, int Event);
void print_resolution_help(void);
void print_frame_rate_help(void);
void print_resolution_help(void)
{

  print("-----------------------------------------------------\n\r");
  print("-- 			Resolution Menu                 --\n\r");
  print("-----------------------------------------------------\n\r");
  print("\n\r");
  print(" Select option\n\r");
  print(" 0 = 640x480 \n\r");
  print(" 1 = 720x480 \n\r");
  print(" 2 = 800x600 \n\r");
  print(" 3 = 1024x768\n\r");
  print(" 4 = 1280x720\n\r");
  print(" 5 = 1280x1024\n\r");
  print(" 6 = 1920x1080\n\r");
  print(" 7 = 1600x1200\n\r");
  print("\n\r");
  print("-----------------------------------------------------\n\r");
}
void print_frame_rate_help(void)
{

  print("-----------------------------------------------------\n\r");
  print("--                 Frame Rate Menu                 --\n\r");
  print("-----------------------------------------------------\n\r");
  print("\n\r");
  print(" Select option for Frame rate \n\r");
  print(" a = 60 Hz\n\r");
  print(" b = 75 Hz\n\r");
  print("\n\r");
  print("-----------------------------------------------------\n\r");
}
void reset_vidpipe()
{
    int i;
   // FSync reset VTC
    *(unsigned int *)(XPAR_VTC_0_BASEADDR) |= 0x80000000;
   // FSync reset OSD
    *(unsigned int *)(XPAR_OSD_0_BASEADDR) |= 0x80000000;
   // FSync reset RESAMPLE
    CRESAMPLE_Reset(XPAR_CRESAMPLE_0_BASEADDR);
   // FSync reset RGB2YCRCR
    RGB_Reset(XPAR_RGB2YCRCB_0_BASEADDR);
   // Soft reset VDMA
    *(unsigned int *)(XPAR_AXIVDMA_0_BASEADDR) |= 0x4;
    *(unsigned int *)(XPAR_AXIVDMA_0_BASEADDR + 0x30) |= 0x4;
   // FSync reset TPG
    TPG_Reset(XPAR_TPG_0_BASEADDR);

   while((*(unsigned int*)(XPAR_TPG_0_BASEADDR)& 0x80000000)==0x80000000);
}


void configure_rgb2ycrcb(Xuint32 Framesize)
{
         RGB_Reset(XPAR_RGB2YCRCB_0_BASEADDR);
         while(RGB_ReadReg(XPAR_RGB2YCRCB_0_BASEADDR,0)& 0x80000000 ==0x80000000 );
	RGB_WriteReg(XPAR_RGB2YCRCB_0_BASEADDR, 0x20, Framesize);
	RGB_RegUpdateEnable(XPAR_RGB2YCRCB_0_BASEADDR);
	xil_printf("RGB Frame Size: %x \n\r",RGB_ReadReg(XPAR_RGB2YCRCB_0_BASEADDR, 0x20));

}

void configure_resampler(Xuint32 Framesize)
{
        CRESAMPLE_Reset(XPAR_CRESAMPLE_0_BASEADDR);
        while(CRESAMPLE_ReadReg(XPAR_CRESAMPLE_0_BASEADDR,0)& 0x80000000 ==0x80000000 );
	CRESAMPLE_WriteReg(XPAR_CRESAMPLE_0_BASEADDR, 0x20, Framesize);
	CRESAMPLE_RegUpdateEnable(XPAR_CRESAMPLE_0_BASEADDR);
	xil_printf("CRESAMPLE: Frame Size: %x \n\r",CRESAMPLE_ReadReg(XPAR_CRESAMPLE_0_BASEADDR, 0x20));

}
 void enable_rgb_cresample()
{
	CRESAMPLE_Enable(XPAR_CRESAMPLE_0_BASEADDR);
	RGB_Enable(XPAR_RGB2YCRCB_0_BASEADDR);
}
 void enable_tpg()
{
        int i=0;
        TPG_Enable(XPAR_TPG_0_BASEADDR);
}

XIic IicInstance;		/* The instance of the IIC device. */
XIntc InterruptController;	/* The instance of the Interrupt Controller. */

volatile u8 TransmitComplete;	/* Flag to check completion of Transmission */
volatile u8 ReceiveComplete;	/* Flag to check completion of Reception */

#define NUM_VIDEO_MODES 16
#define NUM_CLOCK_REGS 6
u8 si570_reg_value[NUM_VIDEO_MODES][NUM_CLOCK_REGS] = {
        // 0,     1,     2,      3,      4,      5,
		{228,	194,	227,	52,	     97,	250}, // 640x480   @ 60 Hz
		{164,	194,	169,	21,	    172,	17},  // 720x480   @ 60 Hz
		{163,	66,	    189,	230,	194,	6},   // 800x600   @ 60 Hz
		{98,	194,	252,	91,	     25,	91},  // 1024x768  @ 60 Hz
		{225,	66,	    174,	19,	      4,	137}, // 1280x720  @ 60 Hz
		{65,	194,	215,	142,	215,	213}, // 1280x1024 @ 60 Hz
		{160,	194,	233,	236,	182,	167}, // 1920x1080 @ 60 Hz
		{33,	66,	    168,	103,	125,	24},  // 1600x1200 @ 60 Hz

		{227,	194,	227,	52,	     97,	250}, // 640x480   @ 75 Hz
		{163,	194,	169,	21,	    172,	17},  // 720x480   @ 75 Hz
		{162,	194,	240,	9,	    134,	190}, // 800x600   @ 75 Hz
		{225,	66,	    238,	180,	230,	158}, // 1024x768  @ 75 Hz
		{161,	66,	    189,	170,	185,	1},   // 1280x720  @ 75 Hz
		{160,	194,	170,	21,   	234,	88},  // 1280x1024 @ 75 Hz
		{96,	194,	215,	167,	144,	115}, // 1920x1080 @ 75 Hz
		{1,	     66,	168,	103,	125,	24}   // 1600x1200 @ 75 Hz

};

#define RESOLUTIONS   8
#define VIDEO_TIMING_PARAMS		10
 u16 resolutions[RESOLUTIONS][VIDEO_TIMING_PARAMS] = {
   // vav,  vfp,  vsw,  vbp,  vsp,  hav,  hfp,  hsw,  hbp,  hsp
   {  480,   3,    4,   13,    1,  640,   16,   64,   80,    1  },   // 0:VIDEO_RESOLUTION_VGA
   {  480,    9,    6,   30,    1,  720,   16,   62,   60,    1 }, // 1:VIDEO_RESOLUTION_NTSC
   {  600,    1,    4,   23,    1,  800,   40,  128,   88,    1 }, // 2:VIDEO_RESOLUTION_SVGA
   {  768,    3,    6,   29,    1, 1024,   24,  136,  160,    1 }, // 3:VIDEO_RESOLUTION_XGA
   {  720,    5,    5,   20,    1, 1280,  110,   40,  220,    1 }, // 4:VIDEO_RESOLUTION_720P
   { 1024,    1,    3,   26,    1, 1280,   48,  184,  200,    1 }, // 5:VIDEO_RESOLUTION_SXGA
   { 1080,    4,    5,   36,    1, 1920,   88,   44,  148,    1 }, // 6:VIDEO_RESOLUTION_1080P
   { 1200,    1,    3,   46,    1, 1600,   64,  192,  304,    1 }  // 7:VIDEO_RESOLUTION_UXGA
};

#define BOUNDRY_1_VDMA_FRAME		(0x8000000)
#define IIC_SCLK_RATE		100000

/***************************************************************************
 *    WriteSetup: It will configure the VDMA for write.
 *                                                                 *
 *    dma_chan_parms: This is structure pointer that stores the
 *    handle for DMA instances.
 *
 *                                                                       *
***************************************************************************/

static int WriteSetup(struct dma_chan_parms define_function[NUMBER_OF_DMAS])
{
        int i;
        u32 Addr;
        int Status;
		int n;
		for (n = 0; n < NUMBER_OF_DMAS; n++)
		{
                        //if(n==0) continue;
			define_function[n].WriteCfg.VertSizeInput = SUBFRAME_VERTICAL_SIZE;
			define_function[n].WriteCfg.HoriSizeInput = SUBFRAME_HORIZONTAL_SIZE;

			define_function[n].WriteCfg.Stride = FRAME_HORIZONTAL_LEN;
			define_function[n].WriteCfg.FrameDelay = 0;  /* This example does not test frame delay */

			define_function[n].WriteCfg.EnableCircularBuf = 1;
			//   WriteCfg.EnableSync = 0;  /* No Gen-Lock */
			define_function[n].WriteCfg.EnableSync = 1;  /* Gen-Lock */

			//   WriteCfg.PointNum = 0;    /* No Gen-Lock */
			define_function[n].WriteCfg.PointNum = 0;    /* No Gen-Lock */
			define_function[n].WriteCfg.EnableFrameCounter = 0; /* Endless transfers */

			define_function[n].WriteCfg.FixedFrameStoreAddr = 0; /* We are not doing parking */

			Status = XAxiVdma_DmaConfig(&define_function[n].AxiVdma, XAXIVDMA_WRITE, &define_function[n].WriteCfg);
			if (Status != XST_SUCCESS)
			{
				xil_printf("Write channel config failed %d\r\n", Status);

                return XST_FAILURE;
			}


        /* Initialize buffer addresses
         *
         * Use physical addresses
         */
        Addr = define_function[n].WR_ADDR_BASE + define_function[n].BlockStartOffset;
        for(i = 0; i < NUMBER_OF_WRITE_FRAMES; i++) {
                define_function[n].WriteCfg.FrameStoreStartAddr[i] = Addr;
                Addr += FRAME_LENGTH ;
        }


        /* Set the buffer addresses for transfer in the DMA engine
         */
        Status = XAxiVdma_DmaSetBufferAddr(&define_function[n].AxiVdma, XAXIVDMA_WRITE,
                define_function[n].WriteCfg.FrameStoreStartAddr);
        if (Status != XST_SUCCESS)
        {
        	xil_printf("Write channel set buffer address failed %d\r\n", Status);
             return XST_FAILURE;
        }


}
        return XST_SUCCESS;
}
/***************************************************************************
 *    ReadSetup: It will configure the VDMA for read.
 *                                                                 *
 *    dma_chan_parms: This is structure pointer that stores the
 *    handle for DMA instances.
 *
 *                                                                       *
***************************************************************************/

static int ReadSetup(struct dma_chan_parms define_function[NUMBER_OF_DMAS])
{
        int i;
        u32 Addr;
        int Status;
        int n;
        int data_fill,*dst_data_fill;

	for (n = 0; n < NUMBER_OF_DMAS; n++)
	{

		//if(n==1)
			//break;
        define_function[n].ReadCfg.VertSizeInput = SUBFRAME_VERTICAL_SIZE;
        define_function[n].ReadCfg.HoriSizeInput = SUBFRAME_HORIZONTAL_SIZE;

        define_function[n].ReadCfg.Stride = FRAME_HORIZONTAL_LEN;
        define_function[n].ReadCfg.FrameDelay = 1;  /* This example does not test frame delay */

        define_function[n].ReadCfg.EnableCircularBuf = 1;
        define_function[n].ReadCfg.EnableSync = 0;  /* Gen-Lock */

        define_function[n].ReadCfg.PointNum = 0;    /* No Gen-Lock */
        define_function[n].ReadCfg.EnableFrameCounter = 0; /* Endless transfers */

        define_function[n].ReadCfg.FixedFrameStoreAddr = 0; /* We are not doing parking */

        Status = XAxiVdma_DmaConfig(&define_function[n].AxiVdma, XAXIVDMA_READ, &define_function[n].ReadCfg);
        if (Status != XST_SUCCESS) {
        	xil_printf("Read channel config failed %d\n\r", Status);

                return XST_FAILURE;
        }
        /* Initialize buffer addresses
         *
         * These addresses are physical addresses
         */
        Addr = define_function[n].RD_ADDR_BASE  + define_function[n].BlockStartOffset;
        for(i = 0; i < NUMBER_OF_READ_FRAMES; i++) {
                define_function[n].ReadCfg.FrameStoreStartAddr[i] = Addr;
#if 0
                dst_data_fill = (unsigned int *)Addr;
                for(data_fill=0;data_fill<FRAME_LENGTH;)
                {
                	dst_data_fill[data_fill] = 0xDEADBEEF;
                	data_fill++;
                	dst_data_fill[data_fill] = 0xDEADBEEF;
                	data_fill++;
                	dst_data_fill[data_fill] = 0xDEADBEEF;
                	data_fill++;
                	dst_data_fill[data_fill] = 0xDEADBEEF;
                	data_fill++;
                }
#endif
                Addr += FRAME_LENGTH ;
        }

        /* Set the buffer addresses for transfer in the DMA engine
         * The buffer addresses are physical addresses
         */
        Status = XAxiVdma_DmaSetBufferAddr(&define_function[n].AxiVdma, XAXIVDMA_READ,
                define_function[n].ReadCfg.FrameStoreStartAddr);
        if (Status != XST_SUCCESS) {
        	xil_printf("Read channel set buffer address failed %d\n\r", Status);

                return XST_FAILURE;
        }
        }
        return XST_SUCCESS;
}

/***************************************************************************
 *    StartTransfer: It will start the VDMA.
 *                                                                 *
 *    XAxiVdma*: It is instance of VDMA that needs to be started.
 *
 *                                                                       *
***************************************************************************/

int StartTransfer(XAxiVdma * InstancePtr, vdma_run_mode mode)
{
        int Status;

        xil_printf("VDMA Baseaddress 0x%x\r\n", InstancePtr->BaseAddr);
        xil_printf("VDMA SG Enable %d\r\n", InstancePtr->HasSG);
        xil_printf("VDMA MaxNumFrames %d\r\n", InstancePtr->MaxNumFrames);
        if((mode==BOTH)||(mode==ONLY_WRITE))
        {
			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_WRITE);
			if (Status != XST_SUCCESS) {
				xil_printf("Start Write transfer failed %d\r\n", Status);

					return XST_FAILURE;
			}
        }
        if((mode==BOTH)||(mode==ONLY_READ))
        {
			Status = XAxiVdma_DmaStart(InstancePtr, XAXIVDMA_READ);
			if (Status != XST_SUCCESS) {
				xil_printf("Start read transfer failed %d\n\r", Status);

					return XST_FAILURE;
			}
        }
        return XST_SUCCESS;
}



/***************************************************************************
 *    configure_vdma: It will configure the VDMA.
 *                                                                 *
 *    start_read_addr:Starting address of the read frame.
 *    start_write_addr: Starting address of the write frame.
 *
 *                                                                       *
***************************************************************************/

int configure_vdma(unsigned int start_read_addr, unsigned int start_write_addr)
{
	int i,Status;
	for(i=0;i<XPAR_XAXIVDMA_NUM_INSTANCES;i++)
	{
		 dma_struct[i].Config = XAxiVdma_LookupConfig(i);
		 if (!dma_struct[i].Config)
		 {
			 xil_printf("No video DMA found for ID %d\n\r", i);
				 return 1;
		 }


		 /* Initialize DMA engine */
		 Status = XAxiVdma_CfgInitialize(&dma_struct[i].AxiVdma, dma_struct[i].Config, dma_struct[i].Config->BaseAddress);
		 if (Status != XST_SUCCESS)
		 {
			 xil_printf("Initialization failed %d\n\r", Status);
				 return 1;
		 }
		/* User Must Set Values For Each Struct */
		/* Device ID */
		dma_struct[i].AXIVDMA_DEVICE_ID = i;
		/* Read Base Address */
		dma_struct[i].RD_ADDR_BASE = start_read_addr + i*BOUNDRY_1_VDMA_FRAME;
		/* Write Base Address */
		dma_struct[i].WR_ADDR_BASE = start_write_addr+ i*BOUNDRY_1_VDMA_FRAME;

		dma_struct[i].BlockStartOffset = SUBFRAME_START_OFFSET;
		dma_struct[i].BlockHoriz = SUBFRAME_HORIZONTAL_SIZE;
		dma_struct[i].BlockVert = SUBFRAME_VERTICAL_SIZE;


	}
	return 0;
}


int IicLowLevelDynEeprom() {
//	u8 BytesRead;
	u8 BytesWritten;
	u32 StatusReg;
	u8 Index;
	int i;
	int Status;
	EepromIicAddr = IIC_SWITCH_ADDRESS;



	/*
	 * Initialize the IIC Core.
	 */
	Status = XIic_DynInit(IIC_BASE_ADDRESS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Make sure all the Fifo's are cleared and Bus is Not busy.
	 */
	while (((StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS,
			XIIC_SR_REG_OFFSET)) & (XIIC_SR_RX_FIFO_EMPTY_MASK
			| XIIC_SR_TX_FIFO_EMPTY_MASK | XIIC_SR_BUS_BUSY_MASK))
			!= (XIIC_SR_RX_FIFO_EMPTY_MASK | XIIC_SR_TX_FIFO_EMPTY_MASK)) {

	}

	/*
	 * Initialize the data to written and the read buffer.
	 */
	for (Index = 0; Index < PAGE_SIZE; Index++) {
		WriteBuffer[Index] = Index;
		ReadBuffer[Index] = 0;
		DataBuf[Index] = 0;
	}
	/*
	 * Write to the IIC SWITCH.
	 */
	EepromIicAddr = IIC_SWITCH_ADDRESS; // Alternate use of Write routine
	WriteBuffer[0] = 0x20;
	BytesWritten = EepromWriteByte(0x20, DataBuf, 0);
	/*
	 * Write Initialization Sequence to ADV7511.
	 */
	EepromIicAddr = IIC_ADV7511_ADDRESS;
	for (Index = 0; Index < NUMBER_OF_HDMI_REGS; Index++) {
		BytesWritten = EepromWriteByte(hdmi_iic[Index].addr,
				&hdmi_iic[Index].init, 1);
		for(i = 0; i<50000; i++);
	}




	return XST_SUCCESS;
}

/***************************************************************************
 *    start_main: This is the main thread that will do all initializations.
 *    It will call configure functions for other IP
 *                                                                 *
 *
 *
 *                                                                       *
***************************************************************************/
#define TPG_OUT_ADDRESS						DDR_MEMORY
#define MAIN_PIPELINE_VDMA_ADDRESS_READ		TPG_OUT_ADDRESS
#define MAIN_PIPELINE_VDMA_ADDRESS_WRITE	(DDR_MEMORY + BOUNDRY_1_VDMA_FRAME)

unsigned int delay = 0;
int main()
{
    int frame_width, frame_height;
    int Status,input,reg_value;
    int fr_rate = 0, chartodec = 0;
    int resolution = 6, i=0;
     char inchar;
    Xuint32 Framesize;
    Xuint32 Reg32Value;
    Xil_DCacheDisable();

     xil_printf("\r\n--- Entering main() --- \n\r");

        // Programming HDMI
        Status = IicLowLevelDynEeprom();
        if (Status != XST_SUCCESS) {
        	return XST_FAILURE;
        }
        xil_printf("HDMI Config done\n\r");
      while(1)
      {
        delay=0;
    	print_resolution_help();
    	print(">");
           chartodec = inbyte();
    	resolution = chartodec - '0';
    	if(resolution < 8)
    		xil_printf("%d\n\r",resolution);
    	else
    	{
    		xil_printf("invalid number entered\n\r");
    		xil_printf("Default Resolution is 640x480\n\r");
    		resolution = 0;
    		//break;
    	}
    	print_frame_rate_help();
    	print(">");
           chartodec = inbyte();
    	fr_rate =  (chartodec - 'a');
    	if(fr_rate < 2)
    		xil_printf("%d\n\r",fr_rate);
    	else
    	{
    		xil_printf("invalid number entered\n\r");
    		xil_printf("Default frame rate is 60 Hz\n\r");
    		fr_rate = 0;
    		//break;
    	}
/************************  Resetting Vid Pipe`& updating video params*********************************/
        reset_vidpipe();

    	FRAME_HORIZONTAL_LEN = (u32) (resolutions[resolution][5] * 3);  //in bytes. Pixel is fixed to 32 bits
    	FRAME_VERTICAL_LEN   = (u32) resolutions[resolution][0];
    	SUBFRAME_HORIZONTAL_SIZE   = FRAME_HORIZONTAL_LEN; 
    	SUBFRAME_VERTICAL_SIZE     = FRAME_VERTICAL_LEN; 
    	FRAME_LENGTH     = FRAME_VERTICAL_LEN * FRAME_HORIZONTAL_LEN; 
    		xil_printf("Resolution: %dx%d\n\r",FRAME_HORIZONTAL_LEN,FRAME_VERTICAL_LEN);

/************************  Update params, SI570 clk*********************************/
    	// Programming On-Board Clock Generator
        for( i = 0; i < 6; i++ )
        {
        	UpdateBuffer[i] = si570_reg_value[resolution + (fr_rate*8)][i];
        }
      	write_si570();
            xil_printf("SI570 Config done\n\r Resetting Video Pipe");
   
        frame_width       = ivk_vres_get_width(resolution);
        frame_height      = ivk_vres_get_height(resolution);
	Framesize=frame_height<<16|frame_width;

/************************ Init All Vid Pipe cores*********************************/
	xil_printf("Starting VTC initialization\r\n");
	vtc_config(resolution);
	xil_printf("VTC initialization is done\r\n");
	xil_printf("Starting OSD initialization\r\n");
	ivk_osd_init( resolution );
	configure_resampler(Framesize);
	xil_printf("CRESAMPLE initialization is done\r\n");
	configure_rgb2ycrcb(Framesize);
	xil_printf("RGB2YCBCR initialization is done\r\n");
	xil_printf("Starting VDMA Init\r\n");
	configure_vdma(DDR_MEMORY, DDR_MEMORY);

	 /* Setup the write channel     */
	Status = WriteSetup(dma_struct);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Write channel setup failed %d\r\n", Status);
		return 1;
	}
	xil_printf("Write channel setup Done \r\n");
	//print("setup VDMA read\r\n");
	   /* Setup the read channel */
	Status = ReadSetup(dma_struct);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Read channel setup failed %d\n\r", Status);
		return 1;
	}
	xil_printf("Read channel setup Done \r\n");
	xil_printf("VDMA initialization done\r\n");
         Init_TPG(Framesize); 

/***************************** Enable  Video Pipe cores *******************************/
	/* Enabling only the  VTC Generator */
	reg_value = XVtc_ReadReg(XPAR_VTC_0_BASEADDR , XVTC_CTL);
	reg_value |=0x1;
	reg_value &=~0x8;
	XVtc_WriteReg(XPAR_VTC_0_BASEADDR , XVTC_CTL, reg_value);

        /**** Enable OSD *****/
          ivk_osd_enable();
        /**** Enable CRESAMPLE & RGB2YCBCr *****/
        enable_rgb_cresample();
        
        /**** Enable VDMA ******/ 
	StartTransfer(&dma_struct[0].AxiVdma,ONLY_READ);
	StartTransfer(&dma_struct[0].AxiVdma ,ONLY_WRITE);
        /**** Enable TPG ******/ 
        enable_tpg();
	xil_printf("Starting TPG \r\n");

            xTPG_main(frame_width,frame_height,resolution,fr_rate);

	print("*************************Test Done: ********************\r\n");
  }
    return 0;
}
/*
 * *********************************************************
 * EepromReadData2 with address added as an input parameter
 * *********************************************************
 */
int EepromReadData2(AddressType addr, u8 *BufferPtr, u16 ByteCount)
{
	int Status;
//	AddressType Address = EEPROM_TEST_START_ADDRESS;
	AddressType Address;
	Address = addr;

	/*
	 * Set the Defaults.
	 */
	ReceiveComplete = 1;

	/*
	 * Position the Pointer in EEPROM.
	 */
	//xil_printf("st11\r\n");
	if (sizeof(Address) == 1) {
		WriteBuffer[0] = (u8) (Address);
	}
	else {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
	}
	//xil_printf("st0\r\n");
	Status = EepromWriteData(sizeof(Address));
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//xil_printf("st wr read2\r\n");
	/*
	 * Start the IIC device.
	 */
	Status = XIic_Start(&IicInstance);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//xil_printf("start read2\r\n");

	/*
	 * Receive the Data.
	 */
	Status = XIic_MasterRecv(&IicInstance, BufferPtr, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Wait till all the data is received.
	 */
	//xil_printf("mst rec\r\n");
	while ((ReceiveComplete) || (XIic_IsIicBusy(&IicInstance) == TRUE)) {

	}
	//xil_printf("rec cmpl\r\n");
	/*
	 * Stop the IIC device.
	 */
	Status = XIic_Stop(&IicInstance);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}


int EepromWriteData(u16 ByteCount)
{
	int Status;

	/*
	 * Set the defaults.
	 */
	TransmitComplete = 1;
	IicInstance.Stats.TxErrors = 0;

	/*
	 * Start the IIC device.
	 */
	//xil_printf("sat0\r\n");
	Status = XIic_Start(&IicInstance);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//xil_printf("sat1\r\n");
	/*
	 * Send the Data.
	 */
	Status = XIic_MasterSend(&IicInstance, WriteBuffer, ByteCount);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//xil_printf("sat2\r\n");
	/*
	 * Wait till the transmission is completed.
	 */
	while ((TransmitComplete) || (XIic_IsIicBusy(&IicInstance) == TRUE)) {
		/*
		 * This condition is required to be checked in the case where we
		 * are writing two consecutive buffers of data to the EEPROM.
		 * The EEPROM takes about 2 milliseconds time to update the data
		 * internally after a STOP has been sent on the bus.
		 * A NACK will be generated in the case of a second write before
		 * the EEPROM updates the data internally resulting in a
		 * Transmission Error.
		 */
		if (IicInstance.Stats.TxErrors != 0) {


			/*
			 * Enable the IIC device.
			 */
			Status = XIic_Start(&IicInstance);
			if (Status != XST_SUCCESS) {
				return XST_FAILURE;
			}
			//xil_printf("sat3\r\n");

			if (!XIic_IsIicBusy(&IicInstance)) {
				/*
				 * Send the Data.
				 */
				Status = XIic_MasterSend(&IicInstance,
							 WriteBuffer,
							 ByteCount);
				if (Status == XST_SUCCESS) {
					IicInstance.Stats.TxErrors = 0;
				}
				else {
				}
			}
		}
	}

	/*
	 * Stop the IIC device.
	 */
	//xil_printf("sat4\r\n");
	Status = XIic_Stop(&IicInstance);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}
	//xil_printf("sat5\r\n");

	return XST_SUCCESS;
}

int write_si570()
{
  u32 Index;
  int Status;
  AddressType Address = EEPROM_TEST_START_ADDRESS;
  AddressType addr;

  /*
   * Initialize the IIC device Instance.
   */
  //xil_printf("write Init start\r\n");
  Status = XIic_Initialize(&IicInstance, IIC_DEVICE_ID);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  //xil_printf("write Init end\r\n");
  /*
   * Setup the Interrupt System.
   */
  Status = SetupInterruptSystem(&IicInstance);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  //xil_printf("write Interrupt end\r\n");
  /*
   * Set the Handlers for transmit and reception.
   */
  XIic_SetSendHandler(&IicInstance, &IicInstance,
		    (XIic_Handler) SendHandler);
  //xil_printf("write send handler end\r\n");
  XIic_SetRecvHandler(&IicInstance, &IicInstance,
		    (XIic_Handler) ReceiveHandler);
  //xil_printf("write Rec Handler end\r\n");
  XIic_SetStatusHandler(&IicInstance, &IicInstance,
		      (XIic_StatusHandler) StatusHandler);

  //xil_printf("write Status Handler end\r\n");
  /*
   * Initialize the data to write and the read buffer.
   */
  if (sizeof(Address) == 1) {
    WriteBuffer[0] = (u8) (Address);
  }
  else {
    WriteBuffer[0] = (u8) (Address >> 8);
    WriteBuffer[1] = (u8) (Address);
    ReadBuffer[Index] = 0;
  }

  //xil_printf("set addr start\r\n");

  /*
   * Set IIC Switch (PCA9543A) to read SI570 (U1) bus
   */

  /*
   * Set the Slave address to the PCA9543A.
   */
  Status = XIic_SetAddress(&IicInstance, XII_ADDR_TO_SEND_TYPE,
			 IIC_SWITCH_ADDRESS);
  //xil_printf("set addr end\r\n");
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  /*
   * Write to the IIC Switch.
   */
  WriteBuffer[0] = 0x01; //Select Bus0 - U1
  //xil_printf("seeprom write st\r\n");
  Status = EepromWriteData(1);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  //xil_printf("eeprom write end\r\n");
  /*
   * Set the Slave address to the SI570
   */
  Status = XIic_SetAddress(&IicInstance, XII_ADDR_TO_SEND_TYPE,
			 IIC_SI570_ADDRESS);
  if (Status != XST_SUCCESS) {
    return XST_FAILURE;
  }
  //xil_printf("set addr end\r\n");
  /*
   * Write to the SI570
   */
  // Set frequency back to default power-up value
  // In this case 156.250000 MHz
  //Freeze DCO bit in Reg 137
  WriteBuffer[0] = 137;
  WriteBuffer[1] = 0x10;
  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("1 end\r\n");
  //Recall the 156.2500000 value from NVM
  //by setting RECALL (bit 0) = 1 in Reg 135
  WriteBuffer[0] = 135;
  WriteBuffer[1] = 0x01;
  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("2 end\r\n");
  //Un-Freeze DCO bit in Reg 137
  WriteBuffer[0] = 137;
  WriteBuffer[1] = 0x00;
  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("3 end\r\n");
  //Assert New Frequency bit in Reg 135
  WriteBuffer[0] = 135;
  WriteBuffer[1] = 0x40;
  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("4 end\r\n");
  // Wait 10 ms
  int zz,kk;
  for(kk= 0; kk<100000; kk++)
	  zz = kk+1;
  //udelay(1000);
  //xil_printf("5 end\r\n");
  // Update to user requested frequency
  //Freeze DCO bit in Reg 137
  WriteBuffer[0] = 137;
  WriteBuffer[1] = 0x10;

  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("6 end\r\n");
  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("7 end\r\n");
  //Set New Frequency to 400 MHz when starting from 156.25 MHz
  WriteBuffer[0] = 7;
  WriteBuffer[1] = UpdateBuffer[0];
  WriteBuffer[2] = UpdateBuffer[1];
  WriteBuffer[3] = UpdateBuffer[2];
  WriteBuffer[4] = UpdateBuffer[3];
  WriteBuffer[5] = UpdateBuffer[4];
  WriteBuffer[6] = UpdateBuffer[5];

  Status = EepromWriteData(sizeof(Address) + 6);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("8 end\r\n");
  //Un-Freeze DCO bit in Reg 137
  WriteBuffer[0] = 137;
  WriteBuffer[1] = 0x00;

  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("9 end\r\n");
  //Assert New Frequency bit in Reg 135
  WriteBuffer[0] = 135;
  WriteBuffer[1] = 0x40;

  Status = EepromWriteData(sizeof(Address) + 1);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("a end\r\n");
  /*
   * Read from the SI570
   */
  //xil_printf("Reading data from SI570\r\n");
  addr = 7;
  Status = EepromReadData2(addr, ReadBuffer, 6);
  if (Status != XST_SUCCESS) {
	return XST_FAILURE;
  }
  //xil_printf("b end\r\n");
  /* Display Read Buffer
   *
   */
  for (Index = 0; Index < 6; Index++) {
    xil_printf("ReadBuffer[%02d] = %02X\r\n", Index, ReadBuffer[Index]);
  }


return XST_SUCCESS;
}

/*****************************************************************************/
/**
* This function setups the interrupt system so interrupts can occur for the
* IIC device. The function is application-specific since the actual system may
* or may not have an interrupt controller. The IIC device could be directly
* connected to a processor without an interrupt controller. The user should
* modify this function to fit the application.
*
* @param	IicInstPtr contains a pointer to the instance of the IIC device
*		which is going to be connected to the interrupt controller.
*
* @return	XST_SUCCESS if successful else XST_FAILURE.
*
* @note		None.
*
******************************************************************************/
static int SetupInterruptSystem(XIic * IicInstPtr)
{
	int Status;

	if (InterruptController.IsStarted == XCOMPONENT_IS_STARTED) {
		return XST_SUCCESS;
	}
//	printf("I am inside interrupt controller \n\r\n\r");
//	exit(-1);

	/*
	 * Initialize the interrupt controller driver so that it's ready to use.
	 */
	Status = XIntc_Initialize(&InterruptController, INTC_DEVICE_ID);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Connect the device driver handler that will be called when an
	 * interrupt for the device occurs, the handler defined above performs
	 * the specific interrupt processing for the device.
	 */
	Status = XIntc_Connect(&InterruptController, IIC_INTR_ID,
			       (XInterruptHandler) XIic_InterruptHandler,
			       IicInstPtr);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Start the interrupt controller so interrupts are enabled for all
	 * devices that cause interrupts.
	 */
	Status = XIntc_Start(&InterruptController, XIN_REAL_MODE);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Enable the interrupts for the IIC device.
	 */
	XIntc_Enable(&InterruptController, IIC_INTR_ID);

#ifdef __PPC__
	/*
	 * Initialize the PPC exception table.
	 */
	XExc_Init();

	/*
	 * Register the interrupt controller handler with the exception table.
	 */
	XExc_RegisterHandler(XEXC_ID_NON_CRITICAL_INT,
			     (XExceptionHandler) XIntc_InterruptHandler,
			     &InterruptController);

	/*
	 * Enable non-critical exceptions.
	 */
	XExc_mEnableExceptions(XEXC_NON_CRITICAL);
#endif

#ifdef __MICROBLAZE__
	/*
	 * Enable the Microblaze Interrupts.
	 */
	microblaze_enable_interrupts();
#endif

	return XST_SUCCESS;
}


/*****************************************************************************/
/**
* This Send handler is called asynchronously from an interrupt
* context and indicates that data in the specified buffer has been sent.
*
* @param	InstancePtr is not used, but contains a pointer to the IIC
*		device driver instance which the handler is being called for.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void SendHandler(XIic * InstancePtr)
{
	TransmitComplete = 0;
}

/*****************************************************************************/
/**
* This Receive handler is called asynchronously from an interrupt
* context and indicates that data in the specified buffer has been Received.
*
* @param	InstancePtr is not used, but contains a pointer to the IIC
*		device driver instance which the handler is being called for.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void ReceiveHandler(XIic * InstancePtr)
{
	ReceiveComplete = 0;
}

/*****************************************************************************/
/**
* This Status handler is called asynchronously from an interrupt
* context and indicates the events that have occurred.
*
* @param	InstancePtr is a pointer to the IIC driver instance for which
*		the handler is being called for.
* @param	Event indicates the condition that has occurred.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void StatusHandler(XIic * InstancePtr, int Event)
{

}


/*****************************************************************************/
/**
 * This function writes a buffer of bytes to the IIC serial EEPROM.
 *
 * @param	BufferPtr contains the address of the data to write.
 * @param	ByteCount contains the number of bytes in the buffer to be
 *		written. Note that this should not exceed the page size of the
 *		EEPROM as noted by the constant PAGE_SIZE.
 *
 * @return	The number of bytes written, a value less than that which was
 *		specified as an input indicates an error.
 *
 * @note		one.
 *
 ******************************************************************************/
Xuint8 EepromWriteByte(AddressType Address, Xuint8 *BufferPtr, Xuint8 ByteCount) {
	u8 SentByteCount;
	u8 WriteBuffer[sizeof(Address) + PAGE_SIZE];
	u8 Index;

	/*
	 * A temporary write buffer must be used which contains both the address
	 * and the data to be written, put the address in first based upon the
	 * size of the address for the EEPROM
	 */
	if (sizeof(AddressType) == 2) {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
	} else if (sizeof(AddressType) == 1) {
		WriteBuffer[0] = (u8) (Address);
		EepromIicAddr |= (EEPROM_TEST_START_ADDRESS >> 8) & 0x7;
	}

	/*
	 * Put the data in the write buffer following the address.
	 */
	for (Index = 0; Index < ByteCount; Index++) {
		WriteBuffer[sizeof(Address) + Index] = BufferPtr[Index];
	}

	/*
	 * Write a page of data at the specified address to the EEPROM.
	 */
	SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, EepromIicAddr, WriteBuffer,
			sizeof(Address) + ByteCount, XIIC_STOP);

	/*
	 * Return the number of bytes written to the EEPROM.
	 */
	return SentByteCount - sizeof(Address);
}

/******************************************************************************
 *
 * This function reads a number of bytes from the IIC serial EEPROM into a
 * specified buffer.
 *
 * @param	BufferPtr contains the address of the data buffer to be filled.
 * @param	ByteCount contains the number of bytes in the buffer to be read.
 *		This value is constrained by the page size of the device such
 *		that up to 64K may be read in one call.
 *
 * @return	The number of bytes read. A value less than the specified input
 *		value indicates an error.
 *
 * @note		None.
 *
 ******************************************************************************/
Xuint8 EepromReadByte(AddressType Address, Xuint8 *BufferPtr, Xuint8 ByteCount) {
	u8 ReceivedByteCount;
	u8 SentByteCount;
	u16 StatusReg;

	/*
	 * Position the Read pointer to specific location in the EEPROM.
	 */
	do {
		StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);
		if (!(StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
			SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, EepromIicAddr,
					(u8 *) &Address, sizeof(Address), XIIC_REPEATED_START);
		}

	} while (SentByteCount != sizeof(Address));
	/*
	 * Receive the data.
	 */
	ReceivedByteCount = XIic_DynRecv(IIC_BASE_ADDRESS, EepromIicAddr,
			BufferPtr, ByteCount);

	/*
	 * Return the number of bytes received from the EEPROM.
	 */
	return ReceivedByteCount;
}


