-- DESCRIPTION: Lab 2 Part 1
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab2Part1 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6)
	);
end Lab2Part1;

architecture Behavioral of Lab2Part1 is
	component Digits7seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
begin
	DISP1 : Digits7seg port map
	(
		c => SW(7 downto 4),
		disp => HEX1
	);

	DISP0 : Digits7seg port map
	(
		c => SW(3 downto 0),
		disp => HEX0
	);
end Behavioral;