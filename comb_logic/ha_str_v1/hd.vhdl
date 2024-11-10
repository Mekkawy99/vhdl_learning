-- Design: Half adder using structural method
-- Concepts: Structural methods of writing VHDL code
-- Date: 10.11.2024
-- Engineer: Mohamed Elmekawy

library ieee;
use ieee.std_logic_1164.all;

-- and2 Entity and Architecture
entity and2 is
    port ( a, b : in std_logic;
           c : out std_logic );
end and2;

architecture and_arch of and2 is
begin
    -- AND gate operation
    c <= a and b;
end and_arch;

-- xor2 Entity and Architecture
entity xor2 is
    port ( a, b : in std_logic;
           c : out std_logic );
end xor2;

architecture xor_arch of xor2 is
begin
    -- XOR gate operation
    c <= a xor b;
end xor_arch;

-- half_add Entity and Architecture
entity half_add is
    port ( a, b : in std_logic;
           sum, carry : out std_logic );
end half_add;

architecture hd_arch of half_add is
    -- Component Declarations
    component and2
        port ( a, b : in std_logic;
               c : out std_logic );
    end component;

    component xor2
        port ( a, b : in std_logic;
               c : out std_logic );
    end component;

begin
    -- Component Instantiations
    xor_inst: xor2 port map(a => a, b => b, c => sum);
    and_inst: and2 port map(a => a, b => b, c => carry);
end hd_arch;
