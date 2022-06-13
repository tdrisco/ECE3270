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
-- Generated on "04/01/2020 14:52:02"
                                                            
-- Vhdl Test Bench template for design  :  ControlUnit
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ControlUnit_vhd_tst IS
END ControlUnit_vhd_tst;
ARCHITECTURE ControlUnit_arch OF ControlUnit_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL addreg : STD_LOGIC;
SIGNAL busy : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC;
SIGNAL counter : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL done : STD_LOGIC;
SIGNAL loadreg : STD_LOGIC;
SIGNAL rst : STD_LOGIC;
SIGNAL shiftreg : STD_LOGIC;
SIGNAL start : STD_LOGIC;
COMPONENT ControlUnit
	PORT (
	addreg : BUFFER STD_LOGIC;
	busy : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC;
	counter : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	done : BUFFER STD_LOGIC;
	loadreg : BUFFER STD_LOGIC;
	rst : IN STD_LOGIC;
	shiftreg : BUFFER STD_LOGIC;
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ControlUnit
	PORT MAP (
-- list connections between master ports and signals
	addreg => addreg,
	busy => busy,
	clk => clk,
	count => count,
	counter => counter,
	done => done,
	loadreg => loadreg,
	rst => rst,
	shiftreg => shiftreg,
	start => start
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
clk <= '0';
rst <= '0';
counter <= "0000";
start <= '0';
wait for 10 ns;
rst <= '1';
start <= '1';
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
start <= '0';
counter <= "1000";
wait for 10 ns;
clk <='1';
wait for 10 ns;
clk <= '0';
counter <= "1100";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
counter <= "1110";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
clk <= '0';
counter <= "1111";
wait for 10 ns;
clk <= '1';
wait for 10 ns;
WAIT;                                                        
END PROCESS always;                                          
END ControlUnit_arch;
