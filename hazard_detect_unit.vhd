library ieee;
use ieee.std_logic_1164.all;

entity hazard_detect_unit is
    port(
        IDEX_M, EXMEM_M: std_logic_vector(2 downto 0);
        IDEX_Rt, IFID_Rs, IFID_Rt: in std_logic_vector(4 downto 0);
        PCWrite, IFID_Write, selControl: out std_logic);
end hazard_detect_unit;

architecture struc of hazard_detect_unit is
signal IDEX_MemRead, IDEX_Branch, EXMEM_Branch, loadUse, pcEnable: std_logic;

begin
IDEX_MemRead <= IDEX_M(1);
IDEX_Branch <= IDEX_M(2);
EXMEM_Branch <= EXMEM_M(2);

loadUse <= '1' when (IDEX_MemRead = '1' and (IDEX_Rt = IFID_Rs or IDEX_Rt = IFID_Rt)) else '0';
pcenable <= '0' when (loadUse = '1' or IDEX_Branch = '1' or EXMEM_Branch = '1') else '1';

PCWrite <= pcEnable;
IFID_Write <= pcEnable;
selControl <= not loadUse;

end struc;