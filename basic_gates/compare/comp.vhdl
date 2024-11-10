-- Design: Compare 
-- Concept: IF and PROCESS statements
-- Engineer: Mohamed Elmekawy

library IEEE;
using ieee.std_logic_1164.all;


entity comp is
port (a,b: in std_logic,
	c: out std_logic);

end comp;

architecture arch1 of comp is begin
PROCESS (a,b) begin
if (a>b) then c <= '1';
else c <= '0';
end if; 
end PROCESS;

end arch1;
