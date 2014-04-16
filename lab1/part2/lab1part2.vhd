-- DESCRIPTION: Lab 1 Part 2: Four-bit wide 2-to-2 multiplexer
-- AUTHOR: Jonathan Primeau
--
--  s | m
-- ---|---
--  0 | x
--  1 | y

library ieee;
use ieee.std_logic_1164.all;

entity Lab1Part2 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0);
		LEDG	: out std_logic_vector(7 downto 0)
	);
end Lab1Part2;

architecture Behavioral of Lab1Part2 is
	signal x		: std_logic_vector(3 downto 0);
	signal y		: std_logic_vector(3 downto 0);
	signal s		: std_logic;
	signal m		: std_logic_vector(3 downto 0);
begin
	s <= SW(9);
	LEDR(9) <= s;
	x <= SW(7 downto 4);
	LEDR(7 downto 4) <= x;
	y <= SW(3 downto 0);
	LEDR(3 downto 0) <= y;
	
	m <= (not s and x) or (s and y);
	
	LEDG(3 downto 0) <= m;
end Behavioral;