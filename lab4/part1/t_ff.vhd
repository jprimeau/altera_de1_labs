-- DESCRIPTION: T flip-flop
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity TFlipFlop is
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		q		: out std_logic;
		clr	: in std_logic
	);
end TFlipFlop;

architecture Behavioral of TFlipFlop is
	signal qn : std_logic;
begin
	process (clk, t, qn, clr)
	begin
		if clk'event and clk = '1' then
			if t = '1' then
				qn <= not qn;
			end if;
		end if;
		if clr = '0' then
			qn <= '0';
		end if;
		q <= qn;
	end process;
end Behavioral;