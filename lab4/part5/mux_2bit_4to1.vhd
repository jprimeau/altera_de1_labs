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
		u		: in std_logic_vector(0 to 6);
		v		: in std_logic_vector(0 to 6);
		w		: in std_logic_vector(0 to 6);
		x		: in std_logic_vector(0 to 6);
		m		: out std_logic_vector(0 to 6)
	);
end Mux2bit4to1;

architecture Behavioral of Mux2bit4to1 is
begin

	process (s, u, v, w, x)
	begin
		case s is
			when "00" => m <= u;
			when "01" => m <= v;
			when "10" => m <= w;
			when "11" => m <= x;
			when others => m <= (others => 'Z');
		end case;
	end process;
end Behavioral;
