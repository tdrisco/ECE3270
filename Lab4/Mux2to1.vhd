-------------------------------------------------------------
-- Lab 4 Part 2-to-1 Mux: A 9 bit 2-to-1 mux that is used to
-- select if 0's or the sum from the addition is loaded into
-- RegC.
--Inputs:
--		sel  - 1 bit selector
--		y	- generic width defined data input
--Output:
--		m	- generic width defined data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Mux2to1 is
generic(data_width : integer := 8);
	port( sel: IN STD_LOGIC;
			y: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent sum from adder
			m: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Mux2to1;

architecture behavioral of Mux2to1 is
constant all_zeros : STD_LOGIC_VECTOR(data_width downto 0) := (others => '0');
begin
	m <= y when (sel = '1') else
		  all_zeros;
end behavioral;
