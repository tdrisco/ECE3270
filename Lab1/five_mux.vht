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
-- Generated on "02/05/2020 20:46:54"
                                                            
-- Vhdl Test Bench template for design  :  five_mux
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY five_mux_vhd_tst IS
END five_mux_vhd_tst;
ARCHITECTURE five_mux_arch OF five_mux_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL m : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL s : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL u : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL v : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL w : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL x : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL y : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT five_mux
	PORT (
	m : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	s : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	u : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	v : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	w : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	x : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	y : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : five_mux
	PORT MAP (
-- list connections between master ports and signals
	m => m,
	s => s,
	u => u,
	v => v,
	w => w,
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
u <= "000";		--Intialize values for all the inputs
v <= "001";
w <= "010";
x <= "011";
y <= "100";

s <= "000";  		--Test each input by selecting it then changing value
wait for 20 ns;	--Output should update when selcted input updates
u <= "111";			--Test for every input u,v,w,x,y
wait for 20 ns;
s <= "001";  
wait for 20 ns;
v <= "111";
wait for 20 ns;
s <= "010";  
wait for 20 ns;
w <= "111";
wait for 20 ns;
s <= "011";  
wait for 20 ns;
x <= "111"; 
wait for 20 ns;
s <= "100";  
wait for 20 ns;
y <= "111";
wait for 20 ns;                                                            
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END five_mux_arch;
