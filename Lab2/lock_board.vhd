-------------------------------------------------------------
-- Lab 2: Implementation of a lock finite state machine that
--	is designed to detect a sequence of abaa. A is represented
-- by an input of 10 and b is represented by an input of 01.
-- Between each correct input should be a 00 detected on the 
-- input.
-- This file represents the board implementation
--
--Inputs:
--		SW  - Two bit data inputs
--		SW	- Single bit input used to determine if input is valid
--		KEY	- system clock
--		SW	- Single bit active low reset into the FSM
--Output:
--		LEDR	- Single bit output to represent if lock
--					  has unlocked
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lock_board is
	port( SW: IN STD_LOGIC_VECTOR(3 downto 0); 
			KEY: IN STD_LOGIC_VECTOR(1 downto 0); 
			LEDR: OUT STD_LOGIC_VECTOR(2 downto 0)); 
end lock_board;

ARCHITECTURE struct OF lock_board IS

Component lock
	port( inputs: IN STD_LOGIC_VECTOR(1 downto 0); --will map to SW
			ivalid: IN STD_LOGIC;	--will map to SW
			clk: IN STD_LOGIC; -- will map to key
			rst: IN STD_LOGIC; -- will map to SW
			output: OUT STD_LOGIC); --will map to single led (on will mean unlocked)
end Component;

BEGIN

dut : lock		-- Port map used to assign I/O to the I/O on the FPGA
	PORT MAP (
			inputs => SW(1 downto 0),
			ivalid => SW(2),
			clk => KEY(0),
			rst => SW(3),
			output => LEDR(0)
			);
			
end struct;