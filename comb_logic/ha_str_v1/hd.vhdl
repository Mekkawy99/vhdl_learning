-- Design: Half adder using strcutural method
-- Concepts: Structual methods of writing codes
-- Date: 10.11.2024
-- Engineer: Mohamed Elmekawy

library ieee;
use ieee.std_logic_1164.all;


entity and2 is
port ( a,b: in std_logic;
c: out std_logic
);
end and2;

architecture and_arch of and2 is
begin
process (a,b) begin
c <= a and b;
end process;
end and_arch;


entity xor2 is
port ( a,b: in std_logic;
c: out std_logic
);
end xor2;

architecture xor_arch of xor2 is
-- components
begin
process (a,b) begin
c <= a xor b;
end process;

end xor_arch;


entity half_add is
port ( a,b: in std_logic;
sum,carry: out std_logic
);
end half_add;

architecture hd_arch of half_add is
-- component

component and2
        port (
            a, b : in std_logic;
            c    : out std_logic
        );
    end component;

    component xor2
        port (
            a, b : in std_logic;
            c    : out std_logic
        );
    end component;

    -- Signals for connecting components
    signal xor_out : std_logic;
begin
    -- Component Instantiations
    xor_inst: xor2 port map(a => a, b => b, c => sum);
    and_inst: and2 port map(a => a, b => b, c => carry);

end hd_arch;
