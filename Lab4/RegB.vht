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
-- Generated on "03/31/2020 23:55:27"
                                                            
-- Vhdl Test Bench template for design  :  RegB
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegB_vhd_tst IS
END RegB_vhd_tst;
ARCHITECTURE RegB_arch OF RegB_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL shiftEnable : STD_LOGIC;
SIGNAL d : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL enableBit : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL shiftIn : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT RegB
	PORT (
	clk : IN STD_LOGIC;
	shiftEnable : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	enableBit : IN STD_LOGIC;
	q : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	shiftIn : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegB
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	shiftEnable => shiftEnable,
	d => d,
	enableBit => enableBit,
	q => q,
	shiftIn => shiftIn
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
enableBit <= '1';
d <= "10011100";
clk <= '0';
shiftIn <= "00";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
enableBit <= '0';
shiftEnable <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
shiftIn <= "11";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END RegB_arch;
