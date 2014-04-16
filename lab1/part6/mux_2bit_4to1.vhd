-- DESCRIPTION: Two-bit wide 4-to-1 multiplexer
-- AUTHOR: Jonathan Primeau
--
-- s1 s0 | m
-- ------|---
--  0  0 | u
--  0  1 | v
--  1  0 | w
--  1  1 | x

library ieee;
use ieee.std_logic_1164.all;

entity Mux2bit4to1 is
	port
	(
		s		: in std_logic_vector(1 downto 0);
		u		: in std_logic_vector(1 downto 0);
		v		: in std_logic_vector(1 downto 0);
		w		: in std_logic_vector(1 downto 0);
		x		: in std_logic_vector(1 downto 0);
		m		: out std_logic_vector(1 downto 0)
	);
end Mux2bit4to1;

architecture Behavioral of Mux2bit4to1 is
begin
	m(0) <= (not s(1) and not s(0) and u(0)) or (not s(1) and s(0) and v(0)) or 
				(s(1) and not s(0) and w(0)) or (s(1) and s(0) and x(0));
	m(1) <= (not s(1) and not s(0) and u(1)) or (not s(1) and s(0) and v(1)) or 
				(s(1) and not s(0) and w(1)) or (s(1) and s(0) and x(1));
end Behavioral;
