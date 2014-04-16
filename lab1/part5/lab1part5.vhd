-- DESCRIPTION: Lab 1 Part 5
-- AUTHOR: Jonathan Primeau
--
--  sw9 sw8 | 2 1 0 | s
-- ---------|-------|---
--   0   0  | d E 1 | u
--   0   1  | e 1 d | v
--   1   0  | 1 d E | w

library ieee;
use ieee.std_logic_1164.all;

entity Lab1Part5 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6);
		HEX2	: out std_logic_vector(0 to 6)
	);
end Lab1Part5;

architecture Behavioral of Lab1Part5 is
	component Mux2bit3to1 port
	(
		s		: in std_logic_vector(1 downto 0);
		u		: in std_logic_vector(1 downto 0);
		v		: in std_logic_vector(1 downto 0);
		w		: in std_logic_vector(1 downto 0);
		m		: out std_logic_vector(1 downto 0)
	);
	end component;
	
	component Char7seg port
	(
		c		: in std_logic_vector(1 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal m0	: std_logic_vector(1 downto 0);
	signal m1	: std_logic_vector(1 downto 0);
	signal m2	: std_logic_vector(1 downto 0);
begin

	MUX0 : Mux2bit3to1 port map
	(
		s => SW(9 downto 8),
		u => SW(1 downto 0),
		v => SW(5 downto 4),
		w => SW(3 downto 2),
		m => m0
	);
	
	DISP0 : Char7seg port map
	(
		c => m0,
		disp => HEX0
	);
	
	MUX1 : Mux2bit3to1 port map
	(
		s => SW(9 downto 8),
		u => SW(3 downto 2),
		v => SW(1 downto 0),
		w => SW(5 downto 4),
		m => m1
	);
	
	DISP1 : Char7seg port map
	(
		c => m1,
		disp => HEX1
	);
	
	MUX2 : Mux2bit3to1 port map
	(
		s => SW(9 downto 8),
		u => SW(5 downto 4),
		v => SW(3 downto 2),
		w => SW(1 downto 0),
		m => m2
	);
	
	DISP2 : Char7seg port map
	(
		c => m2,
		disp => HEX2
	);

end Behavioral;