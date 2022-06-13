-------------------------------------------------------------
-- Lab 2: Implementation of a lock finite state machine that
--	is designed to detect a sequence of abaa. A is represented
-- by an input of 10 and b is represented by an input of 01.
-- Between each correct input should be a 00 detected on the 
-- input.
--
--Inputs:
--		inputs  - Two bit data inputs
--		ivalid	- Single bit input used to determine if input
--					  is valid
--		clk	- system clock
--		rst	- Single bit active low reset into the FSM
--Output:
--		output	- Single bit output to represent if lock
--					  has unlocked
------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity lock is
	port( inputs: IN STD_LOGIC_VECTOR(1 downto 0); --will map to SW
			ivalid: IN STD_LOGIC;	--will map to SW
			clk: IN STD_LOGIC; -- will map to key
			rst: IN STD_LOGIC; -- will map to SW
			output: OUT STD_LOGIC); --will map to single led (on will mean unlocked)
end lock;

architecture impl of lock is

-- Define all the states (the naming represents what has been detected)
TYPE fsm_state IS (A0_B0_00,A1_B0_00,A1_B0_01,A1_B1_01,
						A1_B1_02,A2_B1_02,A2_B1_03,A3_B1_03,A3_B1_04);
						
Signal current_state: fsm_state;

begin

--Only instances when FSM should update are the clock and rst
process(clk,rst) Begin

--Reset if needed, then  check for ivalid and rising clock edge
if(rst = '0') then current_state <= A0_B0_00;

elsif(ivalid = '1') and (rising_edge(clk)) then

-- Update the state based on current state
	case current_state is
		when A0_B0_00 => --A
			if (inputs = "00") then current_state <= A0_B0_00;
			elsif (inputs = "01") then current_state <= A0_B0_00;
			elsif (inputs = "10") then current_state <= A1_B0_00;
			else current_state <= A0_B0_00; end if;
		when A1_B0_00 => --B
			if (inputs = "00") then current_state <= A1_B0_01;
			elsif (inputs = "01") then current_state <= A0_B0_00;
			elsif (inputs = "10") then current_state <= A1_B0_00;
			else current_state <= A1_B0_00; end if;
		when A1_B0_01 => --C
			if (inputs = "00") then current_state <= A1_B0_01;
			elsif (inputs = "01") then current_state <= A1_B1_01;
			elsif (inputs = "10") then current_state <= A1_B0_00;
			else current_state <= A1_B0_01; end if;
		when A1_B1_01 => --D
			if (inputs = "00") then current_state <= A1_B1_02;
			elsif (inputs = "01") then current_state <= A1_B1_01;
			elsif (inputs = "10") then current_state <= A1_B0_00;
			else current_state <= A1_B1_01; end if;
		when A1_B1_02 => --E
			if (inputs = "00") then current_state <= A1_B1_02;
			elsif (inputs = "01") then current_state <= A1_B1_01;
			elsif (inputs = "10") then current_state <= A2_B1_02;
			else current_state <= A1_B1_02; end if;
		when A2_B1_02 => --F
			if (inputs = "00") then current_state <= A2_B1_03;
			elsif (inputs = "01") then current_state <= A1_B1_01;
			elsif (inputs = "10") then current_state <= A2_B1_02;
			else current_state <= A2_B1_02; end if;
		when A2_B1_03 => --G
			if (inputs = "00") then current_state <= A2_B1_03;
			elsif (inputs = "01") then current_state <= A1_B1_01;
			elsif (inputs = "10") then current_state <= A3_B1_03;
			else current_state <= A2_B1_03; end if;
		when A3_B1_03 => --H
			if (inputs = "00") then current_state <= A3_B1_04;
			elsif (inputs = "01") then current_state <= A0_B0_00;
			elsif (inputs = "10") then current_state <= A3_B1_03;
			else current_state <= A0_B0_00; end if;
		when others => --I
			if (inputs = "00") then current_state <= A3_B1_04;
			elsif (inputs = "01") then current_state <= A0_B0_00;
			elsif (inputs = "10") then current_state <= A0_B0_00;
			else current_state <= A0_B0_00; end if;
			
		end case;
		end if;
	end process;
	
--Update the output
output <= '1' when current_state = A3_B1_03 or current_state = A3_B1_04 else '0';

end impl;


