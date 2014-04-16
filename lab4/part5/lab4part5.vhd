-- DESCRIPTION: Lab 4 Part 5
-- AUTHOR: Jonathan Primeau

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Lab4Part5 is
	port
	(
		CLOCK_50	: in std_logic;
		HEX0		: out std_logic_vector(0 to 6);
		HEX1		: out std_logic_vector(0 to 6);
		HEX2		: out std_logic_vector(0 to 6);
		HEX3		: out std_logic_vector(0 to 6)
	);
end Lab4Part5;

architecture Behavioral of Lab4Part5 is
	component Mux2bit4to1 port
	(
		s		: in std_logic_vector(1 downto 0);
		u		: in std_logic_vector(0 to 6);
		v		: in std_logic_vector(0 to 6);
		w		: in std_logic_vector(0 to 6);
		x		: in std_logic_vector(0 to 6);
		m		: out std_logic_vector(0 to 6)
	);
	end component;
	
	component Counter 
	generic ( n : integer := 8 );
	port
	(		
		clk	: in std_logic;
		t		: in std_logic;
		clr	: in std_logic;
		q		: inout std_logic_vector(n-1 downto 0)
	);
	end component;
	
	signal q_clk : std_logic_vector(25 downto 0);
	signal clr_clk : std_logic;
	signal q_disp : std_logic_vector(1 downto 0);
	signal clr_disp : std_logic;
begin

	clk_counter : process (CLOCK_50, q_clk)
	begin
		if CLOCK_50'event and CLOCK_50 = '0' then
			if q_clk >= 50000000 then
				clr_clk <= '0';
			else
				clr_clk <= '1';
			end if;
		end if;
	end process;
	
	dig_counter : process (clr_clk, q_disp)
	begin
		if clr_clk'event and clr_clk = '0' then
			if q_disp >= 3 then
				clr_disp <= '0';
			else
				clr_disp <= '1';
			end if;
		end if;
	end process;

	c26bit : Counter 
		generic map ( 26 )
		port map ( CLOCK_50, '1', clr_clk, q_clk );
	c2bit : Counter
		generic map ( 2 )
		port map ( clr_clk, '1', clr_disp, q_disp );
	
	MUX0 : Mux2bit4to1 port map
	(
		q_disp,
		"1001111", -- 1
		"1111111", -- 
		"1000010", -- d
		"0110000", -- E
		HEX0
	);
	
	MUX1 : Mux2bit4to1 port map
	(
		q_disp,
		"0110000", -- E
		"1001111", -- 1
		"1111111", -- 
		"1000010", -- d
		HEX1
	);
	
	MUX2 : Mux2bit4to1 port map
	(
		q_disp,
		"1000010", -- d
		"0110000", -- E
		"1001111", -- 1
		"1111111", -- 
		HEX2
	);
	
	MUX3 : Mux2bit4to1 port map
	(
		q_disp,
		"1111111", -- 
		"1000010", -- d
		"0110000", -- E
		"1001111", -- 1
		HEX3
	);

end Behavioral;