-------------------------------------------------------------
-- Lab 4 Part RegA: DFF used to store and recode multiplicand
--Inputs:
--		clk - system clock
--		enableBit  - 1 bit enable
--		multiplicand	- generic width defined data input
--Output:
--		recode_1 - multiplicand multiplied by 1
--		recode_Neg1 -  multiplicand multiplied by -1
--		recode_2 - multiplicand multiplied by 2
--		recode_Neg2 - multiplicand multiplied by -2
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity RegA is
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			multiplicand: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			recode_1: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_Neg1: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_2: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_Neg2: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end RegA;

architecture behavioral of RegA is

--signal extended_multiplicand: STD_LOGIC_VECTOR((data_width) downto 0);
signal twoComp_multiplicand: STD_LOGIC_VECTOR((data_width-1) downto 0);

begin
	--extended_multiplicand  <= multiplicand(data_width -1) & multiplicand;
	twoComp_multiplicand <= std_logic_vector(signed(not multiplicand )+1);
	process(clk) begin				--Wait for system clock rising edge then assign input to output
		if(rising_edge(clk) and (enableBit = '1')) then
		
			recode_1 <= multiplicand(data_width -1) & multiplicand;   --sign extends 
			
			recode_Neg1 <= twoComp_multiplicand(data_width -1) & twoComp_multiplicand; --sign extends 
			
			recode_2 <= multiplicand & '0'; --shifts by adding 0
			
			recode_Neg2 <= twoComp_multiplicand & '0'; -- shifts by adding 0
		end if;
	end process;
end behavioral;