
-- Testbnech


library ieee;
use ieee.std_logic_1164.all;


entity testbench is
-- empty
end testbench;



architecture testbench of testbench is
-- component
component not_gate is
port (
    a: in std_logic;
    x: out std_logic
);
end component;
-- wires and signals
signal a_in, x_out: std_logic;

begin

-- initialize the DUT and do port mapping
DUT: not_gate port map (a => a_in, x => x_out);
-- assert values and check the output result
process
    begin
        a_in <= '0';
        wait for 1 ps;
        assert(x_out='1') report "Fail at input 0" severity error;

        a_in <= '1';
        wait for 1 ps;
        assert(x_out='0') report "Fail at input 1" severity error;

        -- stop simulation
        wait;
    end process;

end testbench;
