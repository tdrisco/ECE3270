-------------------------------------------------------------
-- Lab 4 Part Control Unit: A control unit that represents a 
-- mealy state machine. Where the states are represented by
-- by the necessary states in the multiplication process.
--Inputs:
--		counter - counter vector from RegD
--		start - start bit to indicate start of new sequence
--Outputs:
--		loadreg - enable bit to indicate loading of registers
--		shiftreg - enable bit to indicate register shifting
--		count - enable bit to increase the count
--		addreg - enable bit to indicate addition sequence
--		busy - bit to indicate computation process
--		done - bit to indicate completion of multiplication
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity ControlUnit is
	generic(data_width : integer := 8);
	port( counter: IN STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0);
			start,rst,clk: IN STD_LOGIC;
			loadreg, shiftreg, addreg: OUT STD_LOGIC;
			count, busy, done: OUT STD_LOGIC
			);
end ControlUnit;

architecture behavioral of ControlUnit is	
	TYPE fsm_state is (waitState,addState,shiftState);
	signal current_state: fsm_state;
	constant countCheck : STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0) := (others => '1');

begin

process(clk,rst) begin

if(rst = '0') then current_state <= waitState;

elsif(rising_edge(clk)) then

	case current_state is
		when waitState =>
			if(start = '1') then current_state  <= addState; end if;
		when addState =>
			current_State <= shiftState;
		when shiftState =>
			if (counter = countCheck) then current_state <= waitState;
			else current_state <= addState; end if;
		end case;
	end if;
end process;

process(current_state,start,counter) begin
	
case current_state is
	when waitState =>
		shiftreg <= '0';
		done <= '0';
		if(start = '0') then
			loadreg <= '1';
			addreg <= '0';
			count <= '0';
			busy <= '0';
		else
			loadreg <= '0';
			addreg <= '1';
			count <= '1';
			busy <= '1';
		end if;
			
	when addState =>
		loadreg <= '0';
		shiftreg <= '1';
		addreg <= '0';
		count <= '0';
		busy <= '1';
		done <= '0';
	
	when shiftState =>
		loadreg <= '0';
		shiftreg <= '0';
		if(counter = countCheck) then
			addreg <= '0';
			count <= '0';
			busy <= '0';
			done <= '1';
		else
			addreg <= '1';
			count <= '1';
			busy <= '1';
			done <= '0';
		end if;
	end case;
	end process;
end behavioral;
	