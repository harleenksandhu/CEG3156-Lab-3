-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "07/19/2025 20:09:08"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	IF_stage IS
    PORT (
	GClk : IN std_logic;
	GReset : IN std_logic;
	PCSrc : IN std_logic;
	IF_Flush : IN std_logic;
	PCWrite : IN std_logic;
	IFIDWrite : IN std_logic;
	branchAddress : IN std_logic_vector(7 DOWNTO 0);
	IFID_PCOut : OUT std_logic_vector(7 DOWNTO 0);
	IFID_InstructionOut : OUT std_logic_vector(31 DOWNTO 0)
	);
END IF_stage;

-- Design Ports Information
-- IF_Flush	=>  Location: PIN_J28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[0]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[1]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[2]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[3]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[4]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[5]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[6]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_PCOut[7]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[0]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[1]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[2]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[3]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[4]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[5]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[6]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[7]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[8]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[9]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[10]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[11]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[12]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[13]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[14]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[15]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[16]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[17]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[18]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[19]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[20]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[21]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[22]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[23]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[24]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[25]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[26]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[27]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[28]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[29]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[30]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFID_InstructionOut[31]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GClk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- GReset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IFIDWrite	=>  Location: PIN_J27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[0]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCSrc	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCWrite	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[2]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[3]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[4]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[5]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- branchAddress[7]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF IF_stage IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_GClk : std_logic;
SIGNAL ww_GReset : std_logic;
SIGNAL ww_PCSrc : std_logic;
SIGNAL ww_IF_Flush : std_logic;
SIGNAL ww_PCWrite : std_logic;
SIGNAL ww_IFIDWrite : std_logic;
SIGNAL ww_branchAddress : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_IFID_PCOut : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_IFID_InstructionOut : std_logic_vector(31 DOWNTO 0);
SIGNAL \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \GReset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \IF_Flush~input_o\ : std_logic;
SIGNAL \IFID_PCOut[0]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[1]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[2]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[3]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[4]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[5]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[6]~output_o\ : std_logic;
SIGNAL \IFID_PCOut[7]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[0]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[1]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[2]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[3]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[4]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[5]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[6]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[7]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[8]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[9]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[10]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[11]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[12]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[13]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[14]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[15]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[16]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[17]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[18]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[19]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[20]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[21]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[22]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[23]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[24]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[25]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[26]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[27]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[28]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[29]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[30]~output_o\ : std_logic;
SIGNAL \IFID_InstructionOut[31]~output_o\ : std_logic;
SIGNAL \GClk~input_o\ : std_logic;
SIGNAL \GClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \branchAddress[0]~input_o\ : std_logic;
SIGNAL \PCReg|reg:0:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \GReset~input_o\ : std_logic;
SIGNAL \GReset~inputclkctrl_outclk\ : std_logic;
SIGNAL \PCSrc~input_o\ : std_logic;
SIGNAL \PCWrite~input_o\ : std_logic;
SIGNAL \PCReg|reg:0:biti|int_q~0_combout\ : std_logic;
SIGNAL \PCReg|reg:0:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:32:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFIDWrite~input_o\ : std_logic;
SIGNAL \IFID_reg|reg:32:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[1]~input_o\ : std_logic;
SIGNAL \PCReg|reg:1:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \PCReg|reg:1:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:33:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:33:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[2]~input_o\ : std_logic;
SIGNAL \PCmux|o[2]~0_combout\ : std_logic;
SIGNAL \PCReg|reg:2:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:34:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:34:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[3]~input_o\ : std_logic;
SIGNAL \PCmux|o[3]~1_combout\ : std_logic;
SIGNAL \PCReg|reg:3:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:35:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:35:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[4]~input_o\ : std_logic;
SIGNAL \PCmux|o[4]~2_combout\ : std_logic;
SIGNAL \PCmux|o[4]~3_combout\ : std_logic;
SIGNAL \PCReg|reg:4:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:36:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[5]~input_o\ : std_logic;
SIGNAL \PCAdder|addersubtractor:5:FAi|sum~combout\ : std_logic;
SIGNAL \PCmux|o[5]~4_combout\ : std_logic;
SIGNAL \PCReg|reg:5:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:37:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:37:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[6]~input_o\ : std_logic;
SIGNAL \PCAdder|addersubtractor:5:FAi|cout~0_combout\ : std_logic;
SIGNAL \PCmux|o[6]~5_combout\ : std_logic;
SIGNAL \PCReg|reg:6:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:38:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:38:biti|int_q~q\ : std_logic;
SIGNAL \branchAddress[7]~input_o\ : std_logic;
SIGNAL \PCmux|o[7]~6_combout\ : std_logic;
SIGNAL \PCmux|o[7]~7_combout\ : std_logic;
SIGNAL \PCReg|reg:7:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:39:biti|int_q~feeder_combout\ : std_logic;
SIGNAL \IFID_reg|reg:39:biti|int_q~q\ : std_logic;
SIGNAL \IFID_reg|reg:0:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:1:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:2:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:3:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:4:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:5:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:6:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:7:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:8:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:9:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:10:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:11:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:12:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:13:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:14:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:15:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:16:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:17:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:18:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:19:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:20:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:21:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:22:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:23:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:24:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:25:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:26:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:27:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:28:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:29:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:30:biti|int_q\ : std_logic;
SIGNAL \IFID_reg|reg:31:biti|int_q\ : std_logic;
SIGNAL \ALT_INV_GReset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_GClk <= GClk;
ww_GReset <= GReset;
ww_PCSrc <= PCSrc;
ww_IF_Flush <= IF_Flush;
ww_PCWrite <= PCWrite;
ww_IFIDWrite <= IFIDWrite;
ww_branchAddress <= branchAddress;
IFID_PCOut <= ww_IFID_PCOut;
IFID_InstructionOut <= ww_IFID_InstructionOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\PCReg|reg:7:biti|int_q~q\ & \PCReg|reg:6:biti|int_q~q\ & \PCReg|reg:5:biti|int_q~q\ & \PCReg|reg:4:biti|int_q~q\ & \PCReg|reg:3:biti|int_q~q\ & \PCReg|reg:2:biti|int_q~q\);

\IFID_reg|reg:0:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\IFID_reg|reg:1:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\IFID_reg|reg:2:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\IFID_reg|reg:3:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\IFID_reg|reg:4:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\IFID_reg|reg:5:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\IFID_reg|reg:6:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\IFID_reg|reg:7:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\IFID_reg|reg:8:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\IFID_reg|reg:9:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\IFID_reg|reg:10:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\IFID_reg|reg:11:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\IFID_reg|reg:12:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\IFID_reg|reg:13:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\IFID_reg|reg:14:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\IFID_reg|reg:15:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);
\IFID_reg|reg:16:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(16);
\IFID_reg|reg:17:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(17);
\IFID_reg|reg:18:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(18);
\IFID_reg|reg:19:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(19);
\IFID_reg|reg:20:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(20);
\IFID_reg|reg:21:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(21);
\IFID_reg|reg:22:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(22);
\IFID_reg|reg:23:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(23);
\IFID_reg|reg:24:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(24);
\IFID_reg|reg:25:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(25);
\IFID_reg|reg:26:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(26);
\IFID_reg|reg:27:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(27);
\IFID_reg|reg:28:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(28);
\IFID_reg|reg:29:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(29);
\IFID_reg|reg:30:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(30);
\IFID_reg|reg:31:biti|int_q\ <= \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\(31);

\GReset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GReset~input_o\);

\GClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \GClk~input_o\);
\ALT_INV_GReset~inputclkctrl_outclk\ <= NOT \GReset~inputclkctrl_outclk\;

-- Location: IOOBUF_X65_Y0_N23
\IFID_PCOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:32:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[0]~output_o\);

-- Location: IOOBUF_X65_Y0_N16
\IFID_PCOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:33:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[1]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\IFID_PCOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:34:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[2]~output_o\);

-- Location: IOOBUF_X56_Y0_N23
\IFID_PCOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:35:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[3]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\IFID_PCOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:36:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[4]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\IFID_PCOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:37:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[5]~output_o\);

-- Location: IOOBUF_X60_Y0_N23
\IFID_PCOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:38:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[6]~output_o\);

-- Location: IOOBUF_X60_Y0_N16
\IFID_PCOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:39:biti|int_q~q\,
	devoe => ww_devoe,
	o => \IFID_PCOut[7]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\IFID_InstructionOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:0:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[0]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\IFID_InstructionOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:1:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[1]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\IFID_InstructionOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:2:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[2]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\IFID_InstructionOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:3:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[3]~output_o\);

-- Location: IOOBUF_X52_Y0_N16
\IFID_InstructionOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:4:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[4]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\IFID_InstructionOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:5:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[5]~output_o\);

-- Location: IOOBUF_X33_Y0_N2
\IFID_InstructionOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:6:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[6]~output_o\);

-- Location: IOOBUF_X49_Y0_N16
\IFID_InstructionOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:7:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[7]~output_o\);

-- Location: IOOBUF_X54_Y0_N9
\IFID_InstructionOut[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:8:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[8]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\IFID_InstructionOut[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:9:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[9]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\IFID_InstructionOut[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:10:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[10]~output_o\);

-- Location: IOOBUF_X35_Y0_N16
\IFID_InstructionOut[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:11:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[11]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\IFID_InstructionOut[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:12:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[12]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\IFID_InstructionOut[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:13:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[13]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\IFID_InstructionOut[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:14:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[14]~output_o\);

-- Location: IOOBUF_X27_Y0_N23
\IFID_InstructionOut[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:15:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[15]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\IFID_InstructionOut[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:16:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[16]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\IFID_InstructionOut[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:17:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[17]~output_o\);

-- Location: IOOBUF_X52_Y0_N2
\IFID_InstructionOut[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:18:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[18]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\IFID_InstructionOut[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:19:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[19]~output_o\);

-- Location: IOOBUF_X54_Y0_N16
\IFID_InstructionOut[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:20:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[20]~output_o\);

-- Location: IOOBUF_X42_Y0_N16
\IFID_InstructionOut[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:21:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[21]~output_o\);

-- Location: IOOBUF_X52_Y0_N9
\IFID_InstructionOut[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:22:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[22]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\IFID_InstructionOut[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:23:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[23]~output_o\);

-- Location: IOOBUF_X52_Y0_N23
\IFID_InstructionOut[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:24:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[24]~output_o\);

-- Location: IOOBUF_X42_Y0_N23
\IFID_InstructionOut[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:25:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[25]~output_o\);

-- Location: IOOBUF_X56_Y0_N16
\IFID_InstructionOut[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:26:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[26]~output_o\);

-- Location: IOOBUF_X47_Y0_N9
\IFID_InstructionOut[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:27:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[27]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\IFID_InstructionOut[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:28:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[28]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\IFID_InstructionOut[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:29:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[29]~output_o\);

-- Location: IOOBUF_X35_Y0_N23
\IFID_InstructionOut[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:30:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[30]~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\IFID_InstructionOut[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \IFID_reg|reg:31:biti|int_q\,
	devoe => ww_devoe,
	o => \IFID_InstructionOut[31]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\GClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GClk,
	o => \GClk~input_o\);

-- Location: CLKCTRL_G2
\GClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GClk~inputclkctrl_outclk\);

-- Location: IOIBUF_X65_Y0_N8
\branchAddress[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(0),
	o => \branchAddress[0]~input_o\);

-- Location: LCCOMB_X57_Y1_N12
\PCReg|reg:0:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCReg|reg:0:biti|int_q~feeder_combout\ = \branchAddress[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \branchAddress[0]~input_o\,
	combout => \PCReg|reg:0:biti|int_q~feeder_combout\);

-- Location: IOIBUF_X0_Y36_N15
\GReset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_GReset,
	o => \GReset~input_o\);

-- Location: CLKCTRL_G4
\GReset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \GReset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \GReset~inputclkctrl_outclk\);

-- Location: IOIBUF_X67_Y0_N8
\PCSrc~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCSrc,
	o => \PCSrc~input_o\);

-- Location: IOIBUF_X67_Y0_N15
\PCWrite~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PCWrite,
	o => \PCWrite~input_o\);

-- Location: LCCOMB_X56_Y1_N14
\PCReg|reg:0:biti|int_q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCReg|reg:0:biti|int_q~0_combout\ = (\PCSrc~input_o\ & \PCWrite~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PCSrc~input_o\,
	datad => \PCWrite~input_o\,
	combout => \PCReg|reg:0:biti|int_q~0_combout\);

-- Location: FF_X57_Y1_N13
\PCReg|reg:0:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCReg|reg:0:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCReg|reg:0:biti|int_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:0:biti|int_q~q\);

-- Location: LCCOMB_X57_Y1_N8
\IFID_reg|reg:32:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:32:biti|int_q~feeder_combout\ = \PCReg|reg:0:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PCReg|reg:0:biti|int_q~q\,
	combout => \IFID_reg|reg:32:biti|int_q~feeder_combout\);

-- Location: IOIBUF_X115_Y37_N1
\IFIDWrite~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IFIDWrite,
	o => \IFIDWrite~input_o\);

-- Location: FF_X57_Y1_N9
\IFID_reg|reg:32:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:32:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:32:biti|int_q~q\);

-- Location: IOIBUF_X65_Y0_N1
\branchAddress[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(1),
	o => \branchAddress[1]~input_o\);

-- Location: LCCOMB_X57_Y1_N2
\PCReg|reg:1:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCReg|reg:1:biti|int_q~feeder_combout\ = \branchAddress[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \branchAddress[1]~input_o\,
	combout => \PCReg|reg:1:biti|int_q~feeder_combout\);

-- Location: FF_X57_Y1_N3
\PCReg|reg:1:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCReg|reg:1:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCReg|reg:0:biti|int_q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:1:biti|int_q~q\);

-- Location: LCCOMB_X57_Y1_N30
\IFID_reg|reg:33:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:33:biti|int_q~feeder_combout\ = \PCReg|reg:1:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PCReg|reg:1:biti|int_q~q\,
	combout => \IFID_reg|reg:33:biti|int_q~feeder_combout\);

-- Location: FF_X57_Y1_N31
\IFID_reg|reg:33:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:33:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:33:biti|int_q~q\);

-- Location: IOIBUF_X56_Y0_N8
\branchAddress[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(2),
	o => \branchAddress[2]~input_o\);

-- Location: LCCOMB_X56_Y1_N20
\PCmux|o[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[2]~0_combout\ = (\PCSrc~input_o\ & (\branchAddress[2]~input_o\)) # (!\PCSrc~input_o\ & ((!\PCReg|reg:2:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \branchAddress[2]~input_o\,
	datac => \PCReg|reg:2:biti|int_q~q\,
	datad => \PCSrc~input_o\,
	combout => \PCmux|o[2]~0_combout\);

-- Location: FF_X56_Y1_N21
\PCReg|reg:2:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[2]~0_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:2:biti|int_q~q\);

-- Location: LCCOMB_X56_Y1_N2
\IFID_reg|reg:34:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:34:biti|int_q~feeder_combout\ = \PCReg|reg:2:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PCReg|reg:2:biti|int_q~q\,
	combout => \IFID_reg|reg:34:biti|int_q~feeder_combout\);

-- Location: FF_X56_Y1_N3
\IFID_reg|reg:34:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:34:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:34:biti|int_q~q\);

-- Location: IOIBUF_X60_Y0_N8
\branchAddress[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(3),
	o => \branchAddress[3]~input_o\);

-- Location: LCCOMB_X56_Y1_N4
\PCmux|o[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[3]~1_combout\ = (\PCSrc~input_o\ & (\branchAddress[3]~input_o\)) # (!\PCSrc~input_o\ & ((\PCReg|reg:2:biti|int_q~q\ $ (\PCReg|reg:3:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \branchAddress[3]~input_o\,
	datab => \PCReg|reg:2:biti|int_q~q\,
	datac => \PCReg|reg:3:biti|int_q~q\,
	datad => \PCSrc~input_o\,
	combout => \PCmux|o[3]~1_combout\);

-- Location: FF_X56_Y1_N5
\PCReg|reg:3:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[3]~1_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:3:biti|int_q~q\);

-- Location: LCCOMB_X56_Y1_N24
\IFID_reg|reg:35:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:35:biti|int_q~feeder_combout\ = \PCReg|reg:3:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PCReg|reg:3:biti|int_q~q\,
	combout => \IFID_reg|reg:35:biti|int_q~feeder_combout\);

-- Location: FF_X56_Y1_N25
\IFID_reg|reg:35:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:35:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:35:biti|int_q~q\);

-- Location: IOIBUF_X56_Y0_N1
\branchAddress[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(4),
	o => \branchAddress[4]~input_o\);

-- Location: LCCOMB_X56_Y1_N0
\PCmux|o[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[4]~2_combout\ = (!\PCSrc~input_o\ & (\PCReg|reg:4:biti|int_q~q\ $ (((\PCReg|reg:3:biti|int_q~q\ & \PCReg|reg:2:biti|int_q~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrc~input_o\,
	datab => \PCReg|reg:3:biti|int_q~q\,
	datac => \PCReg|reg:4:biti|int_q~q\,
	datad => \PCReg|reg:2:biti|int_q~q\,
	combout => \PCmux|o[4]~2_combout\);

-- Location: LCCOMB_X56_Y1_N18
\PCmux|o[4]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[4]~3_combout\ = (\PCmux|o[4]~2_combout\) # ((\PCSrc~input_o\ & \branchAddress[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PCSrc~input_o\,
	datac => \branchAddress[4]~input_o\,
	datad => \PCmux|o[4]~2_combout\,
	combout => \PCmux|o[4]~3_combout\);

-- Location: FF_X56_Y1_N19
\PCReg|reg:4:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[4]~3_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:4:biti|int_q~q\);

-- Location: FF_X56_Y1_N1
\IFID_reg|reg:36:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	asdata => \PCReg|reg:4:biti|int_q~q\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:36:biti|int_q~q\);

-- Location: IOIBUF_X60_Y0_N1
\branchAddress[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(5),
	o => \branchAddress[5]~input_o\);

-- Location: LCCOMB_X56_Y1_N28
\PCAdder|addersubtractor:5:FAi|sum\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCAdder|addersubtractor:5:FAi|sum~combout\ = \PCReg|reg:5:biti|int_q~q\ $ (((\PCReg|reg:2:biti|int_q~q\ & (\PCReg|reg:3:biti|int_q~q\ & \PCReg|reg:4:biti|int_q~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCReg|reg:5:biti|int_q~q\,
	datab => \PCReg|reg:2:biti|int_q~q\,
	datac => \PCReg|reg:3:biti|int_q~q\,
	datad => \PCReg|reg:4:biti|int_q~q\,
	combout => \PCAdder|addersubtractor:5:FAi|sum~combout\);

-- Location: LCCOMB_X56_Y1_N12
\PCmux|o[5]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[5]~4_combout\ = (\PCSrc~input_o\ & (\branchAddress[5]~input_o\)) # (!\PCSrc~input_o\ & ((\PCAdder|addersubtractor:5:FAi|sum~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \branchAddress[5]~input_o\,
	datac => \PCSrc~input_o\,
	datad => \PCAdder|addersubtractor:5:FAi|sum~combout\,
	combout => \PCmux|o[5]~4_combout\);

-- Location: FF_X56_Y1_N13
\PCReg|reg:5:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[5]~4_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:5:biti|int_q~q\);

-- Location: LCCOMB_X56_Y1_N26
\IFID_reg|reg:37:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:37:biti|int_q~feeder_combout\ = \PCReg|reg:5:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PCReg|reg:5:biti|int_q~q\,
	combout => \IFID_reg|reg:37:biti|int_q~feeder_combout\);

-- Location: FF_X56_Y1_N27
\IFID_reg|reg:37:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:37:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:37:biti|int_q~q\);

-- Location: IOIBUF_X69_Y0_N1
\branchAddress[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(6),
	o => \branchAddress[6]~input_o\);

-- Location: LCCOMB_X56_Y1_N10
\PCAdder|addersubtractor:5:FAi|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCAdder|addersubtractor:5:FAi|cout~0_combout\ = (\PCReg|reg:5:biti|int_q~q\ & (\PCReg|reg:2:biti|int_q~q\ & (\PCReg|reg:3:biti|int_q~q\ & \PCReg|reg:4:biti|int_q~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCReg|reg:5:biti|int_q~q\,
	datab => \PCReg|reg:2:biti|int_q~q\,
	datac => \PCReg|reg:3:biti|int_q~q\,
	datad => \PCReg|reg:4:biti|int_q~q\,
	combout => \PCAdder|addersubtractor:5:FAi|cout~0_combout\);

-- Location: LCCOMB_X56_Y1_N6
\PCmux|o[6]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[6]~5_combout\ = (\PCSrc~input_o\ & (\branchAddress[6]~input_o\)) # (!\PCSrc~input_o\ & ((\PCReg|reg:6:biti|int_q~q\ $ (\PCAdder|addersubtractor:5:FAi|cout~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCSrc~input_o\,
	datab => \branchAddress[6]~input_o\,
	datac => \PCReg|reg:6:biti|int_q~q\,
	datad => \PCAdder|addersubtractor:5:FAi|cout~0_combout\,
	combout => \PCmux|o[6]~5_combout\);

-- Location: FF_X56_Y1_N7
\PCReg|reg:6:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[6]~5_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:6:biti|int_q~q\);

-- Location: LCCOMB_X56_Y1_N30
\IFID_reg|reg:38:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:38:biti|int_q~feeder_combout\ = \PCReg|reg:6:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PCReg|reg:6:biti|int_q~q\,
	combout => \IFID_reg|reg:38:biti|int_q~feeder_combout\);

-- Location: FF_X56_Y1_N31
\IFID_reg|reg:38:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:38:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:38:biti|int_q~q\);

-- Location: IOIBUF_X67_Y0_N1
\branchAddress[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_branchAddress(7),
	o => \branchAddress[7]~input_o\);

-- Location: LCCOMB_X56_Y1_N16
\PCmux|o[7]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[7]~6_combout\ = (!\PCSrc~input_o\ & (\PCReg|reg:7:biti|int_q~q\ $ (((\PCReg|reg:6:biti|int_q~q\ & \PCAdder|addersubtractor:5:FAi|cout~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCReg|reg:6:biti|int_q~q\,
	datab => \PCSrc~input_o\,
	datac => \PCReg|reg:7:biti|int_q~q\,
	datad => \PCAdder|addersubtractor:5:FAi|cout~0_combout\,
	combout => \PCmux|o[7]~6_combout\);

-- Location: LCCOMB_X56_Y1_N22
\PCmux|o[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCmux|o[7]~7_combout\ = (\PCmux|o[7]~6_combout\) # ((\PCSrc~input_o\ & \branchAddress[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PCSrc~input_o\,
	datac => \branchAddress[7]~input_o\,
	datad => \PCmux|o[7]~6_combout\,
	combout => \PCmux|o[7]~7_combout\);

-- Location: FF_X56_Y1_N23
\PCReg|reg:7:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \PCmux|o[7]~7_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \PCWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PCReg|reg:7:biti|int_q~q\);

-- Location: LCCOMB_X56_Y1_N8
\IFID_reg|reg:39:biti|int_q~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \IFID_reg|reg:39:biti|int_q~feeder_combout\ = \PCReg|reg:7:biti|int_q~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PCReg|reg:7:biti|int_q~q\,
	combout => \IFID_reg|reg:39:biti|int_q~feeder_combout\);

-- Location: FF_X56_Y1_N9
\IFID_reg|reg:39:biti|int_q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \GClk~inputclkctrl_outclk\,
	d => \IFID_reg|reg:39:biti|int_q~feeder_combout\,
	clrn => \ALT_INV_GReset~inputclkctrl_outclk\,
	ena => \IFIDWrite~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \IFID_reg|reg:39:biti|int_q~q\);

-- Location: M9K_X51_Y1_N0
\InstructionMemory|srom|rom_block|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init1 => X"0000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001022FFF801021FFD400800000B08C03000408C0200030AC0100040004308200AC04000300023202500043082208C03000108C020000",
	clk0_output_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "rom_init.mif",
	init_file_layout => "port_a",
	logical_ram_name => "lpm_rom:InstructionMemory|altrom:srom|altsyncram:rom_block|altsyncram_9f01:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "clear0",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 6,
	port_b_data_width => 36,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \GClk~inputclkctrl_outclk\,
	ena0 => \IFIDWrite~input_o\,
	clr0 => \GReset~inputclkctrl_outclk\,
	portaaddr => \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \InstructionMemory|srom|rom_block|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X115_Y37_N8
\IF_Flush~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_IF_Flush,
	o => \IF_Flush~input_o\);

ww_IFID_PCOut(0) <= \IFID_PCOut[0]~output_o\;

ww_IFID_PCOut(1) <= \IFID_PCOut[1]~output_o\;

ww_IFID_PCOut(2) <= \IFID_PCOut[2]~output_o\;

ww_IFID_PCOut(3) <= \IFID_PCOut[3]~output_o\;

ww_IFID_PCOut(4) <= \IFID_PCOut[4]~output_o\;

ww_IFID_PCOut(5) <= \IFID_PCOut[5]~output_o\;

ww_IFID_PCOut(6) <= \IFID_PCOut[6]~output_o\;

ww_IFID_PCOut(7) <= \IFID_PCOut[7]~output_o\;

ww_IFID_InstructionOut(0) <= \IFID_InstructionOut[0]~output_o\;

ww_IFID_InstructionOut(1) <= \IFID_InstructionOut[1]~output_o\;

ww_IFID_InstructionOut(2) <= \IFID_InstructionOut[2]~output_o\;

ww_IFID_InstructionOut(3) <= \IFID_InstructionOut[3]~output_o\;

ww_IFID_InstructionOut(4) <= \IFID_InstructionOut[4]~output_o\;

ww_IFID_InstructionOut(5) <= \IFID_InstructionOut[5]~output_o\;

ww_IFID_InstructionOut(6) <= \IFID_InstructionOut[6]~output_o\;

ww_IFID_InstructionOut(7) <= \IFID_InstructionOut[7]~output_o\;

ww_IFID_InstructionOut(8) <= \IFID_InstructionOut[8]~output_o\;

ww_IFID_InstructionOut(9) <= \IFID_InstructionOut[9]~output_o\;

ww_IFID_InstructionOut(10) <= \IFID_InstructionOut[10]~output_o\;

ww_IFID_InstructionOut(11) <= \IFID_InstructionOut[11]~output_o\;

ww_IFID_InstructionOut(12) <= \IFID_InstructionOut[12]~output_o\;

ww_IFID_InstructionOut(13) <= \IFID_InstructionOut[13]~output_o\;

ww_IFID_InstructionOut(14) <= \IFID_InstructionOut[14]~output_o\;

ww_IFID_InstructionOut(15) <= \IFID_InstructionOut[15]~output_o\;

ww_IFID_InstructionOut(16) <= \IFID_InstructionOut[16]~output_o\;

ww_IFID_InstructionOut(17) <= \IFID_InstructionOut[17]~output_o\;

ww_IFID_InstructionOut(18) <= \IFID_InstructionOut[18]~output_o\;

ww_IFID_InstructionOut(19) <= \IFID_InstructionOut[19]~output_o\;

ww_IFID_InstructionOut(20) <= \IFID_InstructionOut[20]~output_o\;

ww_IFID_InstructionOut(21) <= \IFID_InstructionOut[21]~output_o\;

ww_IFID_InstructionOut(22) <= \IFID_InstructionOut[22]~output_o\;

ww_IFID_InstructionOut(23) <= \IFID_InstructionOut[23]~output_o\;

ww_IFID_InstructionOut(24) <= \IFID_InstructionOut[24]~output_o\;

ww_IFID_InstructionOut(25) <= \IFID_InstructionOut[25]~output_o\;

ww_IFID_InstructionOut(26) <= \IFID_InstructionOut[26]~output_o\;

ww_IFID_InstructionOut(27) <= \IFID_InstructionOut[27]~output_o\;

ww_IFID_InstructionOut(28) <= \IFID_InstructionOut[28]~output_o\;

ww_IFID_InstructionOut(29) <= \IFID_InstructionOut[29]~output_o\;

ww_IFID_InstructionOut(30) <= \IFID_InstructionOut[30]~output_o\;

ww_IFID_InstructionOut(31) <= \IFID_InstructionOut[31]~output_o\;
END structure;


