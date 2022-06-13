-------------------------------------------------------------
-- Lab 3 Part 5: Final processor implementation
--Inputs:
--		DIN  - variable data input
--		run  - single bit input that must be high in order to
--				 for the state machine to be able to leave state one
--		resetn  - single bit active low reset
--		clock - system clock
--Output:
--		dataBus - Variable data output
--    Done - Single bit data output indicating finished sequence
------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity finalProcessor is
generic(dataWidth : integer := 16);
	port( clock: IN STD_LOGIC;
			resetn: IN STD_LOGIC;
			run: IN STD_LOGIC;
			DIN: IN STD_LOGIC_VECTOR(dataWidth -1 downto 0);
			dataBus: OUT STD_LOGIC_VECTOR(dataWidth -1 downto 0);
			Done: OUT STD_LOGIC);
end finalProcessor;

architecture struct of finalProcessor is

--declare all needed signals 
signal IRin_sig,Gout_sig,DINout_sig,Ain_sig,Gin_sig,addSub_sig: STD_LOGIC;
signal Rout_sig,Rin_sig,IRdata_sig: STD_LOGIC_VECTOR(7 downto 0);
signal dataBus_sig,dummy, addsubAreg_sig,addsubOut_sig,datagout_sig: STD_LOGIC_VECTOR(dataWidth -1 downto 0);
signal R0muxIn,R1muxIn,R2muxIn,R3muxIn,R4muxIn,R5muxIn,R6muxIn,R7muxIn: STD_LOGIC_VECTOR(dataWidth -1 downto 0);
signal muxSelector : STD_LOGIC_VECTOR(9 downto 0);
--declare all needed components

component simpleRegister 
Generic(data_width : integer);
	port( clk: in std_logic;
			enableBit: in std_logic;
			d: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			q: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end component;

component mux 
generic(data_width : integer);
	port( sel: IN STD_LOGIC_VECTOR(9 downto 0);
			p: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --R0-R7
			q: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			r: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			s: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			t: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			u: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			v: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			w: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			x: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --G
			y: IN STD_LOGIC_VECTOR((data_width-1) downto 0); --Din (default)
			m: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end component;

component addsub 
generic(data_width : integer);
	port( sel: IN STD_LOGIC;
			input1: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			input2: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			output1: OUT STD_LOGIC_VECTOR((data_width-1) downto 0));
end component;

component controlUnit 
	port( enable: IN STD_LOGIC;
			rst: IN STD_LOGIC;
			clk: IN STD_LOGIC;
			ir: IN STD_LOGIC_VECTOR(7 downto 0);
			done: OUT STD_LOGIC;
			Rout,Rin: OUT STD_LOGIC_VECTOR(7 downto 0);
			Gout,DINout : OUT STD_LOGIC;
			Gin,AddSub,Ain,IRin : OUT STD_LOGIC);
end component;



Begin
-- include all the neccesary portmaps
-- 10 registers
-- 1 multiplexer
-- 1 addsub unit
muxSelector <= (DINout_sig&Gout_sig&Rout_sig);
dataBus <= dataBus_sig;
--dataBus_sig <= "1000000011111111";


IRreg : simpleRegister
	generic map (data_width => 8)
	PORT MAP (
			clk => clock,
			enableBit => IRin_sig,
			d => DIN(7 downto 0),
			q => IRdata_sig
			);
			
Areg : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Ain_sig,
			d => dataBus_sig,
			q => addsubAreg_sig
			);

Greg : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Gin_sig,
			d => addsubOut_sig,
			q => datagout_sig
			);
			
R0 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(0),
			d => dataBus_sig,
			q => R0muxIn
			);
			
R1 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(1),
			d => dataBus_sig,
			q => R1muxIn
			);
			
R2 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(2),
			d => dataBus_sig,
			q => R2muxIn
			);
			
R3 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(3),
			d => dataBus_sig,
			q => R3muxIn
			);
			
R4 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(4),
			d => dataBus_sig,
			q => R4muxIn
			);
			
R5 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(5),
			d => dataBus_sig,
			q => R5muxIn
			);
			
R6 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(6),
			d => dataBus_sig,
			q => R6muxIn
			);
			
R7 : simpleRegister
	generic map (data_width => dataWidth)
	PORT MAP (
			clk => clock,
			enableBit => Rin_sig(7),
			d => dataBus_sig,
			q => R7muxIn
			);
			
multiplexer : mux
	generic map(data_width => dataWidth)
	PORT MAP (
			--sel(9) => DINout_sig,
			--sel(8) => Gout_sig,
			--sel(7 downto 0) => Rout_sig,
			sel => muxSelector,
			p => R0muxIN,
			q => R1muxIN,
			r => R2muxIN,
			s => R3muxIN,
			t => R4muxIN,
			u => R5muxIN,
			v => R6muxIN,
			w => R7muxIN,
			x => datagout_sig,
			y => DIN,
			m => dataBus_sig
			);
			
addSubUnit : addsub
	generic map(data_width => dataWidth)
	PORT MAP ( 
			sel => addSub_sig,
			input1 => addsubAreg_sig,
			input2 => dataBus_sig,
			output1 => addsubOut_sig
			);
			
controlUnit_FSM : controlUnit
	PORT MAP ( 
			enable => run,
			rst => resetn,
			clk => clock,
			ir => IRdata_sig,
			done => Done,
			Rout => Rout_sig,
			Rin => Rin_sig,
			Gout => Gout_sig,
			DINout => DINout_sig,
			Gin => Gin_sig,
			AddSub => addSub_sig,
			Ain => Ain_sig,
			IRin => IRin_sig
			);
			

--muxSelector(9) <= DINout_sig;
			--muxSelector(8) <= Gout_sig;
			--muxSelector(7 downto 0) <= Rout_sig;
end struct;