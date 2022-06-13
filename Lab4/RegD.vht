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
-- Generated on "03/31/2020 17:04:22"
                                                            
-- Vhdl Test Bench template for design  :  RegD
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegD_vhd_tst IS
END RegD_vhd_tst;
ARCHITECTURE RegD_arch OF RegD_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL countEnable : STD_LOGIC;
SIGNAL enableBit : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT RegD
	PORT (
	clk : IN STD_LOGIC;
	countEnable : IN STD_LOGIC;
	enableBit : IN STD_LOGIC;
	q : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegD
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	countEnable => countEnable,
	enableBit => enableBit,
	q => q
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
clk <= '0';
--d <= "1111";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
enableBit <= '0';
clk <= '0';
countEnable <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;

-- add another count cycle
enableBit <= '1';
countEnable <= '0';
clk <= '0';
--d <= "1111";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
enableBit <= '0';
clk <= '0';
countEnable <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
-- show that nothing changes after 4 cycles occurs
clk <= '0';
wait for 10 ns;
clk <= '1';
wait for 10 ns;

WAIT;                                                        
END PROCESS always;                                          
END RegD_arch;
