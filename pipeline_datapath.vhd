library ieee;
use ieee.std_logic_1164.all;

entity pipeline_datapath is
	port(GClk, GReset: in std_logic ; 
			IF_Flush: in std_logic; -- From control unit
			WB: in std_logic_vector(1 downto 0); -- from control unit
			M: in std_logic_vector(2 downto 0); -- from control unit
			EX: in std_logic_vector(3 downto 0); -- from control unit
			PCWrite, IFIDWrite: in std_logic; --from hazard detection unit 
			ForwardA, ForwardB: in std_logic_vector(1 downto 0); --from forwarding unit
			InstructionOut: out std_logic_vector(31 downto 0);
			PCOut, ALUResult, ReadData1, ReadData2, WriteData: out std_logic_vector(7 downto 0); 
			ZeroOut: out std_logic);
			
	
end pipeline_datapath;


architecture rtl of pipeline_datapath is 
signal int_IFID_PCIn, int_IFID_PCOut, int_WriteData, int_EX_PC: std_logic_vector(7 downto 0);
signal int_IDEX_ReadData1In, int_IDEX_ReadData2In, int_IDEX_ReadData1Out, int_IDEX_ReadData2Out: std_logic_vector(7 downto 0);
signal int_IDEX_SignExtDataIn, int_IDEX_SignExtDataOut: std_logic_vector(7 downto 0);
signal int_WriteRegister, int_IDEX_RdIn, int_IDEX_RtIn, int_IDEX_RdOut, int_IDEX_RtOut: std_logic_vector(4 downto 0);
signal int_IFID_InstructionIn, int_IFID_InstructionOut: std_logic_vector(31 downto 0);

signal int_EXMEM_BranchAddress, int_EXMEM_ALUResult, int_EXMEM_MemWriteData, int_EXMEM_BranchAddressOut, int_EXMEM_ALUResultOut, int_EXMEM_MemWriteDataOut: std_logic_vector(7 downto 0);
signal int_EXMEM_DestinationReg, int_EXMEM_DestinationRegOut: std_logic_vector(4 downto 0);
signal int_EXMEM_Zero, int_EXMEM_ZeroOut: std_logic;

signal int_MEMWB_MemReadData, int_MEMWB_MemReadDataOut, int_MEMWB_ALUResult: std_logic_vector(7 downto 0);

signal IDEX_WB, EXMEM_WB, MEMWB_WB: std_logic_vector(1 downto 0);
signal IDEX_M, EXMEM_M: std_logic_vector(2 downto 0);
signal IDEX_EX: std_logic_vector(3 downto 0);
signal GReset_b, int_RegWrite, int_PCSrc: std_logic; 

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

component EX_stage
	port(GReset: in std_logic; 
		  IDEX_EX: in std_logic_vector(3 downto 0);
		  PC: in std_logic_vector(7 downto 0);
		  ReadData1, ReadData2: in std_logic_vector(7 downto 0);
		  SignExtData: in std_logic_vector(7 downto 0);
		  Rd, Rt: in std_logic_vector(4 downto 0);
		  ForwardA, ForwardB: in std_logic_vector(1 downto 0);
		  PrevALU, PrevWBMux: in std_logic_vector(7 downto 0);
		  BranchAddress: out std_logic_vector(7 downto 0); 
		  Zero: out std_logic;
		  ALUResult: out std_logic_vector(7 downto 0);
		  MemWriteData: out std_logic_vector(7 downto 0);
		  DestinationReg: out std_logic_vector(4 downto 0));
end component;

component MEM_stage
	port(GClk: in std_logic; 
		  EXMEM_M: in std_logic_vector(2 downto 0);
		  ALUResult, MemWriteData: in std_logic_vector(7 downto 0);
		  MemReadData: out std_logic_vector(7 downto 0));
end component; 

component nbit2to1mux
    GENERIC(n: integer:=8);
	PORT ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
end component;


begin 

Stage1: IF_stage
	port map(GClk, GReset, int_PCSrc, IF_Flush, PCWrite, int_EXMEM_BranchAddress, int_IFID_PCIn, int_IFID_InstructionIn);

IFID_reg: nbitreg
	generic map(n => 40)
	port map(reset_b => GReset_b, din(39 downto 32) => int_IFID_PCIn, din(31 downto 0) => int_IFID_InstructionIn, 
			   load => IFIDWrite, clk => GClk, dout(39 downto 32) => int_IFID_PCOut, dout(31 downto 0) => int_IFID_InstructionOut, dout_b => open);

Stage2: ID_stage  --Also stage 5 for WB
	port map(GClk, GReset, int_RegWrite, int_IFID_InstructionOut, int_WriteRegister, int_WriteData, 
				int_IDEX_ReadData1In, int_IDEX_ReadData2In, int_IDEX_SignExtDataIn, int_IDEX_RdIn, int_IDEX_RtIn); 
	
IDEX_reg: nbitreg
	generic map(n => 51)
	port map(reset_b => GReset_b, 
				din(50 downto 49) => WB,  
				din(48 downto 46) => M, 
				din(45 downto 42) => EX, 
				din(41 downto 34) => int_IFID_PCOut, 
				din(33 downto 26) => int_IDEX_ReadData1In, 
				din(25 downto 18) => int_IDEX_ReadData2In, 
				din(17 downto 10) => int_IDEX_SignExtDataIn, 
				din(9 downto 5) => int_IDEX_RtIn, 
				din(4 downto 0) => int_IDEX_RdIn, 
				load => '1', clk => GClk, 
				dout(50 downto 49) => IDEX_WB,  
				dout(48 downto 46) => IDEX_M, 
				dout(45 downto 42) => IDEX_EX, 
				dout(41 downto 34) => int_EX_PC, 
				dout(33 downto 26) => int_IDEX_ReadData1Out, 
				dout(25 downto 18) => int_IDEX_ReadData2Out, 
				dout(17 downto 10) => int_IDEX_SignExtDataOut, 
				dout(9 downto 5) => int_IDEX_RtOut, 
				dout(4 downto 0) => int_IDEX_RdOut, 
				dout_b => open);
				
Stage3: EX_stage
	port map(GReset, IDEX_EX, int_EX_PC, int_IDEX_ReadData1Out, int_IDEX_ReadData2Out, int_IDEX_SignExtDataOut, int_IDEX_RdOut, int_IDEX_RtOut, ForwardA, ForwardB, int_EXMEM_ALUResultOut, int_WriteData,
				int_EXMEM_BranchAddress, int_EXMEM_Zero, int_EXMEM_ALUResult, int_EXMEM_MemWriteData, int_EXMEM_DestinationReg); 
	
EXMEM_reg: nbitreg
	generic map(n => 35)
	port map(reset_b => GReset_b, 
				din(34 downto 33) => IDEX_WB, 
				din(32 downto 30) => IDEX_M, 
				din(29 downto 22) => int_EXMEM_BranchAddress, 
				din(21) => int_EXMEM_Zero, 
				din(20 downto 13) => int_EXMEM_ALUResult, 
				din(12 downto 5) => int_EXMEM_MemWriteData, 
				din(4 downto 0) => int_EXMEM_DestinationReg, 
				load => '1', clk => GClk, 
				dout(34 downto 33) => EXMEM_WB, 
				dout(32 downto 30) => EXMEM_M, 
				dout(29 downto 22) => int_EXMEM_BranchAddressOut, 
				dout(21) => int_EXMEM_ZeroOut, 
				dout(20 downto 13) => int_EXMEM_ALUResultOut, 
				dout(12 downto 5) => int_EXMEM_MemWriteDataOut, 
				dout(4 downto 0) => int_EXMEM_DestinationRegOut,
				dout_b => open);


Stage4: MEM_stage
	port map(GClk, EXMEM_M, int_EXMEM_ALUResultOut, int_EXMEM_MemWriteDataOut, int_MEMWB_MemReadData); 
	
MEMWB_reg: nbitreg
	generic map(n => 23)
	port map(reset_b => GReset_b, 
				din(22 downto 21) => EXMEM_WB, 
				din(20 downto 13) => int_MEMWB_MemReadData, 
				din(12 downto 5) => int_EXMEM_ALUResultOut,  
				din(4 downto 0) => int_EXMEM_DestinationRegOut, 
				load => '1', clk => GClk, 
				dout(22 downto 21) => MEMWB_WB, 
				dout(20 downto 13) => int_MEMWB_MemReadDataOut,
				dout(12 downto 5) => int_MEMWB_ALUResult,  
				dout(4 downto 0) => int_WriteRegister, 
				dout_b => open);
				
				
WBMux: nbit2to1mux
	generic map(n => 8)
	port map(i_0 => int_MEMWB_ALUResult, i_1 => int_MEMWB_MemReadDataOut, sel1 => MEMWB_WB(0), o => int_WriteData);
				
				
int_PCSrc <= '1' when (EXMEM_M(2) = '1' AND int_EXMEM_ZeroOut = '1') else '0'; --PCSrc = Branch AND Zero
int_RegWrite <= '1' when (MEMWB_WB(1) = '1') else '0';
				
				
GReset_b <= NOT GReset;

--outputs
ZeroOut <= int_EXMEM_Zero;
PCOut <= int_IFID_PCIn;
ALUResult <= int_EXMEM_ALUResult;
ReadData1 <= int_IDEX_ReadData1In;
ReadData2 <= int_IDEX_ReadData2In;
WriteData <= int_WriteData;
InstructionOut <= int_IFID_InstructionIn;


	
end rtl;