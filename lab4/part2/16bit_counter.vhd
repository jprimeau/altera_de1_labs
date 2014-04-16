-- DESCRIPTION: T flip-flop
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity SixteenBitCounter is
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		q		: inout std_logic_vector(15 downto 0);
		clr	: in std_logic
	);
end SixteenBitCounter;

architecture Behavioral of SixteenBitCounter is
begin
	process (clk, t, clr)
	begin
		if clk'event and clk = '1' then
			if t = '1' then
				q <= q + 1;
			end if;
			if clr = '0' then
				q <= (others => '0');
			end if;
		end if;
	end process;
end Behavioral;