LIBRARY ieee;
USE ieee.std_logic_1164.all

ENTITY lab1_DFF_board IS
port(SW: IN STD_LOGIC_VECTOR(9 downto 0);
	LEDR: OUT STD_LOGIC_VECTOR(9 downto 0));
end DFF_board

Component DFF
PORT (
		clk : IN STD_LOGIC;
		d	: IN 