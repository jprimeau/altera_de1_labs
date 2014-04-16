-- DESCRIPTION: Lab 3 Part 1
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab3Part1 is
	port
	(
		clk	: in std_logic;
		r		: in std_logic;
		s		: in std_logic;
		q		: out std_logic
	);
end Lab3Part1;

architecture Behavioral of Lab3Part1 is
	component RSLatch port
	(
		clk	: in std_logic;
		r		: in std_logic;
		s		: in std_logic;
		q		: out std_logic
	);
	end component;
begin
	rsl : RSLatch port map
	( clk, r, s, q );
end Behavioral;