-- DESCRIPTION: Four-bit wide 2-to-1 multiplexer
-- AUTHOR: Jonathan Primeau
--
--  s | m
-- ---|---
--  0 | x
--  1 | y

library ieee;
use ieee.std_logic_1164.all;

entity Mux4bit2to1 is
	port
	(
		x		: in std_logic_vector(3 downto 0);
		y		: in std_logic_vector(3 downto 0);
		s		: in std_logic;
		m		: out std_logic_vector(3 downto 0)
	);
end Mux4bit2to1;

architecture Behavioral of Mux4bit2to1 is
begin
	m(0) <= (not s and x(0)) or (s and y(0));
	m(1) <= (not s and x(1)) or (s and y(1));
	m(2) <= (not s and x(2)) or (s and y(2));
	m(3) <= (not s and x(3)) or (s and y(3));
end Behavioral;