-- DESCRIPTION: Lab 2 Part 2
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab2Part2 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6);
		LEDR	: out std_logic_vector(9 downto 0)
	);
end Lab2Part2;

architecture Behavioral of Lab2Part2 is
	component Comparator port
	(
		v	: in std_logic_vector(3 downto 0);
		z	: out std_logic
	);
	end component;
	
	component Mux4bit2to1 port
	(
		x		: in std_logic_vector(3 downto 0);
		y		: in std_logic_vector(3 downto 0);
		s		: in std_logic;
		m		: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component CircuitA port
	(
		v		: in std_logic_vector(2 downto 0);
		z		: out std_logic_vector(2 downto 0)
	);
	end component;
	
	component CircuitB port
	(
		c		: in std_logic;
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	component Digits7seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal v	: std_logic_vector(3 downto 0);
	signal c_a : std_logic_vector(3 downto 0);
	signal z	: std_logic;
	signal m	: std_logic_vector(3 downto 0);
begin
	c_a(3) <= '0';
	v <= SW(3 downto 0);
	LEDR(3 downto 0) <= v;
	
	COMP : Comparator port map
	( v, z );
	
	MUX : Mux4bit2to1 port map
	( v, c_a, z, m );
	
	CA : CircuitA port map
	( v(2 downto 0), c_a(2 downto 0) );
	
	D1 : CircuitB port map
	( z, HEX1 );
	
	D0 : Digits7seg port map
	( m, HEX0 );
end Behavioral;