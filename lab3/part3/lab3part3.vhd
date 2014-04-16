-- DESCRIPTION: Lab 3 Part 3
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab3Part3 is
	port
	(
		SW			: in std_logic_vector(1 downto 0);
		LEDR		: out std_logic_vector(1 downto 0)
	);
end Lab3Part3;

architecture Behavioral of Lab3Part3 is
	component GatedDLatch port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
	end component;
	
	signal clk : std_logic;
	signal d : std_logic;
	signal qm : std_logic;
	signal q : std_logic;
begin
	clk <= SW(1);
	d <= SW(0);
	LEDR(0) <= q;
	LEDR(1) <= clk;

	master : GatedDLatch port map
	( not clk, d, qm );
	
	slave : GatedDLatch port map
	( clk, qm, q );
end Behavioral;