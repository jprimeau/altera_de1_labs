-- DESCRIPTION: Lab 1 Part 1
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab1Part1 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0)
	);
end Lab1Part1;

architecture Behavioral of Lab1Part1 is
begin
	LEDR <= SW;
end Behavioral;