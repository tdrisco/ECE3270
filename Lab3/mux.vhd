-------------------------------------------------------------
-- Lab 3 Part 3: A three bit 10-to-1 multiplexer designed using
-- a when else statement. This is an extension of the 
-- 10-to-1 multiplexer
--Inputs:
--		sel  - 10 bit selector to select between all inputs using
--					a method of one 
--		p  - generic width defined data input
--		q  - generic width defined data input
--		r  - generic width defined data input
--		s  - generic width defined data input
--		t  - generic width defined data input
--		u	- generic width defined data input
--		v	- generic width defined data input
--		w	- generic width defined data input
--		x	- generic width defined data input
--		y	- generic width defined data input
--Output:
--		m	- generic width defined data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- modifications will be easy just add to the port setup and adjust the when else statement
-- 10 bit selector that is one hot for the 10 inputs

entity mux is
generic(data_width : integer := 16);
	port( sel: IN STD_LOGIC_VECTOR(9 downto 0);
			p: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --R0-R7
			q: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			r: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			s: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			t: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			u: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			v: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			w: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			x: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --G
			y: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --Din (default)
			m: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end mux;

architecture impl of mux is		-- Architecture of 10-to-1 multiplexer using when else
begin
	m <= p when (sel = "0000000001") else				-- S is 10 bit selector that has 1 hot representation
		  q when (sel = "0000000010") else
		  r when (sel = "0000000100") else
		  s when (sel = "0000001000") else
		  t when (sel = "0000010000") else
		  u when (sel = "0000100000") else				-- S is 10 bit selector that has 1 hot representation
		  v when (sel = "0001000000") else
		  w when (sel = "0010000000") else
		  x when (sel = "0100000000") else
		  y;
end impl;