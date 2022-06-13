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
-- Generated on "03/29/2020 17:52:58"
                                                            
-- Vhdl Test Bench template for design  :  RegA
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegA_vhd_tst IS
END RegA_vhd_tst;
ARCHITECTURE RegA_arch OF RegA_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL enableBit : STD_LOGIC;
SIGNAL multiplicand : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL recode_1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL recode_2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL recode_Neg1 : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL recode_Neg2 : STD_LOGIC_VECTOR(8 DOWNTO 0);
COMPONENT RegA
	PORT (
	clk : IN STD_LOGIC;
	enableBit : IN STD_LOGIC;
	multiplicand : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	recode_1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	recode_2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	recode_Neg1 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	recode_Neg2 : OUT STD_LOGIC_VECTOR(8 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegA
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	enableBit => enableBit,
	multiplicand => multiplicand,
	recode_1 => recode_1,
	recode_2 => recode_2,
	recode_Neg1 => recode_Neg1,
	recode_Neg2 => recode_Neg2
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
multiplicand <= "00101011";
enableBit <= '1';
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END RegA_arch;
