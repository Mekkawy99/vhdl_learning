-- Code your testbench here
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity testbench is
-- empty
end testbench;


architecture testbench of testbench is

-- signals for half_adder1
signal a1,b1: std_logic;
signal sum1, carry1: std_logic;

-- signals for half_adder2
constant n: natural :=2;
signal a2,b2: std_logic_vector(n-1 downto 0);
signal sum2: std_logic_vector(n-1 downto 0);
signal carry2: std_logic;

begin
-- instantiate half_adder1
dut1: half_adder1 port map (
	  a     => a1,
      b     => b1,
      sum   => sum1,
      carry => carry1
);

dut2: half_adder2 generic map (
      n => n
    )
    port map (
      a     => a2,
      b     => b2,
      sum   => sum2,
      carry => carry2

);

process begin
	a1 <= '0'; b1 <= '0';
    wait for 10 ps;

end process
end testbench;
