--------------------------------------------------------
-- Lab 4 Part finalCircuit - structural implementation
--	of the bit-pair recoded multiplier
-- Inputs:
--		reset - single bit low active reset
--		clock - system clock
--		start - single bit system enable
--		multiplicand - multiplicand data input
--		multiplier - multiplier data input
-- Outputs:
--		busy - single bit to indicate when in computation
--		done - single bit to indicate completion
--		product - final product data output
--------------------------------------------------------		

LIBRARY ieee;
USE ieee.std_logic_1164.all;


entity finalCircuit is
generic(dataWidth : integer := 8);
	port( clock, reset, start: IN STD_LOGIC;
			multiplier, multiplicand: IN STD_LOGIC_VECTOR(dataWidth -1 downto 0);
			busy, done: OUT STD_LOGIC;
			product: OUT STD_LOGIC_VECTOR((dataWidth *2)-1 downto 0)
			);
end finalCircuit;

architecture structural of finalCircuit is


--declare any needed signals here
signal counter_sig: STD_LOGIC_VECTOR((((dataWidth+1)/2)-1) downto 0);
signal loadreg_sig, addreg_sig, shiftreg_sig, count_sig, notLoadreg : STD_LOGIC;
signal x1_sig, xneg1_sig, x2_sig, xneg2_sig: STD_LOGIC_VECTOR(dataWidth downto 0);
signal shiftout_sig : STD_LOGIC_VECTOR(1 downto 0);
signal muxSelect_sig : STD_LOGIC_VECTOR(2 downto 0);
signal lowerProduct, upperProduct, mux2_sig, mux5_sig, adderOut : STD_LOGIC_VECTOR(dataWidth downto 0);

--declare components
Component Mux2to1
generic(data_width : integer := 8);
	port( sel: IN STD_LOGIC;
			y: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent sum from adder
			m: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end component;

Component Mux5to1
generic(data_width : integer := 8);
	port( sel: IN STD_LOGIC_VECTOR(2 downto 0);
			v: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent 2
			w: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent -2
			x: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent 1
			y: IN STD_LOGIC_VECTOR((data_width) downto 0); -- will represent -1
			m: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Component;

Component Adder
generic(data_width : integer := 8);
	port( input1: IN STD_LOGIC_VECTOR((data_width) downto 0);
			input2: IN STD_LOGIC_VECTOR((data_width) downto 0);
			output1: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Component;

Component ControlUnit
	generic(data_width : integer := 8);
	port( counter: IN STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0);
			start,rst,clk: IN STD_LOGIC;
			loadreg, shiftreg, addreg: OUT STD_LOGIC;
			count, busy, done: OUT STD_LOGIC
			);
end Component;

Component RegA
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			multiplicand: IN STD_LOGIC_VECTOR((data_width-1) downto 0);
			recode_1: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_Neg1: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_2: OUT STD_LOGIC_VECTOR((data_width) downto 0);
			recode_Neg2: OUT STD_LOGIC_VECTOR((data_width) downto 0));
end Component;

Component RegB
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			shiftEnable: in std_logic;
			shiftIn: IN STD_LOGIC_VECTOR(1 downto 0);
			d: IN STD_LOGIC_VECTOR(data_width-1 downto 0);
			q: OUT STD_LOGIC_VECTOR(data_width downto 0);
			muxSelect: OUT STD_LOGIC_VECTOR(2 downto 0));
end Component;

Component RegC
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit1: in std_logic;
			enableBit2: in std_logic;
			shiftEnable: in std_logic;
			shiftOut: OUT STD_LOGIC_VECTOR(1 downto 0);
			d: IN STD_LOGIC_VECTOR(data_width downto 0);
			q: OUT STD_LOGIC_VECTOR(data_width downto 0));
end Component;

Component RegD
Generic(data_width : integer := 8);
	port( clk: in std_logic;
			enableBit: in std_logic;
			countEnable: in std_logic;
			q: OUT STD_LOGIC_VECTOR((((data_width+1)/2)-1) downto 0));
end Component;

begin

product <= upperProduct(dataWidth-1 downto 0) & lowerProduct(datawidth downto 1); --chnaged to downto 0from 1 and made data width -2 
notLoadreg <= not(loadreg_sig);

CU : ControlUnit
	generic map(data_width => dataWidth)
	port map (counter_sig, start,reset, clock, loadreg_sig, shiftreg_sig, addreg_sig,
				count_sig, busy, done);
				
RA : RegA
	generic map(data_width => dataWidth)
	port map (clock, loadreg_sig, multiplicand, x1_sig, xneg1_sig, x2_sig, xneg2_sig);
	
RB : RegB
	generic map(data_width => dataWidth)
	port map (clock, loadreg_sig, shiftreg_sig, upperProduct(1 downto 0), multiplier, lowerProduct, muxSelect_sig);

RC : RegC
	generic map(data_width => dataWidth)
	port map (clock, loadreg_sig, addreg_sig, shiftreg_sig, shiftout_sig, mux2_sig, upperProduct);
	
RD : RegD
	generic map(data_width => dataWidth)
	port map (clock, loadreg_sig, count_sig, counter_sig);

add : adder
	generic map(data_width => dataWidth)
	port map (upperProduct, mux5_sig, adderOut);

mux5 : Mux5to1
	generic map(data_width => dataWidth)
	port map (muxSelect_sig, x2_sig, xneg2_sig, x1_sig, xneg1_sig, mux5_sig);
	
mux2 : Mux2to1
	generic map(data_width => dataWidth)
	port map (notLoadreg, adderOut, mux2_sig);

end structural;
