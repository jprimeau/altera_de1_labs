-- DESCRIPTION: Circuit A: binary to decimal decoder (10-15)
-- AUTHOR: Jonathan Primeau
--
-- ABCD	abcd
-- -----------
-- 0000	0110
-- 0001	0111
-- 0010	1000
-- 0011	1001
-- 0100	XXXX
-- 0101	XXXX
-- 0110	XXXX
-- 0111	XXXX
-- 1000	XXXX
-- 1001	XXXX
-- 1010	0000
-- 1011	0001
-- 1100	0010
-- 1101	0011
-- 1110	0100
-- 1111	0101
--
-- a = !AC
-- b = !A!C + BC
-- c = !C
-- d = D

library ieee;
use ieee.std_logic_1164.all;

entity CircuitA is
	port
	(
		v		: in std_logic_vector(3 downto 0);
		z		: out std_logic_vector(3 downto 0)
	);
end CircuitA;

architecture Behavioral of CircuitA is
begin
	z(3) <= not v(3) and v(1);
	z(2) <= (not v(3) and not v(1)) or (v(2) and v(1));
	z(1) <= not v(1);
	z(0) <= v(0);
end Behavioral;