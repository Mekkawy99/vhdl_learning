library IEEE;
use IEEE.std_logic_1164.all;

entity exor is
    port (
        a, b : in bit;
        c    : out bit
    );
end exor;

architecture behavioral of exor is
begin
    c <= a xor b;
end behavioral;