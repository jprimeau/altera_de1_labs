-- DESCRIPTION: X-bit counter
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter is
	generic ( n : integer := 8 );
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		clr	: in std_logic;
		q		: inout std_logic_vector(n-1 downto 0)
	);
end Counter;

architecture Behavioral of Counter is
begin
	process (clk, t, clr)
	begin
		if clk'event and clk = '1' then
			if clr = '0' then
				q <= (others => '0');
			elsif t = '1' then
				q <= q + 1;
			end if;
		end if;
	end process;
end Behavioral;