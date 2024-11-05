
-- Testbench

library ieee;
use ieee.std_logic_1164.all;

entity testbench is
-- empty
end testbench;


architecture testbench of testbench is
-- component
component xor_gate is
port (
    a,b: in std_logic;
    c: out std_logic
);
end component;

-- signals and wires
signal a_in, b_in, c_out: std_logic;

begin
-- dut port mapping
DUT: xor_gate port map (a => a_in, b => b_in, c => c_out);
process
begin
    a_in <= '0';
    b_in <= '0';
    wait for 1 ps;
    assert(c_out='0') report "Failed 0/0" severity error;

    a_in <= '0';
    b_in <= '1';
    wait for 1 ps;
    assert(c_out='1') report "Failed 0/1" severity error;

    a_in <= '1';
    b_in <= '0';
    wait for 1 ps;
    assert(c_out='1') report "Failed 1/0" severity error;

    a_in <= '1';
    b_in <= '1';
    wait for 1 ps;
    assert(c_out='0') report "Failed 1/1" severity error;

    wait;

end process;

end testbench;
