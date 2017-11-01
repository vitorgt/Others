library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




package dev_package is

function divide (a: unsigned; b: unsigned) return unsigned;
end dev_package;


package body dev_package is

function divide (a: unsigned; b: unsigned) return unsigned is
variable a1: unsigned(a'length-1 downto 0):=a;
variable b1: unsigned(b'length-1 downto 0):=b;
variable p1: unsigned(b'length-1 downto 0):= (others => '0');
variable i : integer:=0;

begin
for i in 0 to b'length-1 loop
p1(b'length-1 downto 1) := p1(b'length-2 downto 0);
p1(0) := a1(a'length-1);
a1(a'length-1 downto 1) := a1(a'length-2 downto 0);
p1:= p1-b1;
if (p1(b'length-1) = '1') then
a1(0) := '0';
p1 :=  p1+b1;
else
a1(0) := '1';
end if;
end loop;
return a1;
 
end divide;

end dev_package;


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.dev_package.all;

entity divisor is
port (clk : in std_logic;
		a : in unsigned(7 downto 0) := "10011100";
		b : in unsigned(7 downto 0) := "00001010";
		c : out unsigned(7 downto 0) := (others => '0'));
end divisor;

architecture behavioral of divisor is
--signal a1 : unsigned(7 downto 0) := "10011100";
--signal b1 : unsigned(7 downto 0) := "00001010";
--signal c1 : unsigned(7 downto 0) := (others => '0');
begin
process(clk)
begin
if (clk'event and clk='1') then
c <= divide(a, b);
end if;
end process;
end behavioral;











