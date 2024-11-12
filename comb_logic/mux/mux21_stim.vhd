

library ieee;
use ieee.std_logic_1164.all;

entity mux21_stim is
    port (
        in1, in2, in3: out std_logic;
        res: in std_logic
    );
end mux21_stim;


architecture behav of mux21_stim is 
    -- Component
    -- singlas
    subtype t3 is std_logic_vector (2 downto 0);
    begin
        process 
        begin
            (in1, in2, in3) <= t3'("000") after 0 ns,
            t3'("001") after 10 ns,
            t3'("010") after 20 ns,
            t3'("011") after 30 ns,
            t3'("100") after 40 ns,
            t3'("101") after 50 ns,
            t3'("110") after 60 ns,
            t3'("111") after 70 ns;
            wait for 1 ns;
            assert (res='0') report "Result is not 0" severity error;
            wait for 10 ns;
            assert (res='1') report "Result is not 1" severity error;
        end process;
    end behav;
