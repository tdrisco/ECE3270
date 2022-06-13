-------------------------------------------------------------
-- Lab 3 Part 4: A control unit that represents a meely state 
-- machine. Where the states are represented by the time steps.
--Inputs:
--		IR  - Hold the 8 bit instruction command
--		enable  - single bit input that must be high in order to
--				 for the state machine to be able to leave state one
--		rst  - single bit active low reset
--		clk - system clock
--Output:
--		R0out-R7out	- Output used to determine which registers
--							are being used (mux select)
--		Gout - G multiplexer select
--		DINout - DIN multiplexer select
--		R0in-R7in	- Output used to set the  value of registers
--		Ain - 
--		AddSub - selector bit used to determine whether add or subtract
--		Gin - 
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controlUnit is
--generic(data_width : integer := 4);
	port( enable: IN STD_LOGIC;
			rst: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			ir: IN STD_LOGIC_VECTOR(7 downto 0);
			done: OUT STD_LOGIC;
			Rout,Rin: OUT STD_LOGIC_VECTOR(7 downto 0);
			Gout,DINout : OUT STD_LOGIC;
			Gin,AddSub,Ain,IRin : OUT STD_LOGIC);
end controlUnit;


architecture impl of controlUnit is	
	TYPE fsm_state is (T0,T1,T2,T3);
	signal current_state: fsm_state;
	
	signal Xindex, Yindex: std_logic_vector(7 downto 0);
	
begin

Xindex <= "00000001" when (IR(5 downto 3) = "000") else
			 "00000010" when (IR(5 downto 3) = "001") else
			 "00000100" when (IR(5 downto 3) = "010") else
			 "00001000" when (IR(5 downto 3) = "011") else
			 "00010000" when (IR(5 downto 3) = "100") else
			 "00100000" when (IR(5 downto 3) = "101") else
			 "01000000" when (IR(5 downto 3) = "110") else
			 "10000000";
			 
Yindex <= "00000001" when (IR(2 downto 0) = "000") else
			 "00000010" when (IR(2 downto 0) = "001") else
			 "00000100" when (IR(2 downto 0) = "010") else
			 "00001000" when (IR(2 downto 0) = "011") else
			 "00010000" when (IR(2 downto 0) = "100") else
			 "00100000" when (IR(2 downto 0) = "101") else
			 "01000000" when (IR(2 downto 0) = "110") else
			 "10000000";
				 
process(clk,rst) begin

if(rst = '0') then current_state <= T0;

--elsif(((current_state = T0 and enable = '1') or current_state /= T0) and rising_edge(clk))
elsif(rising_edge(clk)) then

	case current_state is
		when T0 =>
			if(enable = '1') then current_state  <= T1; end if;
		when T1 =>
			if (IR(7 downto 6) = "00" or IR(7 downto 6) = "01") then current_state <= T0;
			else current_state <= T2; end if;
		when T2 =>
			if (IR(7 downto 6) = "00" or IR(7 downto 6) = "01") then current_state <= T0;
			else current_state <= T3; end if;
		when T3 =>
			current_state <= T0;
			end case;
	end if;
end process;
---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
process(current_state,IR, Yindex, Xindex) begin
	
case current_state is
		when T0 =>
				Rout <= "00000000";
				Rin <= "00000000";
				done <= '0';
				Gout <= '0';
				DINout <= '0';
				Gin <= '0';
				AddSub <= '0';
				Ain <= '0';
				IRin <= '1';	
		when T1 =>
			Gout <= '0';
			Gin <= '0';
			AddSub <= '0';
			IRin <= '0';
			if (IR(7 downto 6) = "00") then
				Rout <= Yindex;
				Rin <= Xindex;
				done <= '1';
				DINout <= '0';
				Ain <= '0';
			elsif (IR(7 downto 6) = "01") then
				DINout <= '1';
				Rout <= "00000000";
				Rin <= Xindex;
				done <= '1';
				Ain <= '0';
			else
				Rin <= "00000000";
				Rout <= Xindex;
				Ain <= '1';
				done <= '0';
				DINout <= '0'; end if;
		when T2 =>
			Rin <= "00000000";
			done <= '0';
			Gout <= '0';
			DINout <= '0';
			Ain <= '0';
			IRin <= '0';
			
			if (IR(7 downto 6) = "00" or IR(7 downto 6) = "01") then
				Rout <= "00000000";
				Gin <= '0';
				Addsub <= '0';
			elsif (IR(7 downto 6) = "10") then
				Rout <= Yindex;
				Gin <= '1';
				AddSub <= '0';
			else
				Rout <= Yindex;
				Gin <= '1';
				addsub <= '1';
			end if;	
		when T3 =>
			Rout <= "00000000";
			DINout <= '0';
			Gin <= '0';
			AddSub <= '0';
			Ain <= '0';
			IRin <= '0';
			
			if (IR(7 downto 6) = "00" or IR(7 downto 6) = "01") then 
				Rin <= "00000000";
				Gout <= '0';
				done <= '0';
			else
				Rin <= Xindex;
				Gout <= '1';
				done <= '1';
			end if;
			end case;
	end process;
end impl;