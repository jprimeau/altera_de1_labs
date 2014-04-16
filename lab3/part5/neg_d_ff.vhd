-- DESCRIPTION: Negative-edge triggered D flip-flop
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity NegDFlipFlop is
	port
	(		
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic;
		clr	: in std_logic
	);
end NegDFlipFlop;

architecture Behavioral of NegDFlipFlop is
begin
	process (clk, d, clr)
	begin
		if clk'event and clk = '0' then
			q <= d;
		end if;
		if clr = '1' then
			q <= '0';
		end if;
	end process;
end Behavioral;