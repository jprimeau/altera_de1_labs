-- DESCRIPTION: Lab 2 Part 5
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Lab2Part5 is
	port
	(
		SW		:	in std_logic_vector(8 downto 0);
		LEDR	:	out std_logic_vector(8 downto 0);
		LEDG	:	out std_logic_vector(4 downto 0);
		HEX0	:	out std_logic_vector(0 to 6);
		HEX1	:	out std_logic_vector(0 to 6);
		HEX2	:	out std_logic_vector(0 to 6);
		HEX3	:	out std_logic_vector(0 to 6)
	);
end Lab2Part5;

architecture Behavioral of Lab2Part5 is

	component Bdc7Seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
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
	signal t0 		: std_logic_vector(4 downto 0);
	signal c0	 	: std_logic;
	signal z0		: std_logic_vector(3 downto 0);
	signal s0 		: std_logic_vector(3 downto 0);
	signal st	 	: std_logic_vector(4 downto 0);
	signal s1 		: std_logic;
begin
	a <= SW(7 downto 4);
	b <= SW(3 downto 0);
	c0 <= SW(8);

	LEDR(7 downto 4) <= a;
	LEDR(3 downto 0) <= b;	
	LEDR(8) <= c0;
	LEDG(3 downto 0) <= s0;
	LEDG(4) <= s1;
	
	process (a, b, c0)
	begin
		t0 <= ('0' & a) + ('0' & b) + c0;
		if t0 > 9 then
			z0 <= "1010";
			s1 <= '1';
		else
			z0 <= "0000";
			s1 <= '0';
		end if;
		st <= t0 - z0;
		s0 <= st(3 downto 0);
	end process;
	
	DISP3 : Bdc7Seg port map
	( a, HEX3 );
	
	DISP2 : Bdc7Seg port map
	( b, HEX2 );
	
	DISP1 : CircuitB port map
	( s1, HEX1 );
	
	DISP0 : Bdc7seg port map
	( s0, HEX0 );
end Behavioral;