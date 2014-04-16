-- DESCRIPTION: Gated D Latch Circuit
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity GatedDLatch is
	port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
end GatedDLatch;

architecture Behavioral of GatedDLatch is
begin
	process (clk, d)
	begin
		if clk = '1' then
			q <= d;
		end if;
	end process;
end Behavioral;