-- DESCRIPTION: Lab 2 Part 3 - 4-bit full adder
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab2Part3 is
	port
	(
		SW		:	in std_logic_vector(9 downto 0);
		LEDR	:	out std_logic_vector(9 downto 0);
		LEDG	:	out std_logic_vector(7 downto 0)
	);
end Lab2Part3;

architecture Behavioral of Lab2Part3 is
	component FullAdder 	port
	(
		a	: in std_logic;
		b	: in std_logic;
		ci	: in std_logic;
		co : out std_logic;
		s	: out std_logic
	);
	end component;
	
	signal a : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0);
	signal cin : std_logic;
	signal cout : std_logic_vector(3 downto 0);
	signal s : std_logic_vector(3 downto 0);
begin
	a <= SW(7 downto 4);
	b <= SW(3 downto 0);
	cin <= SW(9);

	LEDR(7 downto 4) <= a;
	LEDR(3 downto 0) <= b;	
	LEDR(9) <= cin;
	LEDG(3 downto 0) <= s;
	LEDG(7) <= cout(3);
	
	FA0 : FullAdder port map
	( a(0), b(0), cin, cout(0), s(0) );
	
	FA1 : FullAdder port map
	( a(1), b(1), cout(0), cout(1), s(1) );
	
	FA2 : FullAdder port map
	( a(2), b(2), cout(1), cout(2), s(2) );
	
	FA3 : FullAdder port map
	( a(3), b(3), cout(2), cout(3), s(3) );
end Behavioral;