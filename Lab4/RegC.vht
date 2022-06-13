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
-- Generated on "04/01/2020 01:32:54"
                                                            
-- Vhdl Test Bench template for design  :  RegC
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegC_vhd_tst IS
END RegC_vhd_tst;
ARCHITECTURE RegC_arch OF RegC_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL d : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL enableBit1 : STD_LOGIC;
SIGNAL enableBit2 : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL shiftEnable : STD_LOGIC;
SIGNAL shiftOut : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT RegC
	PORT (
	clk : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	enableBit1 : IN STD_LOGIC;
	enableBit2 : IN STD_LOGIC;
	q : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	shiftEnable : IN STD_LOGIC;
	shiftOut : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegC
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	d => d,
	enableBit1 => enableBit1,
	enableBit2 => enableBit2,
	q => q,
	shiftEnable => shiftEnable,
	shiftOut => shiftOut
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
enableBit1 <= '1';
d <= "110011100";
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
enableBit1 <= '0';
shiftEnable <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
shiftEnable <= '0';
enableBit2 <= '1';
d <= "000011111";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
enableBit2 <= '0';
shiftEnable <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END RegC_arch;
