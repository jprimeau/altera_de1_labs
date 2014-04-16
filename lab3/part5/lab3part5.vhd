-- DESCRIPTION: Lab 3 Part 5
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab3Part5 is
	port
	(
		SW		: in std_logic_vector(7 downto 0);
		KEY	: in std_logic_vector(1 downto 0);
		LEDR	: out std_logic_vector(7 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6);
		HEX2	: out std_logic_vector(0 to 6);
		HEX3	: out std_logic_vector(0 to 6)
	);
end Lab3Part5;

architecture Behavioral of Lab3Part5 is
	component Hex7Seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	component NegDFlipFlop port
	(
		clk	: in std_logic;
		d		: in std_logic;
		q		: out std_logic;
		clr	: in std_logic
	);
	end component;
	
	signal a : std_logic_vector(7 downto 0);
begin
	LEDR <= SW;

	bit0 : NegDFlipFlop port map ( KEY(1), SW(0), a(0), not KEY(0) );
	bit1 : NegDFlipFlop port map ( KEY(1), SW(1), a(1), not KEY(0) );
	bit2 : NegDFlipFlop port map ( KEY(1), SW(2), a(2), not KEY(0) );
	bit3 : NegDFlipFlop port map ( KEY(1), SW(3), a(3), not KEY(0) );
	bit4 : NegDFlipFlop port map ( KEY(1), SW(4), a(4), not KEY(0) );
	bit5 : NegDFlipFlop port map ( KEY(1), SW(5), a(5), not KEY(0) );
	bit6 : NegDFlipFlop port map ( KEY(1), SW(6), a(6), not KEY(0) );
	bit7 : NegDFlipFlop port map ( KEY(1), SW(7), a(7), not KEY(0) );
	
	disp_a1 : Hex7Seg port map ( a(7 downto 4), HEX3 );
	disp_a0 : Hex7Seg port map ( a(3 downto 0), HEX2 );
	disp_b1 : Hex7Seg port map ( SW(7 downto 4), HEX1 );
	disp_b0 : Hex7Seg port map ( SW(3 downto 0), HEX0 );
end Behavioral;