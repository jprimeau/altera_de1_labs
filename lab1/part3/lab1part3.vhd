-- DESCRIPTION: Lab 1 Part 3: Two-bit wide 3-to-1 multiplexer
-- AUTHOR: Jonathan Primeau
-- 
-- s1 s0 | m
-- ------|---
--  0  0 | u
--  0  1 | v
--  1  0 | w
--  1  1 | w

library ieee;
use ieee.std_logic_1164.all;

entity Lab1Part3 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0);
		LEDG	: out std_logic_vector(7 downto 0)
	);
end Lab1Part3;

architecture Behavioral of Lab1Part3 is
	signal u		: std_logic_vector(1 downto 0);
	signal v		: std_logic_vector(1 downto 0);
	signal w		: std_logic_vector(1 downto 0);
	signal s		: std_logic_vector(1 downto 0);
	signal m		: std_logic_vector(1 downto 0);
begin
	s <= SW(9 downto 8);
	LEDR(9 downto 8) <= s;
	u <= SW(5 downto 4);
	LEDR(5 downto 4) <= u;
	v <= SW(3 downto 2);
	LEDR(3 downto 2) <= v;
	w <= SW(1 downto 0);
	LEDR(1 downto 0) <= w;

	m(0) <= (not s(1) and not s(0) and u(0)) or (not s(1) and s(0) and v(0)) or (s(1) and w(0));
	m(1) <= (not s(1) and not s(0) and u(1)) or (not s(1) and s(0) and v(1)) or (s(1) and w(1));
	
	LEDG(1 downto 0) <= m;
	
end Behavioral;