-------------------------------------------------------------
-- Lab 1 Part 4: A decoder that excepts a three bit input
-- and outputs a 7 bit vector to be used on 7-segment
--Inputs:
--		inBits  - three bit code input
--Output:
--		Outbits	- seven bit data output
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity decoder is
	port( inBits: IN STD_LOGIC_VECTOR(2 downto 0);
			outBits: OUT STD_LOGIC_VECTOR(6 downto 0));
end decoder;


architecture impl of decoder is		--Implement case statement to compare inbits and assign outbits
begin
	decoder: process(inBits) begin
		case inBits is
			when "000" => outBits <= "0001001";		--Each code has specific corresponding output
			when "001" => outBits <= "0000110";		--Outputs represent (H,E,L,O)
			when "010" => outBits <= "1000111";
			when "011" => outBits <= "1000000"; 
			when others => outbits <= "1111111"; 	--Anything else represents blank 7-segment
		end case;
	end process decoder;
end impl;