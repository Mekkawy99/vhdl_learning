
----------------------------------------
-- Design name: AND gate
-- Date: 05.11.2024
-- Engineer: Mohamed Elmekawy
----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port (
        a: in STD_LOGIC;
        b: in STD_LOGIC;
        c: out STD_LOGIC
    );

end and_gate;


architecture behav of and_gate is
begin

    c <= a and b;
end behav;

-- Configuration added: It is empty, it is just to be familiar with the main components in any vhdl code

configuration and_config of and_gate is
    FOR behav 
    end FOR;

end and_config;
