-------------------------------------------------------------
-- Lab 3 Part 1 Generate a d flip-flop that latches the input 
-- value on the rising or falling edge of the clock pulse
--Inputs:
--		clk - system clock
--		d	- three bit data input
--Output:
--		q	- three bit data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

--make the flipflop generic so width can be adjusted

entity simpleRegister is
Generic(data_width : integer := 16);
	port( clk: in std_logic;
			enableBit: in std_logic;
			d: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			q: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end simpleRegister;

architecture impl of simpleRegister is

begin
	process(clk) begin				--Wait for system clock rising edge then assign input to output
		if(rising_edge(clk) and (enableBit = '1')) then
			q <= d;
		end if;
	end process;
end impl;



