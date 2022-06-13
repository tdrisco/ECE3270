-------------------------------------------------------------
-- Lab 4 Part 5-to-1 Mux: A 9 bit 5-to-1 mux that is used to
-- select which recoded version of the multiplicand is used.
--Inputs:
--		sel  - 3 bit selector
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

entity Mux5to1 is
generic(data_width : integer := 8);
	port( sel: IN STD_LOGIC_VECTOR(2 downto 0);
			v: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent 2
			w: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent -2
			x: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent 1
			y: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent -1
			m: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Mux5to1;

architecture behavioral of Mux5to1 is
constant all_zeros : STD_LOGIC_VECTOR(data_width downto 0) := (others => '0');
begin
	m <= v when (sel = "011") else
		  w when (sel = "100") else
		  x when (sel = "001" or sel = "010") else
		  y when (sel = "101" or sel = "110") else
		  all_zeros;
end behavioral;
