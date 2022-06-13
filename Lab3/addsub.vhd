-------------------------------------------------------------
-- Lab 3 Part 3: An adder/subtractor unit that is designed to
--	either add or subtract based off of a selector bit and to
-- data inputs.
--Inputs:
--		input1  - generic width defined data input
--		input2  - generic width defined data input
--		sel	- single bit selector to determine 
--					whether to add or subtract
--Output:
--		output1  - generic width defined data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


entity addsub is
generic(data_width : integer := 4);
	port( sel: IN STD_LOGIC;
			input1: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			input2: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			output1: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end addsub;

architecture impl of addsub is	
begin
-- Would this be as simple as looking at the sel and then adding (+) or (-) the inputs
--addition section of code
output1 <= STD_LOGIC_VECTOR(signed(input1) + signed(input2)) when (sel = '0') else

--subtraction section of code
STD_LOGIC_VECTOR(signed(input1) - signed(input2));

end impl;