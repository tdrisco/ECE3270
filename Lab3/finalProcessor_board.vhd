-------------------------------------------------------------
-- Lab 3 Part 6: Final processor implementation on FPGA
--Inputs:
--		SW[7 downto 0]  - variable data input
--		SW[8]  - single bit input that must be high in order to
--				 for the state machine to be able to leave state one
--		SW[9]  - single bit active low reset
--		KEY - system clock
--Output:
--		dataBus - Variable data output
--    Done - Single bit data output indicating finished sequence
------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;



ENTITY finalProcessor_board IS
generic(data_Width : integer := 8);
	port( KEY: IN STD_LOGIC_VECTOR(1 downto 0);
			SW: IN STD_LOGIC_VECTOR(9 downto 0);
			LEDR: OUT STD_LOGIC_VECTOR(9 downto 0));
end finalProcessor_board;

ARCHITECTURE struct OF finalProcessor_board IS

Component finalProcessor is
generic(dataWidth : integer);
	port( clock: IN STD_LOGIC;
			resetn: IN STD_LOGIC;
			run: IN STD_LOGIC;
			DIN: IN STD_LOGIC_VECTOR(dataWidth -1 downto 0);
			dataBus: OUT STD_LOGIC_VECTOR(dataWidth -1 downto 0);
			Done: OUT STD_LOGIC);
end component;

BEGIN

--Port mapping of the finalCircuit where all the I/O
--is mapped to specific I/O on the FPGA chip
dut : finalProcessor
generic map (dataWidth => data_Width)
	PORT MAP (
			clock => KEY(0),
			resetn => sw(9),
			run => sw(8),
			DIN => SW(7 downto 0),
			Done => ledr(9),
			dataBus => ledr(7 downto 0)
			);
			
end struct;