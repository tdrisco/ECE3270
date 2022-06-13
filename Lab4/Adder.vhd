-------------------------------------------------------------
-- Lab 4 Part adder: An simple adder used to add to inputs
-- and output the sum.
--Inputs:
--		input1  - generic width defined data input
--		input2  - generic width defined data input
--Output:
--		output1  - generic width defined data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity Adder is
generic(data_width : integer := 8);
	port( input1: IN STD_LOGIC_VECTOR((data_width) downto 0);
			input2: IN STD_LOGIC_VECTOR((data_width) downto 0);
			output1: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Adder;

architecture behavioral of Adder is	
begin

output1 <= STD_LOGIC_VECTOR(signed(input1) + signed(input2)); -- Sign extension will be handled by RegC

end behavioral;