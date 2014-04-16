-- DESCRIPTION: 7-segment digits decoder
-- AUTHOR: Jonathan Primeau
--
--  c3 c2 c1 c0 | digit     0
-- -------------|------   5   1
--   0  0  0  0 |  0        6
--   0  0  0  1 |  1      4   2
--   0  0  1  0 |  2        3
--   0  0  1  1 |  3
--   0  1  0  0 |  4
--   0  1  0  1 |  5
--   0  1  1  0 |  6
--   0  1  1  1 |  7
--   1  0  0  0 |  8
--   1  0  0  1 |  9
--
--  A B C D | a b c d e f g
-- -------------------------
--  0 0 0 0 | 0 0 0 0 0 0 1
--  0 0 0 1 | 1 0 0 1 1 1 1
--  0 0 1 0 | 0 0 1 0 0 1 0
--  0 0 1 1 | 0 0 0 0 1 1 0
--  0 1 0 0 | 1 0 0 1 1 0 0
--  0 1 0 1 | 0 1 0 0 1 0 0
--  0 1 1 0 | 0 1 0 0 0 0 0
--  0 1 1 1 | 0 0 0 1 1 1 1
--  1 0 0 0 | 0 0 0 0 0 0 0
--  1 0 0 1 | 0 0 0 0 1 0 0


library ieee;
use ieee.std_logic_1164.all;

entity Bdc7seg is
	port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
end Bdc7seg;

architecture Behavioral of Bdc7seg is
begin
	disp(0) <= (c(2) and not c(1) and not c(0)) or (not c(3) and not c(2) and not c(1) and c(0));
	disp(1) <= (c(2) and not c(1) and c(0)) or (c(2) and c(1) and not c(0));
	disp(2) <= not c(2) and c(1) and not c(0);
	disp(3) <= (c(2) and not c(1) and not c(0)) or (not c(3) and not c(2) and not c(1) and c(0)) or (c(2) and c(1) and c(0));
	disp(4) <= (c(2) and not c(1) and not c(0)) or c(0);
	disp(5) <= (not c(3) and not c(2) and not c(1) and c(0)) or (c(1) and c(0)) or (not c(2) and c(1) and not c(0));
	disp(6) <= (not c(3) and not c(2) and not c(1)) or (c(2) and c(1) and c(0));
end Behavioral;