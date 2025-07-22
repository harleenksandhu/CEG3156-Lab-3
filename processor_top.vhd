library ieee;
use ieee.std_logic_1164.all;

entity processor_top is
    port(ValueSelect: in std_logic_vector(2 downto 0);
        GClk, GReset: in std_logic;
        MuxOut: out std_logic_vector(7 downto 0);
        BranchOut, MemWriteOut, RegWriteOut, ZeroOut: out std_logic);
end processor_top;

architecture rtl of processor_top is

    signal int_pcout, int_aluresult, int_readdata1, int_readdata2, int_writedata : std_logic_vector(7 downto 0);
    signal int_instruction : std_logic_vector(31 downto 0);
    signal greset_b, int_jump, int_zero: std_logic;
	signal int_WB: std_logic_vector(1 downto 0);
	signal int_M, int_IDEX_M, int_EXMEM_M: std_logic_vector(2 downto 0);
	signal int_EX: std_logic_vector(3 downto 0);
    signal int_controlinfo : std_logic_vector(7 downto 0);
	 
	-- Hazard Detection Unit and Forwarding Unit internal signals
	signal int_PCWrite, int_IFIDWrite: std_logic;
	signal int_IFID_Rs, int_IFID_Rt, int_IDEX_Rt, int_IDEX_Rs: std_logic_vector(4 downto 0);
	signal int_EXMEM_Rd, int_MEMWB_Rd: std_logic_vector(4 downto 0);
	signal int_EXMEM_WB, int_MEMWB_WB: std_logic_vector(1 downto 0);
	signal int_selControl: std_logic;
	signal int_ForwardA, int_ForwardB: std_logic_vector(1 downto 0);

component nbit8to1mux
    GENERIC(n: integer:=8);
	PORT ( i0, i1, i2, i3, i4, i5, i6, i7 : IN std_logic_vector( n-1 downto 0);
		   sel : IN std_logic_vector(2 downto 0);
		   o : OUT std_logic_vector( n-1 downto 0));
end component;

component pipeline_datapath
	port(GClk, GReset: in std_logic ; 
			IF_Flush: in std_logic; -- From control unit
			WB: in std_logic_vector(1 downto 0); -- from control unit
			M: in std_logic_vector(2 downto 0); -- from control unit
			EX: in std_logic_vector(3 downto 0); -- from control unit
			PCWrite, IFIDWrite: in std_logic; --from hazard detection unit
			ForwardA, ForwardB: in std_logic_vector(1 downto 0); --from forwarding unit
			InstructionOut: out std_logic_vector(31 downto 0);
			PCOut, ALUResult, ReadData1, ReadData2, WriteData: out std_logic_vector(7 downto 0); 
			ZeroOut: out std_logic;
			o_IDEX_M, o_EXMEM_M: out std_logic_vector(2 downto 0);
         o_IDEX_Rt, o_IFID_Rs, o_IFID_Rt: out std_logic_vector(4 downto 0);
			o_EXMEM_WB, o_MEMWB_WB: out std_logic_vector(1 downto 0);       -- WB = RegWrite, MemtoReg
         o_IDEX_Rs, o_EXMEM_Rd, o_MEMWB_Rd: out std_logic_vector(4 downto 0));
end component;

component main_control
    port(Instruction: in std_logic_vector(31 downto 0); 
	     selControl: in std_logic;   
         Jump: out std_logic;     
         EX: out std_logic_vector(3 downto 0);     -- EX = RegDst, ALUOp1, ALUOp0, ALUSrc
         MEM: out std_logic_vector(2 downto 0);    -- MEM = Branch, MemRead, MemWrite
         WB: out std_logic_vector(1 downto 0));    -- WB = RegWrite, MemtoReg
end component;

component hazard_detect_unit
    port(
        IDEX_M, EXMEM_M: in std_logic_vector(2 downto 0);
        IDEX_Rt, IFID_Rs, IFID_Rt: in std_logic_vector(4 downto 0);
        PCWrite, IFID_Write, selControl: out std_logic);
end component;

component forwarding_unit
    port(EXMEM_WB, MEMWB_WB: in std_logic_vector(1 downto 0);       -- WB = RegWrite, MemtoReg
         IDEX_Rs, IDEX_Rt, EXMEM_Rd, MEMWB_Rd: in std_logic_vector(4 downto 0);
         selForwardA, selFordwardB: out std_logic_vector(1 downto 0));   
end component;


begin

control: main_control
    port map(Instruction => int_instruction, 
		 selControl => int_selControl,
         Jump => int_jump,    --HOW DOES JUMP WORK FOR PIPELINE??? 
         EX => int_EX,     
         MEM => int_M,    
         WB => int_WB    
    );	


hazardDetection: hazard_detect_unit
    port map (
        IDEX_M      => int_IDEX_M,
        EXMEM_M     => int_EXMEM_M,  -- or another EXMEM_M signal if pipelined
        IDEX_Rt     => int_IDEX_Rt,
        IFID_Rs     => int_IFID_Rs,
        IFID_Rt     => int_IFID_Rt,
        PCWrite     => int_PCWrite,
        IFID_Write  => int_IFIDWrite,
        selControl  => int_selControl
    );


forwardingUnit : forwarding_unit
    port map (
        EXMEM_WB     => int_EXMEM_WB,
        MEMWB_WB     => int_MEMWB_WB,
        IDEX_Rs      => int_IDEX_Rs,
        IDEX_Rt      => int_IDEX_Rt,
        EXMEM_Rd     => int_EXMEM_Rd,
        MEMWB_Rd     => int_MEMWB_Rd,
        selForwardA  => int_ForwardA,
        selFordwardB => int_ForwardB
    );


datapath: pipeline_datapath
	port map(GClk => GClk, 
				GReset => GReset,
				IF_Flush => '0',--idk how it's used, for now set to 0
				WB => int_WB, -- from control unit
				M => int_M,  -- from control unit
				EX => int_EX, -- from control unit
				PCWrite      => int_PCWrite,
				IFIDWrite    => int_IFIDWrite,
				ForwardA     => int_ForwardA,
				ForwardB     => int_ForwardB,
				InstructionOut => int_instruction, 
				PCOut => int_pcout,
			   ALUResult => int_aluresult,
			   ReadData1 => int_readdata1,
			   ReadData2 => int_readdata2,
			   WriteData => int_writedata,
				ZeroOut => int_zero,
				o_IDEX_M => int_IDEX_M, 
				o_EXMEM_M => int_EXMEM_M,
				o_IDEX_Rt => int_IDEX_Rt,
				o_IFID_Rs => int_IFID_Rs,
				o_IFID_Rt => int_IFID_Rt,
				o_EXMEM_WB => int_EXMEM_WB,
				o_MEMWB_WB => int_MEMWB_WB,
				o_IDEX_Rs  => int_IDEX_Rs,
				o_EXMEM_Rd => int_EXMEM_Rd,
				o_MEMWB_Rd => int_MEMWB_Rd );

int_controlinfo <= '0' & int_EX(2) & int_jump & int_M(1) & int_WB(0) & int_EX(2) & int_EX(1) & int_EX(0);

ValueSelectMux: nbit8to1mux
    port map(
        i0 => int_pcout,
        i1 => int_aluresult,
        i2 => int_readdata1,
        i3 => int_readdata2,
        i4 => int_writedata,
        i5 => int_controlinfo,
        i6 => int_controlinfo,
        i7 => int_controlinfo,
        sel => ValueSelect,
        o => MuxOut
    );


--InstructionOut <= int_instruction;
BranchOut <= int_M(2);
ZeroOut <= int_zero;
MemWriteOut <= int_M(0);
RegWriteOut <= int_WB(1);

end rtl; 