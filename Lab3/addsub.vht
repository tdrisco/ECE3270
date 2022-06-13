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
-- Generated on "03/07/2020 22:00:45"
                                                            
-- Vhdl Test Bench template for design  :  addsub
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY addsub_vhd_tst IS
END addsub_vhd_tst;
ARCHITECTURE addsub_arch OF addsub_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL input1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL input2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL output1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sel : STD_LOGIC;
COMPONENT addsub
	PORT (
	input1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	input2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	output1 : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	sel : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : addsub
	PORT MAP (
-- list connections between master ports and signals
	input1 => input1,
	input2 => input2,
	output1 => output1,
	sel => sel
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
sel <= '0';
input1 <= "1010";
input2 <= "0101";
wait for 20 ns;
input1 <= "1110";
input2 <= "0111";
wait for 20 ns;
sel <= '1';
input1 <= "1010";
input2 <= "0101";
wait for 20 ns;
input2 <= "1010";
input1 <= "0101";
wait for 20 ns;
WAIT;                                                        
END PROCESS always;                                          
END addsub_arch;
