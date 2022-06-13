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
-- Generated on "02/25/2020 15:02:50"
                                                            
-- Vhdl Test Bench template for design  :  lock
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lock_vhd_tst IS
END lock_vhd_tst;
ARCHITECTURE lock_arch OF lock_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL inputs : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ivalid : STD_LOGIC;
SIGNAL output : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
COMPONENT lock
	PORT (
	clk : IN STD_LOGIC;
	inputs : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ivalid : IN STD_LOGIC;
	output : OUT STD_LOGIC;
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lock
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	inputs => inputs,
	ivalid => ivalid,
	output => output,
	rst => rst
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

-- Test bench sequence that will emulate a0b0a0a to unlock on first try
-- This test will have not repeating states	
rst <= '0';
clk <= '0';
inputs <= "00";
ivalid <= '1';
wait for 20 ns;
rst <= '1';
ivalid <= '0';  --Test Ivalid
inputs <= "10";
clk <= '1';
wait for 20 ns;
clk <= '0';
ivalid <= '1';
inputs <= "10";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "01";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "10";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "10";
wait for 20 ns;
clk <= '1'; --output should go high
wait for 20 ns;
clk <= '0';
inputs <= "00"; -- output should stay high
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "11"; --output should go low
wait for 20 ns;
clk <= '1';
wait for 20 ns; --lock is relocked

ivalid <= '1';
rst <= '0';
clk <= '0';
wait for 20 ns;
rst <= '1';
inputs <= "10";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "01";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "10";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "01"; --Show example of returing to state where one a and one b has been detected
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "10";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "00";
wait for 20 ns;
clk <= '1';
wait for 20 ns;
clk <= '0';
inputs <= "10";
wait for 20 ns;
clk <= '1'; --output should go high
wait for 20 ns;
clk <= '0';
inputs <= "11"; -- output should go low (first rise)
wait for 20 ns;
clk <= '1';
wait for 20 ns;
		 
WAIT;                                                        
END PROCESS always;                                          
END lock_arch;
