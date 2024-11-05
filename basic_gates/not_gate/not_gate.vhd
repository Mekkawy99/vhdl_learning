-- NOT gate

library IEEE;
use ieee.std_logic_1164.all;

entity not_gate is
    port (
        a: in std_logic;
        x: out std_logic
    );
end not_gate;


architecture behav of not_gate is
begin
    x <= not a;
end behav;
