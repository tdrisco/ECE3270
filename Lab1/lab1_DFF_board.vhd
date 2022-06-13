-------------------------------------------------------------
-- Lab 1 Part 1 Generate a d flip-flop that latches the input 
-- value on the rising or falling edge of the clock pulse
-- This file represents the board implementation
--Inputs:
--		KEY - KEY on FPGA used as condition to latch the flip-flop
--		SW	- Switches on the board that used to represent 3 bit input
--Output:
--		LEDR	- three bit data output represented by three LEDs on board
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY lab1_DFF_board IS
port(KEY: IN STD_LOGIC_VECTOR(2 downto 0);
	SW: IN STD_LOGIC_VECTOR(2 downto 0);
	LEDR: OUT STD_LOGIC_VECTOR(2 downto 0));
end lab1_DFF_board;

ARCHITECTURE struct OF lab1_DFF_board IS

Component lab1_DFF
PORT (
		clk: in STD_LOGIC;
		d: IN STD_LOGIC_VECTOR;
		q: OUT STD_LOGIC_VECTOR
		);
END COMPONENT;

BEGIN

dut : lab1_DFF		-- Port map used to assign I/O to the I/O on the FPGA
	PORT MAP (
			clk => key(0),
			d => SW,
			q => LEDR
			);
			
end struct;
			