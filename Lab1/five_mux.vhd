-------------------------------------------------------------
-- Lab 1 Part 3: A three bit 5-to-1 multiplexer designed using
-- a when else statement. This is an extension of the 
-- 2-to-1 multiplexer
--Inputs:
--		s  - three bit selector to select between inputs x and y
--		u	- three bit data input
--		v	- three bit data input
--		w	- three bit data input
--		x	- three bit data input
--		y	- three bit data input
--Output:
--		m	- three bit data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- modifications will be easy just add to the port setup and adjust the when else statement

entity five_mux is
	port( s: IN STD_LOGIC_VECTOR(2 downto 0);
			u: IN STD_LOGIC_VECTOR(2 downto 0);
			v: IN STD_LOGIC_VECTOR(2 downto 0);
			w: IN STD_LOGIC_VECTOR(2 downto 0);
			x: IN STD_LOGIC_VECTOR(2 downto 0);
			y: IN STD_LOGIC_VECTOR(2 downto 0);
			m: OUT STD_LOGIC_VECTOR(2 downto 0));
end five_mux;

architecture impl_five of five_mux is		-- Architecture of 5-to-1 multiplexer using when else
begin
	m <= u when (s = "000") else				-- S needs to be three bits to be able to select all five inputs
		  v when (s = "001") else
		  w when (s = "010") else
		  x when (s = "011") else
		  Y;
end impl_five;