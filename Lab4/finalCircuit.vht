-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "04/10/2020 22:32:46"
                                                            
-- Vhdl Test Bench template for design  :  finalCircuit
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY finalCircuit_vhd_tst IS
END finalCircuit_vhd_tst;
ARCHITECTURE finalCircuit_arch OF finalCircuit_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL busy : STD_LOGIC;
SIGNAL clock : STD_LOGIC;
SIGNAL done : STD_LOGIC;
SIGNAL multiplicand : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL multiplier : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL product : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT finalCircuit
	PORT (
	busy : OUT STD_LOGIC;
	clock : IN STD_LOGIC;
	done : OUT STD_LOGIC;
	multiplicand : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	multiplier : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	product : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	reset : IN STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : finalCircuit
	PORT MAP (
-- list connections between master ports and signals
	busy => busy,
	clock => clock,
	done => done,
	multiplicand => multiplicand,
	multiplier => multiplier,
	product => product,
	reset => reset,
	start => start
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
multiplicand <= "10111010";
multiplier <= "10010110";
reset <= '0';
start <= '0';
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
-- Start the multiplication
clock <= '0';
start <= '1';
reset <= '1';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
start <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
clock <= '1';
wait for 10 ns;
clock <= '0';
wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END finalCircuit_arch;
