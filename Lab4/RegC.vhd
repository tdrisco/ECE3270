-------------------------------------------------------------
-- Lab 4 Part RegC: DFF used to store the sum of the additions,
-- shift the final product into the B register, and store 
-- the upper half of the product.
--Inputs:
--		clk - system clock
--		enableBit1  - 1 bit enable to indicate loading value from adder
--		enableBit2  - Serves the same purpose as enableBit1
--		shiftEnable - 1 bit enable to indicate shifting
--		d	- generic width defined data input
--Output:
--		q - generic width defined data output 
--		shiftOut - two least significant bits being shifted 
--					out of the register.
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity RegC is
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit1: in std_logic;
			enableBit2: in std_logic;
			shiftEnable: in std_logic;
			shiftOut: OUT STD_LOGIC_VECTOR(1 downto 0);
			d: IN STD_LOGIC_VECTOR(data_width downto 0);
			q: OUT STD_LOGIC_VECTOR(data_width downto 0));
end RegC;

architecture behavioral of RegC is

signal d_signal: STD_LOGIC_VECTOR(data_width downto 0);

begin
	process(clk) 				--Wait for system clock rising edge then assign input to output
	begin
		if(rising_edge(clk) and ((enableBit1 = '1') or (enableBit2 = '1'))) then
			d_signal <= d;
		elsif(rising_edge(clk) and (shiftEnable = '1')) then
			shiftOut <= d_signal(1 downto 0);
			d_signal <= d_signal(data_width) & d_signal(data_width) & d_signal(data_width downto 2);
		end if;
	end process;
	q <= d_signal;
end behavioral;
