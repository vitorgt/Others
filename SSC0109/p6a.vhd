library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package teste_pkg is
type t1 is --a data type(totally 32 bits contains 3 differente fields)
	record
		a: std_logic_vector(11 downto 0);
		b: std_logic_vector(15 downto 0);
		c: std_logic_vector(3 downto 0);
	end record;

--function declaration

function add (a2: t1; b2:t1) return t1;
end teste_pkg; -- end of package
package body teste_pkg is -- start of package body
--definition of function
function add (a2:t1; b2:t1) return t1 is
variable sum: t1;
begin -- Just name the fields in order
sum.a:=a2.a xor b2.a;
sum.b:= a2.b xor b2.b;
sum.c := a2.c xor b2.c;
return sum;
end add;
--end function
end teste_pkg; -- end of the package body
use work.teste_pkg.all;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Pacotes is
port(clk: in std_logic ;
		a1: in t1;
		b1: in t1;
		c1: out t1);
end Pacotes;

architecture Behavioral of Pacotes is
begin
process(clk)
begin
if(clk'event and clk='1') then
c1<= add(a1,b1);
end if;
end process;
end Behavioral; 		