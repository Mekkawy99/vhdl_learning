-- Project: Moore FSM that has four state machinse. Out depends on the current state only.
-- Date: Sat 16 NOV, 2024
-- Concepts: Enum, state signals, edge-triggered state machines
-- By: Mohamed Elmekawy

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY fsm IS
	PORT (
		in1 : IN BIT;
		in2 : IN BIT;
		clk : IN BIT;
		rst : IN BIT;
		out1 : OUT BIT;
		out2 : OUT BIT;
		out3 : OUT BIT
	);

	-- Declare the sates
	TYPE fsm_state IS (init, s1, s2, s3);
END fsm;
ARCHITECTURE behav OF fsm IS
	SIGNAL state : fsm_state := init;
	-- assign a signal/wire and give it an initial value using ":=" expression.
	-- Normally, "signal state: std_logic" but we create a new type for data and used it. These data type has only a finite number of values which are the sates. Similar to natural numbers data type.

	-- Start to define the process of how the state changes (combinationl description)
BEGIN
	new_state : PROCESS (clk, rst)
	BEGIN
		IF (rst = '0') THEN
			state <= init;
			ELSIF (clk = '1' AND clk'EVENT) THEN
			CASE state IS
					-- When state is init and inputs are 01X,11X
				WHEN init =>
					IF in1 = '0' AND in2 = '1' THEN
						state <= s1;
						ELSIF in1 = '1' AND in2 = '1' THEN
							state <= s2;
					END IF;
				WHEN s1 =>
					IF in1 = '1' THEN
						state <= init;
						ELSIF in1 = '0' AND in2 = '1' THEN
						state <= s2;
					END IF;
				WHEN s2 =>
					IF in1 = '1' AND in2 = '1' THEN
						state <= init;
						ELSIF (in1 = '0' AND in2 = '1') OR (in1 = '0' AND in2 = '0') THEN
						state <= s3;
					END IF;
				WHEN s3 =>
					IF in1 = '1' AND in2 = '1' THEN
						state <= init;
					END IF;
			END CASE;
		END IF;
	END PROCESS;
	-- Now the process of outputs 
	output_assignment : process (state)
	begin
		case state is
			when init =>
				out1 <= '0';
				out2 <= '0';
				out3 <= '0';
			when s1 =>
				out1 <= '0';
				out2 <= '0';
				out3 <= '1';
			when s2 =>
				out1 <= '0';
				out2 <= '1';
				out3 <= '1';
			when s3 =>
				out1 <= '1';
				out2 <= '0';
				out3 <= '0';
			end case;
	end process;
END behav;
