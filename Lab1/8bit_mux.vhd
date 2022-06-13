LIBRARY ieee;
USE ieee.std_logic_1164.all

entity two_mux is
	generic( n: integer := 1);
	port( clk: in std_logic;
			d: IN STD_LOGIC;
			q: OUT STD_LOGIC;);
end two_mux;