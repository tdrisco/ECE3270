-------------------------------------------------------------
-- Lab 2: Implementation of a lock finite state machine that
--	is designed to detect a sequence of abaa. A is represented
-- by an input of 10 and b is represented by an input of 01.
-- Between each correct input should be a 00 detected on the 
-- input.
-- This file represents the openCL implementation
--
--Inputs:
--		datain  - Two bit data inputs
--		ivalid	- Single bit input used to determine if input is valid
--		clock	- system clock
--		resetn	- Single bit active low reset into the FSM
--Output:
--		dataout	- Single bit output to represent if lock
--					  has unlocked

-- All the other inputs/outputs are not needed for this
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY lock_cl is
	PORT(clock, resetn, ivalid, iready: IN std_logic;
		  datain: IN std_logic_vector(7 downto 0);
		  oready, ovalid: OUT std_logic;
		  dataout: OUT std_logic_vector(7 downto 0));
END lock_cl;

ARCHITECTURE structure of lock_cl is
	--Declare the component, then port map it!
	
	Component lock
	port( inputs: IN STD_LOGIC_VECTOR(1 downto 0); --will map to datain
			ivalid: IN STD_LOGIC;	--will map to ivalid
			clk: IN STD_LOGIC; -- will map to clock
			rst: IN STD_LOGIC; -- will map to resetn
			output: OUT STD_LOGIC); --will map to dataout
end Component;

	BEGIN
	
	dut : lock     --map to openCl
	PORT MAP (
			inputs => datain(1 downto 0),
			ivalid => ivalid,
			output => dataout(0),
			clk => clock,
			rst => resetn
			);


END structure;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
