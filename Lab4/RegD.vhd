-------------------------------------------------------------
-- Lab 4 Part RegD: DFF used to count number of shifts
--Inputs:
--		clk - system clock
--		enableBit  - 1 bit enable to indicate intialization
--		countEnable	- 1 bit enable to indicate shift
--Output:
--		q - generic width defined data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity RegD is
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			countEnable: in std_logic;
			--d: IN STD_LOGIC_VECTOR(((data_width/2)-1) downto 0);
			q: OUT STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0));
end RegD;

architecture behavioral of RegD is

signal d_signal: STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0);

begin
	process(clk) 				--Wait for system clock rising edge then assign input to output
	begin
		if(rising_edge(clk) and (enableBit = '1')) then
			d_signal <= (others => '0');
			--q <= d_signal;
		elsif(rising_edge(clk) and (countEnable = '1')) then
			d_signal((((data_width+1)/2)-1) downto 0) <= '1' & d_signal((((data_width+1)/2)-1) downto 1);
			--q <= d_signal;
		end if;
	end process;
	q <= d_signal;
end behavioral;
