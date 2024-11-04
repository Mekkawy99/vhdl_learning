-- Adder

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder is
    port (
        a,b : in std_logic_vector(7 downto 0);
        cin: in std_logic_vector(0 downto 0);
        s: out std_logic_vector(7 downto 0);
        cout: out std_logic_vector(0 downto 0)
    );
end adder;

architecture behav1 of adder is

    signal internal_sum: unsigned(8 downto 0); -- to hold all the sum in 9 bits to divide it later on S and Cout

begin
internal_sum <= resize(unsigned(a), 9) + resize(unsigned(b), 9) + resize(unsigned(cin), 9);
s <= std_logic_vector(internal_sum(7 downto 0));
cout <= std_logic_vector(internal_sum(8 downto 8));
end behav1 ; -- behav1