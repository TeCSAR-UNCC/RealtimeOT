
------------------------------------------------------------------------------
-- hdmi_interface - entity/architecture pair
------------------------------------------------------------------------------
--
-- ***************************************************************************
-- ** Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.            **
-- **                                                                       **
-- ** Xilinx, Inc.                                                          **
-- ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
-- ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
-- ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
-- ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
-- ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
-- ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
-- ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
-- ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
-- ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
-- ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
-- ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
-- ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
-- ** FOR A PARTICULAR PURPOSE.                                             **
-- **                                                                       **
-- ***************************************************************************
--
------------------------------------------------------------------------------
-- Filename:          hdmi_interface
-- Version:           1.00.a
-- Description:       Example Axi Streaming core (VHDL).
-- Date:              Mon Jan  9 10:56:49 2012 (by Create and Import Peripheral Wizard)
-- VHDL Standard:     VHDL'93
------------------------------------------------------------------------------
-- Naming Conventions:
--   active low signals:                    "*_n"
--   clock signals:                         "clk", "clk_div#", "clk_#x"
--   reset signals:                         "rst", "rst_n"
--   generics:                              "C_*"
--   user defined types:                    "*_TYPE"
--   state machine next state:              "*_ns"
--   state machine current state:           "*_cs"
--   combinatorial signals:                 "*_com"
--   pipelined or register delay signals:   "*_d#"
--   counter signals:                       "*cnt*"
--   clock enable signals:                  "*_ce"
--   internal version of output port:       "*_i"
--   device pins:                           "*_pin"
--   ports:                                 "- Names begin with Uppercase"
--   processes:                             "*_PROCESS"
--   component instantiations:              "<ENTITY_>I_<#|FUNC>"
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;

------------------------------------------------------------------------------
-- Entity Section
------------------------------------------------------------------------------

entity hdmi_interface is
    Port ( clk        : in  STD_LOGIC;
           ce         : in  STD_LOGIC;
           de_i       : in  STD_LOGIC;
           vsync_i    : in  STD_LOGIC;
           hsync_i    : in  STD_LOGIC;
           Y_i        : in  STD_LOGIC_VECTOR (7 downto 0);
           CrCb_i     : in  STD_LOGIC_VECTOR (7 downto 0);

           --On-Board HDMI Codec Connections
           hdmi_ext_int :  in STD_LOGIC;
           hdmi_int     : out STD_LOGIC;
           hdmi_de      : out STD_LOGIC;
           hdmi_vsync   : out STD_LOGIC;
           hdmi_hsync   : out STD_LOGIC;
           hdmi_data    : out STD_LOGIC_VECTOR (15 downto 0);
           hdmi_clk     : out STD_LOGIC;
           EXT_SMA_CLK_P: out STD_LOGIC
           );
           
end hdmi_interface;

------------------------------------------------------------------------------
-- Architecture Section
------------------------------------------------------------------------------

architecture hdmi_interface_arch of hdmi_interface is
signal     hdmi_int0     :  STD_LOGIC;
signal     hdmi_de0      :  STD_LOGIC;
signal     hdmi_vsync0   :  STD_LOGIC;
signal     hdmi_hsync0   :  STD_LOGIC;
signal     hdmi_data0    :  STD_LOGIC_VECTOR (15 downto 0);


signal     hdmi_int_i     :  STD_LOGIC;
signal     hdmi_de_i      :  STD_LOGIC;
signal     hdmi_vsync_i   :  STD_LOGIC;
signal     hdmi_hsync_i   :  STD_LOGIC;
signal     hdmi_data_i    :  STD_LOGIC_VECTOR (15 downto 0);



component ODDR is

  generic(

      DDR_CLK_EDGE : string := "OPPOSITE_EDGE";
      INIT         : bit    := '0';
      SRTYPE       : string := "SYNC"
      );

  port(
      Q           : out std_ulogic;

      C           : in  std_ulogic;
      CE          : in  std_ulogic;
      D1          : in  std_ulogic;
      D2          : in  std_ulogic;
      R           : in  std_ulogic := 'L';
      S           : in  std_ulogic := 'L'
    );



end component;


signal debug : std_logic;
begin


  process(clk)
  begin
  if(Clk'EVENT and Clk = '1')then
        hdmi_int0   <= hdmi_ext_int;
        hdmi_de0    <= de_i;
        hdmi_vsync0 <= vsync_i;
        hdmi_hsync0 <= hsync_i;
        hdmi_data0  <= CrCb_i & Y_i;
        hdmi_int_i   <= hdmi_int0   ;
        hdmi_de_i    <= hdmi_de0    ;
        hdmi_vsync_i <= hdmi_vsync0 ;
        hdmi_hsync_i <= hdmi_hsync0 ;
        hdmi_data_i  <= hdmi_data0  ;
  end if;
end process;


HDMI_DE_G: FOR i IN 0 TO 15 GENERATE
begin

HDMI_DATA_G : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_data(i),        
      C    => clk,        
      CE   => '1',       
      D1   => hdmi_data_i(i),       
      D2   => hdmi_data_i(i),       
      R    => '0',       
      S    => '0'       
    );

end generate HDMI_DE_G;





  HDMI_INIT_SIG : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_int,        
      C    => clk,        
      CE   => '1',       
      D1   => hdmi_int_i,       
      D2   => hdmi_int_i,       
      R    => '0',       
      S    => '0'       
    );




  HDMI_DE_SIG : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_de,        
      C    => clk,        
      CE   => '1',       
      D1   => hdmi_de_i,       
      D2   => hdmi_de_i,       
      R    => '0',       
      S    => '0'       
    );


 HDMI_VSYNC_SIG : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_vsync,        
      C    => clk,        
      CE   => '1',       
      D1   => hdmi_vsync_i,       
      D2   => hdmi_vsync_i,       
      R    => '0',       
      S    => '0'       
    );


 HDMI_HSYNC_SIG : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_hsync,        
      C    => clk,        
      CE   => '1',       
      D1   => hdmi_hsync_i,       
      D2   => hdmi_hsync_i,       
      R    => '0',       
      S    => '0'       
    );








 TFT_ODDR : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => hdmi_clk,        
      C    => clk,        
      CE   => '1',       
      D1   => '1',       
      D2   => '0',       
      R    => '0',       
      S    => '0'       
    );





 TFT_debug_ODDR : ODDR
  generic map(

      DDR_CLK_EDGE => "OPPOSITE_EDGE", 
      INIT         => '0',      
      SRTYPE       => "SYNC" 
      )
  port map(
      Q    => EXT_SMA_CLK_P,        
      C    => clk,        
      CE   => '1',       
      D1   => '1',       
      D2   => '0',       
      R    => '0',       
      S    => '0'       
    );


end architecture hdmi_interface_arch;
