-- DESCRIPTION: Lab 2 Part 4
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab2Part4 is
	port
	(
		SW		:	in std_logic_vector(8 downto 0);
		LEDR	:	out std_logic_vector(8 downto 0);
		LEDG	:	out std_logic_vector(7 downto 0);
		HEX0	:	out std_logic_vector(0 to 6);
		HEX1	:	out std_logic_vector(0 to 6);
		HEX2	:	out std_logic_vector(0 to 6);
		HEX3	:	out std_logic_vector(0 to 6)
	);
end Lab2Part4;

architecture Behavioral of Lab2Part4 is
	component FullAdder 	port
	(
		a	: in std_logic;
		b	: in std_logic;
		ci	: in std_logic;
		co : out std_logic;
		s	: out std_logic
	);
	end component;
	
	component Bdc7Seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	component Comparator port
	(
		cout	: in std_logic;
		v		: in std_logic_vector(3 downto 0);
		z		: out std_logic
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
		v		: in std_logic_vector(3 downto 0);
		z		: out std_logic_vector(3 downto 0)
	);
	end component;
	
	component CircuitB port
	(
		c		: in std_logic;
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal a 		: std_logic_vector(3 downto 0);
	signal b 		: std_logic_vector(3 downto 0);
	signal cin 		: std_logic;
	signal cout 	: std_logic_vector(3 downto 0);
	signal s 		: std_logic_vector(3 downto 0);
	
	signal c_a 		: std_logic_vector(3 downto 0);
	signal z			: std_logic;
	signal m			: std_logic_vector(3 downto 0);
	signal a_err	: std_logic;
	signal b_err	: std_logic;
begin
	a <= SW(7 downto 4);
	b <= SW(3 downto 0);
	cin <= SW(8);

	LEDR(7 downto 4) <= a;
	LEDR(3 downto 0) <= b;	
	LEDR(8) <= cin;
	LEDG(3 downto 0) <= s;
	LEDG(4) <= cout(3);
	LEDG(7) <= a_err or b_err;
	
	FA0 : FullAdder port map
	( a(0), b(0), cin, cout(0), s(0) );
	
	FA1 : FullAdder port map
	( a(1), b(1), cout(0), cout(1), s(1) );
	
	FA2 : FullAdder port map
	( a(2), b(2), cout(1), cout(2), s(2) );
	
	FA3 : FullAdder port map
	( a(3), b(3), cout(2), cout(3), s(3) );
	
	COMPS : Comparator port map
	( cout(3), s, z );
	
	COMPA : Comparator port map
	( '0', a, a_err );
	
	COMPB : Comparator port map
	( '0', b, b_err );
	
	MUX : Mux4bit2to1 port map
	( s, c_a, z, m );
	
	CA : CircuitA port map
	( s, c_a );
	
	DISP3 : Bdc7Seg port map
	( a, HEX3 );
	
	DISP2 : Bdc7Seg port map
	( b, HEX2 );
	
	DISP1 : CircuitB port map
	( z, HEX1 );
	
	DISP0 : Bdc7seg port map
	( m, HEX0 );
end Behavioral;