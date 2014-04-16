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

architecture Structural of GatedDLatch is
	signal r : std_logic;
	signal s : std_logic;
	signal r_g : std_logic;
	signal s_g : std_logic;
	signal q_a : std_logic;
	signal q_b : std_logic;
	attribute keep : boolean;
	attribute keep of r, r_g, s_g, q_a, q_b : signal is true;
begin
	s <= d;
	r <= not d;
	s_g <= not(s and clk);
	r_g <= not(r and clk);
	q_a <= not(s_g and q_b);
	q_b <= not(r_g and q_a);
	
	q <= q_a;
end Structural;