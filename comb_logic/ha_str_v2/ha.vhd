-- Design: half adder version 2
-- Concept: write half adder using structural method. write components on the structural in different files. use and2 gate you generated before and use xor gate of the library.
-- Date: 10.11.2024
-- Engineer: Mohamed Elmekawy

library IEEE;
use IEEE.std_logic_1164.all;

entity half_add is
    port (
        a, b   : in bit;
        sum, carry : out bit
    );
end half_add;

architecture ha_arch of half_add is
    -- Component Declarations
    component xor2 
        port (
            a, b : in bit;
            c : out bit
        );
    end component;

    component and2 
        port (
            a, b : in bit;
            c : out bit
        );
    end component;

begin
    -- Component Instantiation
    and_inst: and2 port map (a => a, b => b, c => carry);
    xor_inst: xor2 port map (a => a, b => b, c => sum);
end ha_arch;

-- Configuration for the half_adder
configuration ha_config_1 of half_add is
    for ha_arch
        -- Component configuration for xor2
        for xor_inst: xor2
            use entity work.exor(behavioral);
        end for;
        -- Component configuration for and2
        for and_inst: and2
            use configuration work.and2_config;
        end for;
    end for;
end ha_config_1;
