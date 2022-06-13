-------------------------------------------------------------
-- Lab 1 Part 2: An eight bit 2-to-1 multiplexer designed using
-- a when else statement
--Inputs:
--		s - One bit selector to select between inputs x and y
--		x	- eight bit data input
--		y	- eight bit data input
--Output:
--		m	- eight bit data output
------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- modifications from orignal single bit wide multiplexer done
-- by changing x and y to STD_LOGIC_VECTORS

entity two_mux is
	port( s: IN STD_LOGIC;
			x: IN STD_LOGIC_VECTOR(7 downto 0);
			y: IN STD_LOGIC_VECTOR(7 downto 0);
			m: OUT STD_LOGIC_VECTOR(7 downto 0));
end two_mux;

architecture impl of two_mux is		--Architecture was implemented using when else
begin
	m <= x when (s = '0') else		--Determine what s is and  whether x or y is assigned to m
		  y;
end impl;
