-- DESCRIPTION: Lab 4 Part 1
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab4Part1 is
	port
	(		
		KEY	: in std_logic_vector(1 downto 0);
		SW		: in std_logic_vector(1 downto 0);
		LEDR	: out std_logic_vector(1 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6)
	);
end Lab4Part1;

architecture Behavioral of Lab4Part1 is
	component TFlipFlop port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		q		: out std_logic;
		clr	: in std_logic
	);
	end component;
	
	component Hex7Seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal clk 	: std_logic;
	signal clr 	: std_logic;
	signal t 	: std_logic_vector(7 downto 0);
	signal q 	: std_logic_vector(7 downto 0);
begin
	clk <= not KEY(0);
	LEDR <= SW;
	clr <= not SW(0);
	
	t(0) <= SW(1);
	t(1) <= SW(1) and q(0);
	t(2) <= t(1) and q(1);
	t(3) <= t(2) and q(2);
	t(4) <= t(3) and q(3);
	t(5) <= t(4) and q(4);
	t(6) <= t(5) and q(5);
	t(7) <= t(6) and q(6);
	
	c0 : TFlipFlop port map ( clk, t(0), q(0), clr );
	c1 : TFlipFlop port map ( clk, t(1), q(1), clr );
	c2 : TFlipFlop port map ( clk, t(2), q(2), clr );
	c3 : TFlipFlop port map ( clk, t(3), q(3), clr );
	c4 : TFlipFlop port map ( clk, t(4), q(4), clr );
	c5 : TFlipFlop port map ( clk, t(5), q(5), clr );
	c6 : TFlipFlop port map ( clk, t(6), q(6), clr );
	c7 : TFlipFlop port map ( clk, t(7), q(7), clr );
	
	disp_1 : Hex7Seg port map ( q(7 downto 4), HEX1 );
	disp_0 : Hex7Seg port map ( q(3 downto 0), HEX0 );
end Behavioral;