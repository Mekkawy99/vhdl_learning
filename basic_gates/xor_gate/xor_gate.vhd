


-- XOR gate


library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
port (
    a,b: in std_logic;
    c: out std_logic
);

end xor_gate;



architecture behav of xor_gate is

begin
c <= a xor b;

end behav;
