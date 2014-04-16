-- DESCRIPTION: Lab 3 Part 4
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab3Part4 is
	port
	(
		clk	: in std_logic;
		d		: in std_logic;
		qa		: out std_logic;
		qb		: out std_logic;
		qc		: out std_logic
	);
end Lab3Part4;

architecture Behavioral of Lab3Part4 is
	component GatedDLatch port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
	end component;
	
	component PosDFlipFlop port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
	end component;
	
	component NegDFlipFlop port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
	end component;
begin

	sto_a : GatedDLatch port map
	( clk, d, qa );
	
	sto_b : PosDFlipFlop port map
	( clk, d, qb );
	
	sto_c : NegDFlipFlop port map
	( clk, d, qc );
	
end Behavioral;