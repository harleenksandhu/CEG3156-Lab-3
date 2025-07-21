library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
    port(EXMEM_WB, MEMWB_WB: in std_logic_vector(1 downto 0);       -- WB = RegWrite, MemtoReg
         IDEX_Rs, IDEX_Rt, EXMEM_Rd, MEMWB_Rd: in std_logic_vector(4 downto 0);
         selForwardA, selFordwardB: out std_logic_vector(1 downto 0));   
end forwarding_unit;

architecture struc of forwarding_unit is
signal EXMEM_RegWrite, MEMWB_RegWrite, ex_rs_match, ex_rt_match, mem_rs_match, mem_rt_match: std_logic;

begin

EXMEM_RegWrite  <= EXMEM_WB(0);
MEMWB_RegWrite <= MEMWB_WB(0);

ex_rs_match  <= '1' when (EXMEM_RegWrite = '1' and EXMEM_Rd /= "00000" and EXMEM_Rd = IDEX_Rs) else '0';
ex_rt_match  <= '1' when (EXMEM_RegWrite = '1' and EXMEM_Rd /= "00000" and EXMEM_Rd = IDEX_Rt) else '0';
mem_rs_match <= '1' when (MEMWB_RegWrite = '1' and MEMWB_Rd /= "00000" and MEMWB_Rd = IDEX_Rs) else '0';
mem_rt_match <= '1' when (MEMWB_RegWrite = '1' and MEMWB_Rd /= "00000" and MEMWB_Rd = IDEX_Rt) else '0';

-- 00 = ID/EX (register file)
-- 01 = MEM/WB (Data memory or ALU result)
-- 10 = EX/MEM (prior ALU result)
selForwardA <= "10" when ex_rs_match = '1' else
               "01" when mem_rs_match = '1' else
               "00";

selFordwardB <= "10" when ex_rt_match = '1' else
                "01" when mem_rt_match = '1' else
                "00";

end struc; 
