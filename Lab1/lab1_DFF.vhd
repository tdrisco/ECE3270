-------------------------------------------------------------
-- Lab 1 Part 1 Generate a d flip-flop that latches the input 
-- value on the rising or falling edge of the clock pulse
--Inputs:
--		clk - system clock
--		d	- three bit data input
--Output:
--		q	- three bit data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lab1_DFF is
	port( clk: in std_logic;
			d: IN STD_LOGIC_VECTOR(2 downto 0);
			q: OUT STD_LOGIC_VECTOR(2 downto 0));
end lab1_DFF;

architecture impl of lab1_DFF is

begin
	process(clk) begin				--Wait for system clock rising edge then assign input to output
		if(rising_edge(clk)) then
			q <= d;
		end if;
	end process;
end impl;



