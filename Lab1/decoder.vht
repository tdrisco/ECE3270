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
-- Generated on "02/07/2020 20:11:05"
                                                            
-- Vhdl Test Bench template for design  :  decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY decoder_vhd_tst IS
END decoder_vhd_tst;
ARCHITECTURE decoder_arch OF decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL inBits : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL outBits : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT decoder
	PORT (
	inBits : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	outBits : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : decoder
	PORT MAP (
-- list connections between master ports and signals
	inBits => inBits,
	outBits => outBits
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN  

inBits <= "000";	--Test each of the assigned codes
wait for 20 ns;
inBits <= "001";
wait for 20 ns;
inBits <= "010";
wait for 20 ns;
inBits <= "011";
wait for 20 ns;
inBits <= "111";	--Test the other peice of the case statement
wait for 20 ns;                                                      
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations 

                                     
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END decoder_arch;
