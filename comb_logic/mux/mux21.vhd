library ieee;
use ieee.std_logic_1164.all;

entity mux21 is
    port (
        i1     : in std_logic;
        i2     : in std_logic;
        sel    : in std_logic;
        result : out std_logic
    );
end mux21;

architecture mux_struc of mux21 is

    -- Component declarations
    component and2_component 
        port (a, b: in std_logic; c: out std_logic);
    end component;

    component inv_component 
        port (a: in std_logic; x: out std_logic);
    end component;

    component or2_component 
        port (a, b: in std_logic; c: out std_logic);
    end component;
    
    -- Internal signals for intermediate connections
    signal s1, s2, selbar : std_logic;

begin

    -- Instantiate AND gate for i1 and sel
    in_gate_1 : and2_component port map (a => i1, b => sel, c => s1);

    -- Instantiate inverter for sel
    sel_inverter : inv_component port map (a => sel, x => selbar);

    -- Instantiate AND gate for i2 and selbar
    in_gate_2 : and2_component port map (a => i2, b => selbar, c => s2);

    -- Instantiate OR gate to produce the final result
    out_gate : or2_component port map (a => s1, b => s2, c => result);

end mux_struc;

-- Configuration block for specifying component configurations
configuration mux21_config1 of mux21 is
    for mux_struc
        for all : and2_component
            use configuration work.and2_config;
        end for;
        
        for out_gate : or2_component
            use configuration work.or2_config;
        end for;
        
        for sel_inverter : inv_component
            use configuration work.inverter_config; 
        end for;
    end for;
end configuration mux21_config1;
