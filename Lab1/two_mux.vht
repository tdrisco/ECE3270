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
-- Generated on "02/04/2020 14:45:26"
                                                            
-- Vhdl Test Bench template for design  :  two_mux
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY two_mux_vhd_tst IS
END two_mux_vhd_tst;
ARCHITECTURE two_mux_arch OF two_mux_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL m : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s : STD_LOGIC;
SIGNAL x : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL y : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT two_mux
	PORT (
	m : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	s : IN STD_LOGIC;
	x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	y : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : two_mux
	PORT MAP (
-- list connections between master ports and signals
	m => m,
	s => s,
	x => x,
	y => y
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

y <= "00000000";  --Intialize y,x, and s 
x <= "11111111";
s <= '0';  
wait for 20 ns;
x <= "10101010";	--Change x to prove that m will automatically update
wait for 20 ns;
s <= '1';			--Change s to prove that y will be selected
wait for 20 ns;
y <= "01010101";	--Change y tp prove again that m will automatically update
wait for 20 ns;
                                                      
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END two_mux_arch;
