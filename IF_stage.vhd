library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
library lpm;
use lpm.lpm_components.all;


entity IF_stage is 
	port(GClk, GReset: in std_logic;
			PCSrc, IF_Flush: in std_logic; -- From Control Unit
			PCWrite: in std_logic; -- From Hazard Detection Unit
			branchAddress: in std_logic_vector(7 downto 0);
			IFID_PCIn: out std_logic_vector(7 downto 0);
			IFID_InstructionIn: out std_logic_vector(31 downto 0));
end IF_stage;


architecture rtl of IF_stage is
signal int_PCOut, int_PCIncremented, int_PCIn: std_logic_vector(7 downto 0);
signal GReset_b: std_logic;

component lpm_rom
    generic (
        LPM_WIDTH     : integer;
        LPM_WIDTHAD   : integer;
        LPM_FILE      : string;
        LPM_OUTDATA   : string := "UNREGISTERED"  -- or "REGISTERED"
    );
    port (
        address : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
        inclock : in std_logic := '0';  -- optional, depending on output type
        q       : out std_logic_vector(LPM_WIDTH-1 downto 0)
    );
end component;

component nbit2to1mux
   GENERIC(n: integer:=8);
	PORT ( i_0, i_1 : IN std_logic_vector( n-1 downto 0);
			 sel1 : IN std_logic;
			 o : OUT std_logic_vector( n-1 downto 0));
end component;

component nbitreg
    generic(n: integer:=4);
	port(reset_b: in std_logic;
		  din : in std_logic_vector(n-1 downto 0);
		  load, clk: in std_logic;
		  dout, dout_b : out std_logic_vector(n-1 downto 0));
end component;

component nbitaddersubtractor
	generic(n: integer:= 8);
	port(x : in STD_LOGIC_VECTOR(n-1 downto 0); -- First operand
        y : in STD_LOGIC_VECTOR(n-1 downto 0); -- Second operand
        cin : in STD_LOGIC;			-- Control signal for operation type
        sum : out STD_LOGIC_VECTOR(n-1 downto 0);  -- Result
        cout : out STD_LOGIC		-- Carry out
    );
end component;

begin 

PCmux: nbit2to1mux
	generic map(n => 8)
	port map( i_0 => int_PCIncremented, i_1 => branchAddress, sel1 => PCSrc, o => int_PCin);

PCReg: nbitreg
	generic map(n => 8)
	port map(reset_b => GReset_b, din => int_PCin, load => PCWrite, clk => GClk, dout => int_PCOut, dout_b => open);
	
PCAdder: nbitaddersubtractor
	generic map(n => 8)
	port map(x => int_PCOut, y => "00000100", cin => '0', sum => int_PCIncremented, cout => open);
	
InstructionMemory: lpm_rom
    generic map (
        LPM_WIDTH   => 32,
        LPM_WIDTHAD => 8,
        LPM_FILE    => "rom2_init.mif",
        LPM_OUTDATA => "UNREGISTERED"
    )
    port map (
        address => int_PCOut,
        inclock => GClk,
        q       => IFID_InstructionIn
    );


	
GReset_b <= NOT GReset;


IFID_PCIn <= int_PCIncremented;


end rtl;
			
			
	