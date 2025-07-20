library ieee;
use ieee.std_logic_1164.all;


entity ID_stage is
	port(GClk, GReset: in std_logic; 
		  RegWrite: in std_logic; -- Control signals
		  Instruction: in std_logic_vector(31 downto 0);
		  WriteRegister: in std_logic_vector(4 downto 0);
		  WriteData: in std_logic_vector(7 downto 0);
		  IDEX_ReadData1, IDEX_ReadData2: out std_logic_vector(7 downto 0); 
		  IDEX_SignExtData: out std_logic_vector(7 downto 0);
		  IDEX_Rd, IDEX_Rt: out std_logic_vector(4 downto 0));
end ID_stage;

architecture rtl of ID_stage is
signal GReset_b : std_logic;

component register_file
	port(clock, reset_b, regwrite: in std_logic; 
		  read_reg1, read_reg2, write_reg: in std_logic_vector(4 downto 0); 
		  write_data: in std_logic_vector(7 downto 0); 
		  read_data1, read_data2: out std_logic_vector(7 downto 0));
end component;

component nbitreg
    generic(n: integer:=4);
	port(reset_b: in std_logic;
		  din : in std_logic_vector(n-1 downto 0);
		  load, clk: in std_logic;
		  dout, dout_b : out std_logic_vector(n-1 downto 0));
end component;

begin 

reg_file: register_file
	port map(clock => GClk, reset_b => GReset_b, 
       regwrite => RegWrite,
		 read_reg1 => Instruction(25 downto 21),
		 read_reg2 => Instruction(20 downto 16), 
		 write_reg => WriteRegister, 
		 write_data => WriteData,
		 read_data1 => IDEX_ReadData1, 
		 read_data2 => IDEX_ReadData2);


GReset_b <= NOT GReset;
		 
		 
IDEX_SignExtData <= Instruction(5) & Instruction(5) & Instruction(5 downto 0);
IDEX_Rd <= Instruction(15 downto 11);
IDEX_Rt <= Instruction(20 downto 16);

end rtl;
		  