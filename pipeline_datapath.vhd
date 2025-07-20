library ieee;
use ieee.std_logic_1164.all;

entity pipeline_datapath is
	port(GClk, GReset: in std_logic ; 
			IF_Flush: in std_logic; -- From control unit
			WB: in std_logic_vector(1 downto 0); -- from control unit
			M, EX: in std_logic_vector(2 downto 0); -- from control unit
			PCWrite, IFIDWrite: in std_logic --from hazard detection unit
			);
	
end pipeline_datapath;


architecture rtl of pipeline_datapath is 
signal int_branchAddress, int_IFID_PCIn, int_IFID_PCOut, int_WriteData, int_EX_PC: std_logic_vector(7 downto 0);
signal int_IDEX_ReadData1In, int_IDEX_ReadData2In, int_IDEX_ReadData1Out, int_IDEX_ReadData2Out: std_logic_vector(7 downto 0);
signal int_IDEX_SignExtDataIn, int_IDEX_SignExtDataOut: std_logic_vector(7 downto 0);
signal int_WriteRegister, int_IDEX_RdIn, int_IDEX_RtIn, int_IDEX_RdOut, int_IDEX_RtOut: std_logic_vector(4 downto 0);
signal int_IFID_InstructionIn, int_IFID_InstructionOut: std_logic_vector(31 downto 0);
signal IDEX_WB, EXMEM_WB, MEMWB_WB: std_logic_vector(1 downto 0);
signal IDEX_M, IDEX_EX, EXMEM_M: std_logic_vector(2 downto 0);
signal GReset_b, int_RegWrite, int_PCSrc: std_logic; --TODO: intPCSrc must be connected to an output of the MEM stage

component IF_stage
	port(GClk, GReset: in std_logic;
			PCSrc, IF_Flush: in std_logic; -- From Control Unit
			PCWrite: in std_logic; -- From Hazard Detection Unit
			branchAddress: in std_logic_vector(7 downto 0);
			IFID_PCIn: out std_logic_vector(7 downto 0);
			IFID_InstructionIn: out std_logic_vector(31 downto 0));
end component;

component ID_stage
	port(GClk, GReset: in std_logic; 
		  RegWrite: in std_logic; -- From MEM/WB Reg
		  Instruction: in std_logic_vector(31 downto 0);
		  WriteRegister: in std_logic_vector(4 downto 0);
		  WriteData: in std_logic_vector(7 downto 0);
		  IDEX_ReadData1, IDEX_ReadData2: out std_logic_vector(7 downto 0); 
		  IDEX_SignExtData: out std_logic_vector(7 downto 0);
		  IDEX_Rd, IDEX_Rt: out std_logic_vector(4 downto 0));
end component;


component nbitreg
    generic(n: integer:=4);
	port(reset_b: in std_logic;
		  din : in std_logic_vector(n-1 downto 0);
		  load, clk: in std_logic;
		  dout, dout_b : out std_logic_vector(n-1 downto 0));
end component;

begin 

Stage1: IF_stage
	port map(GClk, GReset, int_PCSrc, IF_Flush, PCWrite, int_branchAddress, int_IFID_PCIn, int_IFID_InstructionIn);

IFID_reg: nbitreg
	generic map(n => 40)
	port map(reset_b => GReset_b, din(39 downto 32) => int_IFID_PCIn, din(31 downto 0) => int_IFID_InstructionIn, 
			   load => IFIDWrite, clk => GClk, dout(39 downto 32) => int_IFID_PCOut, dout(31 downto 0) => int_IFID_InstructionOut, dout_b => open);

Stage2: ID_stage  --Also stage 5 for WB
	port map(GClk, GReset, int_RegWrite, int_IFID_InstructionOut, int_WriteRegister, int_WriteData, --TODO: regwrite must be connected to control signal from mem/wb reg, also connect int_write register and write data
				int_IDEX_ReadData1In, int_IDEX_ReadData2In, int_IDEX_SignExtDataIn, int_IDEX_RdIn, int_IDEX_RtIn); 
	
IDEX_reg: nbitreg
	generic map(n => 50)
	port map(reset_b => GReset_b, 
				din(49 downto 48) => WB,  
				din(47 downto 45) => M, 
				din(44 downto 42) => EX, 
				din(41 downto 34) => int_IFID_PCOut, 
				din(33 downto 26) => int_IDEX_ReadData1In, 
				din(25 downto 18) => int_IDEX_ReadData2In, 
				din(17 downto 10) => int_IDEX_SignExtDataIn, 
				din(9 downto 5) => int_IDEX_RtIn, 
				din(4 downto 0) => int_IDEX_RdIn, 
				load => '1', clk => GClk, 
				dout(49 downto 48) => IDEX_WB,  
				dout(47 downto 45) => IDEX_M, 
				dout(44 downto 42) => IDEX_EX, 
				dout(41 downto 34) => int_EX_PC, 
				dout(33 downto 26) => int_IDEX_ReadData1Out, 
				dout(25 downto 18) => int_IDEX_ReadData2Out, 
				dout(17 downto 10) => int_IDEX_SignExtDataOut, 
				dout(9 downto 5) => int_IDEX_RtOut, 
				dout(4 downto 0) => int_IDEX_RdOut );
				
GReset_b <= NOT GReset;
	
end rtl;