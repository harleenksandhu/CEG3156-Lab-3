library ieee;
use ieee.std_logic_1164.all;

entity main_control is
    port(Instruction: in std_logic_vector(31 downto 0); 
         selControl: in std_logic;
         Jump: out std_logic;     
         EX: out std_logic_vector(3 downto 0);     -- EX = RegDst, ALUOp1, ALUOp0, ALUSrc
         MEM: out std_logic_vector(2 downto 0);    -- MEM = Branch, MemRead, MemWrite
         WB: out std_logic_vector(1 downto 0));    -- WB = RegWrite, MemtoReg
end main_control;

architecture struc of main_control is
signal Op5, Op4, Op3, Op2, Op1, Op0, Rformat, lw, sw, beq, jump_op: std_logic;
signal RegDst, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch: std_logic;
signal ALUOp: std_logic_vector(1 downto 0);
signal control_signals: std_logic_vector(8 downto 0);       -- Full control word
signal int_control_signals: std_logic_vector(8 downto 0);   -- Output after mux


begin

Op5 <= Instruction(31);
Op4 <= Instruction(30);
Op3 <= Instruction(29);
Op2 <= Instruction(28);
Op1 <= Instruction(27);
Op0 <= Instruction(26);

Rformat <= (not Op5) AND (not Op4) AND (not Op3) AND (not Op2) AND (not Op1) AND (not Op0);
lw <= (Op5) AND (not Op4) AND (not Op3) AND (not Op2) AND (Op1) AND (Op0);
sw <= (Op5) AND (not Op4) AND (Op3) AND (not Op2) AND (Op1) AND (Op0);
beq <= (not Op5) AND (not Op4) AND (not Op3) AND (Op2) AND (not Op1) AND (not Op0);
jump_op <= (not Op5) AND (not Op4) AND (not Op3) AND (not Op2) AND (Op1) AND (not Op0);  -- opcode 000010

RegDst <= Rformat;
ALUSrc <= lw OR sw;
MemtoReg <= lw;
RegWrite <= Rformat OR lw;
MemRead <= lw;
MemWrite <= sw;
Branch <= beq;
ALUOp(0) <= beq;
ALUOp(1) <= Rformat;

-- Combine into one 10-bit vector
control_signals <= RegDst & ALUOp(1) & ALUOp(0) & ALUSrc & Branch & MemRead & MemWrite & RegWrite & MemtoReg;

-- if selControl = '0' use control_signals, else use "0000000000" (aka stalling)
int_control_signals <= control_signals when selControl = '0' else (others => '0');

-- Split final signals
EX   <= int_control_signals(8) & int_control_signals(7) & int_control_signals(6) & int_control_signals(5);
MEM  <= int_control_signals(4) & int_control_signals(3) & int_control_signals(2);
WB   <= int_control_signals(1) & int_control_signals(0);
Jump <= jump_op;

end struc;