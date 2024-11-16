-- Project: Mealy FSM with four states. Out depends on the current state and the input value.
-- Date: Sat 16 NOV, 2024
-- By: Mohamed Elmekawy


library ieee;
use ieee.std_logic_1164.all;

entity fsm is
port (
x, y: in bit;
clk, rst: in bit;
r, g, b: out bit
);
-- define states
type fsm_state is (init, red, green, yellow);

end fsm; 


architecture behav of fsm is
-- components
-- signals
signal state: fsm_state := init;
begin
next_state : process (clk, rst)
begin
if (rst = '0') then
	state <= init;
elsif (clk = '1' and clk'event) then
	case state is
	when init =>
		if y = '1' then
			state <= red;
		end if;
	when red =>
		if  x = '1' then	
			state <= init;
		elsif x = '0' and y = '1' then
			state <= yellow;
		end if;
	when yellow =>
		if x = '0' and y = '1' then
			state <= gree;
		elsif x = '1' and y = '1' then
			state <= red;
		end if;
	when green =>
		if x = '0' and y = '1' then
			state <= red;
		elsif x = '1' and y = '0' then
			state <= init;
		end if;
end case;
end if;
end process ;

out : process (state, x, y)
begin
case state is
	when init =>
		if y = '1' then
			r <= '1'; g <= '0'; b <= '0';
		else
			r <= '0'; g <= '0'; b <= '1';
		end if;
	when red =>
		if x = '1' then
			r <= '0'; g <= '0'; b <= '1';
		elsif x = '0' and y = '1' then
			r <= '1'; g <= '0'; b <= '0';
		else
			r <= '1'; g <= '0'; b <= '0';
		end if;
	when green =>
		if x = '0' and y = '1' then
			r <= '1'; g <= '0'; b <= '0';
		elsif x = '1' and y = '0' then
			r <= '0'; g <= '0'; b <= '1';
		else
			r <= '0'; g <= '1'; b <= '0';
		end if;
	when yellow =>
		if x= '0' and y = '1' then
			r <= '0'; g <= '1'; b <= '0';
		elsif x= '1' and y = '1' then
			r <= '1'; g <= '0'; b <= '0';
		else
			r <= '1'; g <= '1'; b <= '0';
		end if;
end case;
end process;
end behav;
