-- DESCRIPTION: Lab 4 Part 3
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;

entity Lab4Part3 is
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		q		: out std_logic_vector(15 downto 0);
		clr	: in std_logic
	);
end Lab4Part3;

architecture Behavioral of Lab4Part3 is
	component MyLPMCounter port
	(
		clock		: in std_logic;
		cnt_en	: in std_logic;
		sclr		: in std_logic;
		q			: out std_logic_vector(15 downto 0)
	);
	end component;
	
begin
	counter : MyLPMCounter port map ( clk, t, clr, q );
end Behavioral;