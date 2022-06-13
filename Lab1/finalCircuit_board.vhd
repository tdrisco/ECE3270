---------------------------------------------------------------------
-- Lab 1 Part 5: A final circuit design that implements
--	all the components from the previous part to create
-- a circuit that displays an output of letters composed
-- of (H,E,L,O,Blank).
-- This is the board implementation of the finalCircuit
--Inputs:
--		KEY  - KEYs on the FPGA are used to immitate a clock pulse
--		SW(2 downto 0) - Switches on the FPGA used to represnet the 
--								the three bit data input
--		SW(9 downto 7) - Switches on the FPGA used to represnet the 
--								the three bit selector for the multiplexer
--Output:
--		HEX0	- seven bit output data designed for 7-segment display(0)
--		HEX1	- seven bit output data designed for 7-segment display(1)
--		HEX2	- seven bit output data designed for 7-segment display(2)
--		HEX3	- seven bit output data designed for 7-segment display(3)
--		HEX4	- seven bit output data designed for 7-segment display(4)
---------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY finalCircuit_board IS
	port( KEY: IN STD_LOGIC_VECTOR(3 downto 0);
			--SW: IN STD_LOGIC_VECTOR(2 downto 0);
			SW: IN STD_LOGIC_VECTOR(9 downto 0);
			HEX0: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX1: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX2: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 downto 0));
end finalCircuit_board;

ARCHITECTURE struct OF finalCircuit_board IS

Component finalCircuit
	port( clock: IN STD_LOGIC_VECTOR(3 downto 0);
			SW_ff: IN STD_LOGIC_VECTOR(2 downto 0);
			SW_mux: IN STD_LOGIC_VECTOR(2 downto 0);
			HEX0: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX1: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX2: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

BEGIN

--Port mapping of the finalCircuit where all the I/O
--is mapped to specific I/O on the FPGA chip
dut : finalCircuit
	PORT MAP (
			clock => KEY,
			SW_ff => sw(2 downto 0),
			SW_mux => sw(9 downto 7),
			HEX0 => HEX0,
			HEX1 => HEX1,
			HEX2 => HEX2,
			HEX3 => HEX3,
			HEX4 => HEX4
			);
			
end struct;