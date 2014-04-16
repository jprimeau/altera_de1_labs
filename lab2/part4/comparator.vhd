-- DESCRIPTION: Comparator: 1 if > 9 else 0
-- AUTHOR: Jonathan Primeau
--
-- cABCD z
-- 00000 0
-- 00001 0
-- 00010 0
-- 00011 0
-- 00100 0
-- 00101 0
-- 00110 0
-- 00111 0
-- 01000 0
-- 01001 0
-- 01010 1
-- 01011 1
-- 01100 1
-- 01101 1
-- 01110 1
-- 01111 1
-- 10000 1 (cout)
-- 10001 1 (cout)
-- 10010 1 (cout)
-- 10011 1 (cout)

library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
	port
	(
		cout	: in std_logic;
		v		: in std_logic_vector(3 downto 0);
		z		: out std_logic
	);
end Comparator;

architecture Behavioral of Comparator is
begin
	z <= cout or (v(3) and v(2)) or (v(3) and v(1));
end Behavioral;