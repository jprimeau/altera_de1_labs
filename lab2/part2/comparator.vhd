-- DESCRIPTION: Comparator: 1 if > 9 else 0
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Comparator is
	port
	(
		v	: in std_logic_vector(3 downto 0);
		z	: out std_logic
	);
end Comparator;

architecture Behavioral of Comparator is
begin
	z <= (v(3) and v(2)) or (v(3) and v(1));
end Behavioral;