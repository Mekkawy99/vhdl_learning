
library ieee;
use IEEE.std_logic_1164.all;


entity mux21_stim is 
port (
    in1,in2,in3 : out std_ulogic; -- unresolved logic that could take 9 value such as 0,1,x,z, weak 1, weak 0 and so on.
    res : in std_ulogic
);
end mux21_stim;


architecture behav of mux21_stim is
    -- component
    -- signals
    subtype t3 is std_ulogic_vectore (1 to 3);
    begin
        process
        begin
            (in1, in2, in3) <= t3'("000") after 0 ns,
            (in1, in2, in3) <= t3'("001") after 10 ns,
            (in1, in2, in3) <= t3'("100") after 20 ns,
            (in1, in2, in3) <= t3'("101") after 30 ns,
            (in1, in2, in3) <= t3'("010") after 40 ns,
            (in1, in2, in3) <= t3'("011") after 50 ns,
            (in1, in2, in3) <= t3'("110") after 60 ns,
            (in1, in2, in3) <= t3'("111") after 70 ns,
            (in1, in2, in3) <= t3'("X01") after 80 ns,
            (in1, in2, in3) <= t3'("10X") after 90 ns,
            (in1, in2, in3) <= t3'("x11") after 100 ns,
            (in1, in2, in3) <= t3'("11x") after 110 ns,


            wait for 1 ns;
            assert (res = '0') report "Result is not 0" severity error;
            wait for 10 ns;
            assert (res ='1') report "Result is not 1" severity error;
        end process;



    end behav;