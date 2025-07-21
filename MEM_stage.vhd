library ieee;
use ieee.std_logic_1164.all;

library altera_mf;
library lpm;
use lpm.lpm_components.all;

entity MEM_stage is
	port(GClk: in std_logic; 
		  EXMEM_M: in std_logic_vector(2 downto 0);
		  ALUResult, MemWriteData: in std_logic_vector(7 downto 0);
		  MemReadData: out std_logic_vector(7 downto 0));
end MEM_stage; 


architecture rtl of MEM_stage is

component lpm_ram_dq
    generic (
        LPM_WIDTH     : integer;        -- Data width
        LPM_WIDTHAD   : integer;        -- Address width
        LPM_NUMWORDS  : integer := 0;   -- Optional: defaults to 2^LPM_WIDTHAD
        LPM_INDATA    : string  := "REGISTERED";
        LPM_OUTDATA   : string  := "UNREGISTERED";
        LPM_FILE      : string  := "UNUSED";  -- .mif file (optional)
        LPM_TYPE      : string  := "LPM_RAM_DQ";
        LPM_HINT      : string  := "USE_EAB=ON"
    );
    port (
        data     : in std_logic_vector(LPM_WIDTH-1 downto 0);
        address  : in std_logic_vector(LPM_WIDTHAD-1 downto 0);
        inclock  : in std_logic;
        we       : in std_logic;
        q        : out std_logic_vector(LPM_WIDTH-1 downto 0)
    );
end component;

begin 

data_mem : lpm_ram_dq
    generic map (
        LPM_WIDTH    => 8,
        LPM_WIDTHAD  => 8,
        LPM_FILE     => "ram_init.mif",
        LPM_OUTDATA  => "UNREGISTERED",
        LPM_INDATA   => "REGISTERED"
    )
    port map (
        data     => MemWriteData,
        address  => ALUResult,
        inclock  => GClk,
        we       => EXMEM_M(0),
        q        => MemReadData
    );


end rtl;