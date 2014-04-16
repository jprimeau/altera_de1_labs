-- DESCRIPTION: Lab 1 Part 4: 7-segment custom character decoder
-- AUTHOR: Jonathan Primeau
--
--  c1 c0 | char      0
-- -------|------   5   1
--  0  0  |  d        6
--  0  1  |  E      4   2
--  1  0  |  1        3
--  1  1  |

library ieee;
use ieee.std_logic_1164.all;

entity Lab1Part4 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0);
		HEX0	: out std_logic_vector(0 to 6)
	);
end Lab1Part4;

architecture Behavioral of Lab1Part4 is
	signal c	: std_logic_vector(1 downto 0);
	signal d	: std_logic_vector(0 to 6);
begin
	c <= SW(1 downto 0);
	LEDR(1 downto 0) <= c;

	d(0) <= c(1) or not c(0);
	d(1) <= c(0);
	d(2) <= c(0);
	d(3) <= c(1);
	d(4) <= c(1);
	d(5) <= c(1) or not c(0);
	d(6) <= c(1);

	HEX0 <= d;
end Behavioral;