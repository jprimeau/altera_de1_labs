-- DESCRIPTION: Positive-edge triggered D flip-flop
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity PosDFlipFlop is
	port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic
	);
end PosDFlipFlop;

architecture Behavioral of PosDFlipFlop is
begin
	process (clk, d)
	begin
		if clk'event and clk = '1' then
			q <= d;
		end if;
	end process;
end Behavioral;