library ieee;
use ieee.std_logic_1164.all;


entity EX_stage is
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
end EX_stage; 

architecture rtl of EX_stage is
signal int_ALUOperation, int_ALUEXOP: std_logic_vector(1 downto 0);
signal operA, operB, operBMux0, shftedData: std_logic_vector(7 downto 0);

component nbit2to1mux
   GENERIC(n: integer:=8);
	PORT ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
end component;

component nbit4to1mux  
	GENERIC(n: integer:=8);
	PORT ( i_0, i_1, i_2, i_3: IN std_logic_vector(n-1 downto 0);
			 sel1, sel2 : IN std_logic;
			 o : OUT std_logic_vector(n-1 downto 0));
END component;


component nbitaddersubtractor
	generic(n: integer:= 8);
	port(x : in STD_LOGIC_VECTOR(n-1 downto 0); -- First operand
        y : in STD_LOGIC_VECTOR(n-1 downto 0); -- Second operand
        cin : in STD_LOGIC;			-- Control signal for operation type
        sum : out STD_LOGIC_VECTOR(n-1 downto 0);  -- Result
        cout : out STD_LOGIC		-- Carry out
    );
end component;

component eightbitalu
	port(x : in STD_LOGIC_VECTOR(7 downto 0); -- First operand
        y : in STD_LOGIC_VECTOR(7 downto 0); -- Second operand
        opcode : in STD_LOGIC_VECTOR(1 downto 0);  -- 00=ADD, 01=SUB, 10=AND, 11=OR
        ALUResult : out STD_LOGIC_VECTOR(7 downto 0);  -- Result
        cout : out STD_LOGIC;		-- Carry out
		zero : out STD_LOGIC   	-- Zero flag
    );
end component;

component alucontrol
    port(ALUOp: in std_logic_vector(1 downto 0); 
         FunctionCode: in std_logic_vector(5 downto 0); 
         ALUFunc: out std_logic_vector (1 downto 0));
end component;

begin

control: alucontrol 
	port map(ALUOp => int_ALUEXOP, FunctionCode => SignExtData(5 downto 0), ALUFunc => int_ALUOperation);

OperandAMux: nbit4to1mux
	generic map(n => 8)
	port map(i_0 => ReadData1, i_1 => PrevALU, i_2 => PrevWBMux, i_3 => X"00", sel1 => ForwardA(0), sel2 => ForwardA(1), o => operA);

OperandBMux_input0: nbit2to1mux
	generic map(n => 8)
	port map(i_0 => ReadData2, i_1 => SignExtData, sel1 => IDEX_EX(0), o => operBMux0);
	
OperandBMux: nbit4to1mux
	generic map(n => 8)
	port map(i_0 => operBMux0, i_1 => PrevALU, i_2 => PrevWBMux, i_3 => X"00", sel1 => ForwardB(0), sel2 => ForwardB(1), o => operB);
	
	
ALU: eightbitalu
	port map(operA, operB, int_ALUOperation, ALUResult, open, Zero);
	
BTA_adder: nbitaddersubtractor
	generic map(n => 8)
	port map(PC, shftedData, '0', BranchAddress, open);
	
	
DestinationMux: nbit2to1mux
	generic map(n => 5)
	port map(i_0 => Rt, i_1 => Rd, sel1 => IDEX_EX(3), o => DestinationReg);

shftedData <= SignExtData(5 downto 0) & "00";
int_ALUEXOP <= IDEX_EX(2) & IDEX_EX(1);

MemWriteData <= ReadData2;

end rtl;