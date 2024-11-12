

library ieee;
use IEEE.std_logic_1164.all;


entity mux21_tb is
end mux21_tb;


architecture struct of mux21_tb is
    -- component
    component mux21_stim port (in1, in2, in3: out std_logic; res: in std_logic);
end component;
    component mux21
    port (
        i1, i2, sel: in std_logic;
        result: out std_logic;
    );
end component;
    -- signals
    signal x1, x2, x3, o: std_logic;
    begin
stimuli: mux21_stim port map (
    x1, x2, x3,o
);
circuit: mux21 port map (
    x1, x2, x3, o
);

    end struct;

configuration mux21_tb_config of mux21_tb is

    for struct
    for stimuli: mux21_stim
        use entity work.mux21_stim(behav);
end for;
for circuit: mux21
    use configuration work.mux21_config1;
end for;

    end mux21_tb_config;