-- DESCRIPTION: Circuit A: binary to decimal decoder (10-15)
-- AUTHOR: Jonathan Primeau
--
-- ABCD	abc
-- -----------
-- 0000	XXX
-- 0001	XXX
-- 0010	XXX
-- 0011	XXX
-- 0100	XXX
-- 0101	XXX
-- 0110	XXX
-- 0111	XXX
-- 1000	XXX
-- 1001	XXX
-- 1010	000
-- 1011	001
-- 1100	010
-- 1101	011
-- 1110	100
-- 1111	101
--
-- a = BC
-- XX0X
-- XX0X
-- XX10
-- XX10
--
-- b = !C
-- XX1X
-- XX1X
-- XX00
-- XX00
--
-- c = D
-- XX0X
-- XX1X
-- XX11
-- XX00

library ieee;
use ieee.std_logic_1164.all;

entity CircuitA is
	port
	(
		v		: in std_logic_vector(2 downto 0);
		z		: out std_logic_vector(2 downto 0)
	);
end CircuitA;

architecture Behavioral of CircuitA is
begin
	z(2) <= v(2) and v(1);
	z(1) <= not v(1);
	z(0) <= v(0);
end Behavioral;