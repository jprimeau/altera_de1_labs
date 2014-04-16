-- DESCRIPTION: Full adder
-- AUTHOR: Jonathan Primeau
--
--  a b ci | co s
-- --------|------
--  0 0  0 |  0 0
--  0 0  1 |  0 1
--  0 1  0 |  0 1
--  0 1  1 |  1 0
--  1 0  0 |  0 1
--  1 0  1 |  1 0
--  1 1  0 |  1 0
--  1 1  1 |  1 1
--
--  co = BC + AC + AB
--  0 0 1 0
--  0 1 1 1
--
--  s = !A!BC + !AB!C + ABC + A!B!C
--  0 1 0 1
--  1 0 1 0

library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port
	(
		a	: in std_logic;
		b	: in std_logic;
		ci	: in std_logic;
		co : out std_logic;
		s	: out std_logic
	);
end FullAdder;

architecture Behavioral of FullAdder is
begin
	co <= (b and ci) or (a and ci) or (a and b);
	s <= (not a and not b and ci) or (not a and b and not ci) or (a and b and ci) or (a and not b and not ci);
end Behavioral;