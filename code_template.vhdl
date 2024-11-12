-- Library imports
-- Start by importing required libraries. IEEE libraries are commonly used.
library ieee;
use ieee.std_logic_1164.all;
-- Add additional libraries as needed (e.g., ieee.numeric_std for arithmetic operations).

-- Entity Declaration
-- The entity defines the interface (input/output ports) for the module.
entity <entity_name> is
    port (
        -- Define all input and output ports here, with comments explaining each signal's purpose.
        input1   : in  std_logic;    -- Example input
        input2   : in  std_logic;    -- Example input
        output1  : out std_logic     -- Example output
        -- Add more ports as needed, with appropriate data types.
    );
end <entity_name>;

-- Architecture Declaration
-- The architecture describes the internal design/implementation of the entity.
architecture <architecture_name> of <entity_name> is

    -- Component Declarations (optional)
    -- Declare any sub-components if the design is hierarchical and instantiates other components.
    component <component_name>
        port (
            a, b : in std_logic; 
            c    : out std_logic
        );
    end component;
    -- Add more component declarations as necessary.

    -- Internal Signal Declarations
    -- Declare signals for internal connections or intermediate values.
    signal internal_signal1 : std_logic; -- Intermediate signal for storing internal values
    signal internal_signal2 : std_logic; -- Additional signals as needed

begin

    -- Component Instantiations (if needed)
    -- Instantiate sub-components and map signals/ports to their interface.
    -- Example: AND gate instantiation
    and_gate1 : <component_name> port map (a => input1, b => input2, c => internal_signal1);
    -- Repeat for other components and provide meaningful names for each instance.

    -- Concurrent Statements / Main Design Logic
    -- Add the primary logic for the design here, using concurrent statements.
    -- Use logical/conditional operations, assignments, and component instances as needed.
    output1 <= internal_signal1 and internal_signal2; -- Example logic operation

end <architecture_name>;

-- Configuration Declaration (Optional)
-- A configuration block is used if there are specific component configurations.
-- Define configuration if needed; otherwise, this section can be omitted.
configuration <config_name> of <entity_name> is
    for <architecture_name>
        -- Configuration for each component instance
        for all : <component_name>
            use configuration work.<specific_config>;
        end for;
    end for;
end configuration <config_name>;

-- Testbench Template (Optional, but recommended for testing)
-- This is a basic structure for a testbench, which allows you to test the design's functionality.
library ieee;
use ieee.std_logic_1164.all;

entity <entity_name>_tb is
end <entity_name>_tb;

architecture behavior of <entity_name>_tb is
    -- Instantiate the design under test (DUT) and define test signals.
    signal tb_input1, tb_input2 : std_logic;
    signal tb_output1           : std_logic;

    -- Instantiate the DUT
    component <entity_name>
        port (
            input1  : in  std_logic;
            input2  : in  std_logic;
            output1 : out std_logic
        );
    end component;

begin
    -- DUT instantiation
    DUT: <entity_name> port map (input1 => tb_input1, input2 => tb_input2, output1 => tb_output1);

    -- Test process to drive stimulus to the DUT
    process
    begin
        -- Apply test cases with wait statements to simulate different inputs.
        tb_input1 <= '0';
        tb_input2 <= '0';
        wait for 10 ns;

        tb_input1 <= '1';
        tb_input2 <= '0';
        wait for 10 ns;

        -- Add more test cases as needed.
        wait; -- End the process
    end process;

end behavior;
