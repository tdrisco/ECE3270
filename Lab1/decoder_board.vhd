-------------------------------------------------------------
-- Lab 1 Part 4: A decoder that excepts a three bit input
-- and outputs a 7 bit vector to be used on 7-segment.
-- This represents the board implementation
--Inputs:
--		SW  - Switches 2-0 were used to represent the three 
--				bit data input
--Output:
--		HEX0	- HEX0 (7-segment display) on FPGA was used to
--				  to represent the 7 bit output data
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder_board IS
port(SW: IN STD_LOGIC_VECTOR(2 downto 0);
	HEX0: OUT STD_LOGIC_VECTOR(6 downto 0));
end decoder_board;

ARCHITECTURE struct OF decoder_board IS

Component decoder
	port( inBits: IN STD_LOGIC_VECTOR(2 downto 0);
			outBits: OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

BEGIN

dut : decoder		--Port Mapping of the decoder pins to FPGA I/O
	PORT MAP (
			inBits => SW,
			outbits => HEX0
			);
			
end struct;