-- DESCRIPTION: Gated RS Latch Circuit
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity RSLatch is
	port
	(
		clk	: in std_logic;
		r		: in std_logic;
		s		: in std_logic;
		q		: out std_logic
	);
end RSLatch;

architecture Structural of RSLatch is
	signal r_g : std_logic;
	signal s_g : std_logic;
	signal q_a : std_logic;
	signal q_b : std_logic;
	attribute keep : boolean;
	attribute keep of r_g, s_g, q_a, q_b : signal is true;
begin
	r_g <= r and clk;
	s_g <= s and clk;
	q_a <= not(r_g or q_b);
	q_b <= not(s_g or q_a);
	
	q <= q_a;
end Structural;