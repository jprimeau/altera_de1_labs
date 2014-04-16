-- DESCRIPTION: Lab 2 Part 6
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Lab2Part6 is
	port
	(
		SW		: in std_logic_vector(9 downto 0);
		LEDR	: out std_logic_vector(9 downto 0);
		HEX0	: out std_logic_vector(0 to 6);
		HEX1	: out std_logic_vector(0 to 6)
	);
end Lab2Part6;

architecture Behavioral of Lab2Part6 is
	
	component Bdc7seg port
	(
		c		: in std_logic_vector(3 downto 0);
		disp	: out std_logic_vector(0 to 6)
	);
	end component;
	
	signal v	: std_logic_vector(5 downto 0);
	signal d0 : std_logic_vector(5 downto 0);
	signal d1 : std_logic_vector(3 downto 0);
begin
	v <= SW(5 downto 0);
	LEDR(5 downto 0) <= v;
	
	process (v)
	begin
		if v > "111011" then -- 59
			d0 <= v - "111100"; -- 60
			d1 <= "0110"; -- 6
		elsif v > "110001" then -- 49
			d0 <= v - "110010"; -- 50
			d1 <= "0101";
		elsif v > "100111" then -- 39
			d0 <= v - "101000"; -- 40
			d1 <= "0100";
		elsif v > "011101" then -- 29
			d0 <= v - "011110"; -- 30
			d1 <= "0011";
		elsif v > "010011" then -- 19
			d0 <= v - "010100"; -- 20
			d1 <= "0010";
		elsif v > "001001" then -- 09
			d0 <= v - "001010"; -- 10
			d1 <= "0001";
		else
			d0 <= v;
			d1 <= "0000";
		end if;
	end process;
	
	DISP1 : Bdc7seg port map
	( d1, HEX1 );
	
	DISP0 : Bdc7seg port map
	( d0(3 downto 0), HEX0 );
end Behavioral;