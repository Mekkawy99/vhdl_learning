

-- ---------------------
-- Test bench for and gate
-- ---------------------


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity testbench is
        -- empty as tb has no inputs or outputs 
end testbench ;


architecture behav of testbench is 
    -- DUT component
    component and_gate is
        port (
            a : in std_logic;
            b : in std_logic;
            c : out std_logic
        );
    end component;
    -- internal signals/wires
    signal a_in, b_in, c_out : std_logic; 
        -- no need to define them input/output as they are just wires.
    -- connect wires with the DUT (component)
    -- Start the body of architecture
    begin
        DUT: and_gate port map (a => a_in, b => b_in, c => c_out); 
    
    -- Start to assign values and watch the results
    process
        begin
            a_in <= '0';
            b_in <= '0';
            wait for 1 ns;
            assert (c_out='0') report "Fail 0/0" severity error;

            a_in <= '0';
            b_in <= '1';
            wait for 1 ns;
            assert (c_out='0') report "Fail 0/1" severity error;

            a_in <= '1';
            b_in <= '0';
            wait for 1 ns;
            assert (c_out='0') report "Fail 1/0" severity error;

            a_in <= '1';
            b_in <= '1';
            wait for 1 ns;
            assert (c_out='1') report "Fail 1/1" severity error;

        end process;
    end behav;