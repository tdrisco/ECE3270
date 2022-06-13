-----------------------------------------------------------------
-- Lab 1 Part 5: A final circuit design that implements
--	all the components from the previous part to create
-- a circuit that displays an output of letters composed
-- of (H,E,L,O,Blank) 
--Inputs:
--		clock  - system clock
--		SW_ff	- three bit data input
--		SW_mux	- three bit selector for the multiplexer
--Output:
--		HEX0	- seven bit output data designed for 7-segment display
--		HEX1	- seven bit output data designed for 7-segment display
--		HEX2	- seven bit output data designed for 7-segment display
--		HEX3	- seven bit output data designed for 7-segment display
--		HEX4	- seven bit output data designed for 7-segment display
-----------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity finalCircuit is
	port( clock: IN STD_LOGIC_VECTOR(3 downto 0);
			SW_ff: IN STD_LOGIC_VECTOR(2 downto 0);
			SW_mux: IN STD_LOGIC_VECTOR(2 downto 0);
			HEX0: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX1: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX2: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX3: OUT STD_LOGIC_VECTOR(6 downto 0);
			HEX4: OUT STD_LOGIC_VECTOR(6 downto 0));
end finalCircuit;

architecture struct of finalCircuit is

-- Define all the signals (internal Wires) for the dff outputs
signaL dff0_out: std_logic_vector(2 downto 0);
signaL dff1_out: std_logic_vector(2 downto 0);
signaL dff2_out: std_logic_vector(2 downto 0);
signaL dff3_out: std_logic_vector(2 downto 0);

-- Define all the components for final circuit
-- Include D flip-flop, Multiplexer, and Decoder
component lab1_DFF 
	port( clk: in std_logic;
			d: IN STD_LOGIC_VECTOR(2 downto 0);
			q: OUT STD_LOGIC_VECTOR(2 downto 0));
end component;

Component five_mux
	port( s: IN STD_LOGIC_VECTOR(2 downto 0);
			u: IN STD_LOGIC_VECTOR(2 downto 0);
			v: IN STD_LOGIC_VECTOR(2 downto 0);
			w: IN STD_LOGIC_VECTOR(2 downto 0);
			x: IN STD_LOGIC_VECTOR(2 downto 0);
			y: IN STD_LOGIC_VECTOR(2 downto 0);
			m: OUT STD_LOGIC_VECTOR(2 downto 0));
END COMPONENT;


component decoder
	port( inBits: IN STD_LOGIC_VECTOR(2 downto 0);
			outBits: OUT STD_LOGIC_VECTOR(6 downto 0));
end component;

-- Define all the signals (internal Wires) for the multiplexer outputs
signaL mux0_out: std_logic_vector(2 downto 0);
signaL mux1_out: std_logic_vector(2 downto 0);
signaL mux2_out: std_logic_vector(2 downto 0);
signaL mux3_out: std_logic_vector(2 downto 0);
signaL mux4_out: std_logic_vector(2 downto 0);

BEGIN


-- Port map for each one of four dffs
--inputs come from final circcuit entity
dff0 : lab1_DFF
	PORT MAP (
			clk => clock(1),
			d => SW_ff,
			q => dff0_out
			);
			
dff1 : lab1_DFF
	PORT MAP (
			clk => clock(2),
			d => SW_ff,
			q => dff1_out
			);

dff2 : lab1_DFF
	PORT MAP (
			clk => clock(3),
			d => SW_ff,
			q => dff2_out
			);
			
dff3 : lab1_DFF
	PORT MAP (
			clk => clock(0),
			d => SW_ff,
			q => dff3_out
			);
			
--Port map for each one of five multiplexers
--Inputs are comprised of outputs from dffs
mux0 : five_mux
	PORT MAP (
			s => SW_mux,
			u => SW_ff,
			v => dff3_out,
			w => dff0_out,
			x => dff1_out,
			y => dff2_out,
			m => mux0_out
			);

mux1 : five_mux
	PORT MAP (
			s => SW_mux,
			u => dff3_out,
			v => dff0_out,
			w => dff1_out,
			x => dff2_out,
			y => SW_ff,
			m => mux1_out
			);

mux2 : five_mux
	PORT MAP (
			s => SW_mux,
			u => dff0_out,
			v => dff1_out,
			w => dff2_out,
			x => SW_ff,
			y => dff3_out,
			m => mux2_out
			);

mux3 : five_mux
	PORT MAP (
			s => SW_mux,
			u => dff1_out,
			v => dff2_out,
			w => SW_ff,
			x => dff3_out,
			y => dff0_out,
			m => mux3_out
			);

mux4 : five_mux
	PORT MAP (
			s => SW_mux,
			u => dff2_out,
			v => SW_ff,
			w => dff0_out,
			x => dff3_out,
			y => dff1_out,
			m => mux4_out
			);

--Port map for the five decoders
--Input is assigned as the output from the 5 mulitplexers
--Each multiplexer has respective decoder
--Output gets assigned to finalCircuit entity output
decoder0 : decoder
			PORT MAP (
					inbits => mux0_out,
					outbits => HEX0
					);
					
decoder1 : decoder
			PORT MAP (
					inbits => mux1_out,
					outbits => HEX1
					);
					
decoder2 : decoder
			PORT MAP (
					inbits => mux2_out,
					outbits => HEX2
					);
					
decoder3 : decoder
			PORT MAP (
					inbits => mux3_out,
					outbits => HEX3
					);
					
decoder4 : decoder
			PORT MAP (
					inbits => mux4_out,
					outbits => HEX4
					);
end struct;
