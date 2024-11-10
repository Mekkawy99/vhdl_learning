

library ieee;
use IEEE.std_logic_1164.all;


entity and2 is
    port(
        a,b: in bit;
        c: out bit
    );
end and2;


architecture behav of and2 is 
    begin
        c <= a and b;
end behav;


configuration and2_config of and2 is
    for behav 
    end for;
end and2_config;

