library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity subitrator is
	port ( x, y, bin : in bit;
		s, bout : out bit );
end subitrator;

architecture behave1 of subitrator is
begin
	s <= x xor y xor bin;
	bout <= ((not x) and y) or ((not x) and bin) or (y and bin);
end behave1;

entity component1 is
	port ( a, b : in bit_vector(3 downto 0);
		bin : in bit;
		bout : out bit;
		s : out bit_vector(3 downto 0));
end component1;

architecture behave2 of component1 is

component subitrator
	port(x, y, bin : in bit;
		s, bout : out bit);
end component;

signal v: bit_vector(3 downto 1);

begin
	a0: subitrator port map(a(0), b(0),  bin, s(0), v(1));
	a1: subitrator port map(a(1), b(1), v(1), s(1), v(2));
	a2: subitrator port map(a(2), b(2), v(2), s(2), v(3));
	a3: subitrator port map(a(3), b(3), v(3), s(3), bout);
end behave2;
