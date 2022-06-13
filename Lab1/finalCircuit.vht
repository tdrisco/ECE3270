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
-- Generated on "02/07/2020 20:13:19"
                                                            
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
SIGNAL clock : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX4 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SW_ff : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL SW_mux : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT finalCircuit
	PORT (
	clock : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	SW_ff : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	SW_mux : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : finalCircuit
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	HEX4 => HEX4,
	SW_ff => SW_ff,
	SW_mux => SW_mux
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
--Set the starting sequence of chatacters
--HELLO is spelt on HEX4-HEX0
SW_ff <= "000";
SW_mux <= "000";
clock <= "1000";
wait for 20 ns;
SW_ff <= "001";
clock <= "0100";
wait for 20 ns;
SW_ff <= "010";
clock <= "0010";
wait for 20 ns;
clock <= "0001";
wait for 20 ns;
SW_ff <= "000";
clock <= "1000";
wait for 20 ns;
SW_ff <= "011";
wait for 20 ns;

--Change the multiplexer selection bit to 
--cycle through all the different character patters
SW_mux <= "001";
wait for 20 ns;
SW_mux <= "010";
wait for 20 ns;
SW_mux <= "011";
wait for 20 ns;
SW_mux <= "100";
wait for 20 ns;    
--This test bench allows me to verify that the character
--pattern is correct through all the interations of the
--multiplexer selection
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END finalCircuit_arch;
