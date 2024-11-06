

library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

-- First method to implement the half adder
entity half_adder1 is
port (
a: in std_logic;      -- input 1
b: in std_logic;      -- input 2
sum: out std_logic;   -- sum
carry: out std_logic  -- carry out
);

end half_adder1;

-- *************************************
-- Second method to implement the half adder.
-- I will use an n integer entity this time for more clarity.
entity half_adder2 is
-- define the parameter values

generic (n : natural := 2);

port (
a: in std_logic_vector(n-1 downto 0);
b: in std_logic_vector(n-1 downto 0);
sum: out std_logic_vector(n-1 downto 0);
carry: out std_logic
);
end half_adder2;

-- *************************************

architecture behav of half_adder1 is

-- signal and intermediate vars

begin

sum  <= a xor b;
carry <= a and b;

end behav;

architecture behav2 of half_adder2 is
-- signal
signal result: std_logic_vector(n downto 0);
begin
result <= std_logic_vector(unsigned(a) + unsigned(b));
sum    <= result(n-1 downto 0);
carry  <= result(n);

end behav2;
