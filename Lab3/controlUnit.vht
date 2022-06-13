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
-- Generated on "03/12/2020 23:43:03"
                                                            
-- Vhdl Test Bench template for design  :  controlUnit
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY controlUnit_vhd_tst IS
END controlUnit_vhd_tst;
ARCHITECTURE controlUnit_arch OF controlUnit_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL AddSub : STD_LOGIC;
SIGNAL Ain : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL DINout : STD_LOGIC;
SIGNAL done : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL Gin : STD_LOGIC;
SIGNAL Gout : STD_LOGIC;
SIGNAL ir : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL IRin : STD_LOGIC;
SIGNAL Rin : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Rout : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT controlUnit
	PORT (
	AddSub : BUFFER STD_LOGIC;
	Ain : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	DINout : BUFFER STD_LOGIC;
	done : BUFFER STD_LOGIC;
	enable : IN STD_LOGIC;
	Gin : BUFFER STD_LOGIC;
	Gout : BUFFER STD_LOGIC;
	ir : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	IRin : BUFFER STD_LOGIC;
	Rin : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Rout : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : controlUnit
	PORT MAP (
-- list connections between master ports and signals
	AddSub => AddSub,
	Ain => Ain,
	clk => clk,
	DINout => DINout,
	done => done,
	enable => enable,
	Gin => Gin,
	Gout => Gout,
	ir => ir,
	IRin => IRin,
	Rin => Rin,
	Rout => Rout,
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
--IR <= "11000110";
--enable <= '1';
--rst <= '0';
--clk <= '0';
--wait for 20 ns;
--rst <= '1';
--wait for 20 ns;
--clk <= '1';
--wait for 20 ns;
--clk <= '0';
--wait for 20 ns;
--clk <= '1';
--wait for 20 ns;
--clk <= '0';
--wait for 20 ns;
--clk <= '1';
--wait for 20 ns;
--clk <= '0';
--wait for 20 ns;
--clk <= '1';
--wait for 20 ns;
--clk <= '0';
-- Test a mvi command
IR <= "01111111";
enable <= '1';
rst <= '0';
clk <= '0';
wait for 20 ns;
rst <= '1';
wait for 20 ns;
clk <= '1';
wait for 20 ns;
WAIT;                                                        
END PROCESS always;                                          
END controlUnit_arch;
