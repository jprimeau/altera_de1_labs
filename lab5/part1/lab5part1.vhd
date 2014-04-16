-- DESCRIPTION: Lab 5 Part 1
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab5Part1 is
	port
	(
		KEY	: in std_logic_vector(1 downto 0);
		LEDR	: out std_logic_vector(7 downto 0)
	);
end Lab5Part1;

architecture Behavioral of Lab5Part1 is
	component Counter
		generic
		(
			n : integer := 4;
			k : integer := 8
		);
		port
		(
			clk		: in std_logic;
			rst		: in std_logic;
			q			: out std_logic_vector(n-1 downto 0)
		);
	end component;
begin

	c8bit : Counter 
		generic map ( n => 8, k => 4 )
		port map ( KEY(1), KEY(0), LEDR );

end Behavioral;