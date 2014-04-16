-- DESCRIPTION: T flip-flop
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		clr	: in std_logic;
		q		: inout std_logic
	);
end TFlipFlop;

architecture Behavioral of TFlipFlop is
begin
	process (clk, t, clr)
	begin
		if clk'event and clk = '1' then
			if clr = '0' then
				q <= '0';
			elsif t = '1' then
				q <= not q;
			end if;
		end if;
	end process;
end Behavioral;