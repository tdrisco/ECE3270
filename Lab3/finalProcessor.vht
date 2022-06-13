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
-- Generated on "03/13/2020 10:38:34"
                                                            
-- Vhdl Test Bench template for design  :  finalProcessor
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY finalProcessor_vhd_tst IS
END finalProcessor_vhd_tst;
ARCHITECTURE finalProcessor_arch OF finalProcessor_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clock : STD_LOGIC;
SIGNAL dataBus : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DIN : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Done : STD_LOGIC;
SIGNAL resetn : STD_LOGIC;
SIGNAL run : STD_LOGIC;
COMPONENT finalProcessor
	PORT (
	clock : IN STD_LOGIC;
	dataBus : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	DIN : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	Done : BUFFER STD_LOGIC;
	resetn : IN STD_LOGIC;
	run : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : finalProcessor
	PORT MAP (
-- list connections between master ports and signals
	clock => clock,
	dataBus => dataBus,
	DIN => DIN,
	Done => Done,
	resetn => resetn,
	run => run
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
		  ------------------------------------------------------------MVI
--clock <= '0';
--resetn <= '0';
--run <= '1';
--resetn <= '1';
--DIN <= "0000000001000111"; --mvi instruction moving into reg0
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--DIN <= "1111111100000000";
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--------------------------------------------------------------MVI
--DIN <= "0000000001001111"; --mvi instruction moving into reg1
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--DIN <= "0000000011111111";
--clock <= '0';
--wait for 20 ns;
--------------------------------------------------------------MOVE COMMAND
--clock <= '1';
--DIN <= "0000000000000111"; --mv instruction moving reg0 into reg7  
--wait for 20 ns;
--clock <= '0';
--run <= '1';
--resetn <= '1';
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
----------------------------------------------------
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--DIN <= "0000000010000001";
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
--wait for 20 ns;
--clock <= '0';
--wait for 20 ns;
--clock <= '1';
------------------------Test Bench 2.0---------------
clock <= '0';
resetn <= '0';
run <= '1';
resetn <= '1';
DIN <= "0000000001000111"; --mvi instruction moving into reg0
wait for 20 ns;
clock <= '1';
wait for 20 ns;
DIN <= "1111111100000000"; -- Data into reg0
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
DIN <= "0000000000001000"; --mv reg0 into reg1
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
DIN <= "0000000001010111"; --mv1 into reg2
wait for 20 ns;
clock <= '1';
wait for 20 ns;
DIN <= "0000000011111111"; -- data to be assigned to reg2
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
DIN <= "0000000010010001"; --add command to add reg 2 and 1
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
DIN <= "0000000011010001"; --subtract command to Reg2-Reg1
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
clock <= '0';
wait for 20 ns;
clock <= '1';
wait for 20 ns;
WAIT;                                                        
END PROCESS always;                                          
END finalProcessor_arch;
