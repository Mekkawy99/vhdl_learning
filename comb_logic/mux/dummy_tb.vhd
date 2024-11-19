


library ieee;
use IEEE.std_logic_1164.all;


entity mux21_dtb is 
-- Empty
end mux21_dtb;


architecture struct of mux21_dtb is
    -- component
    component mux21_stim
        port (in1,in2,in3: out std_ulogic;
            res: in std_ulogic
        );
    end component;

    component mux21 
    port (
        in1,in2,in3: in std_ulogic;
        res: out std_ulogic
    );
    end component;
    
    -- signal
    signal x1, x2, x3, o: std_ulogic;
    begin

        stimuli: mux21_stim port map (x1, x2, x3, o);
        dut: mux21 port map (x1, x2, x3, o);
end struct;

configuration mux21_config2 of mux21_dtb is
    for struct
        for stimuli: mux21_stim
            use entity work.mux21_stim (behav)
        end for;
        for dut: mux21
            use configuration work.mux21_config1;
        end for;
    end for;
end configuration mux21_config2;