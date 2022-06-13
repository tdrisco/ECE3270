-------------------------------------------------------------
-- Lab 4 Part RegB: DFF used to store the multiplier, shift
-- out the bit-pairs, and store the lower half of the product
--Inputs:
--		clk - system clock
--		enableBit  - 1 bit enable to indicate intialization
--		shiftEnable - 1 bit enable to indicate shifting
--		d	- generic width defined data input
--		shiftIn - string of two bits being shifted into two
--					most significant bit positions
--Output:
--		q - generic width defined data output 
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity RegB is
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			shiftEnable: in std_logic;
			shiftIn: IN STD_LOGIC_VECTOR(1 downto 0);
			d: IN STD_LOGIC_VECTOR(data_width-1 downto 0);
			q: OUT STD_LOGIC_VECTOR(data_width downto 0);
			muxSelect: OUT STD_LOGIC_VECTOR(2 downto 0));
end RegB;

architecture behavioral of RegB is

signal dummyBit: STD_LOGIC;
signal d_signal: STD_LOGIC_VECTOR(data_width-1 downto 0);
signal recode_signal: STD_LOGIC_VECTOR(data_width +1 downto 0);

begin
	process(clk) 				--Wait for system clock rising edge then assign input to output
	begin
		if(rising_edge(clk) and (enableBit = '1')) then
			dummyBit <= '0';
			d_signal <= d;
			recode_signal <= d(data_width-1) & d & '0';
		elsif(rising_edge(clk) and (shiftEnable = '1')) then
			dummyBit <= d_signal(1);
			d_signal(data_width - 3 downto 0) <= d_signal(data_width -1 downto 2);
			d_signal(data_width - 1 downto data_width - 2) <= shiftIn;
			
			recode_signal(data_width - 1 downto 0) <= recode_signal(data_width +1 downto 2);
			recode_signal(data_width + 1 downto data_width) <= shiftIn;
		end if;
	end process;
	q <= d_signal & dummyBit;
	muxSelect <= recode_signal(2 downto 0);
end behavioral;
