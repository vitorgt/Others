library IEEE;
use IEEE.std_logic_1164.all;
use Ieee.numeric_std.all;

package ULA_pkg is --functions declaration
	function divide (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function soma(a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function subtracao (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
	function deslocador(x: std_logic_vector(7 downto 0)) return std_logic_vector;
	function somador8bits (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0))return std_logic_vector;
	function Multiplicador(a:std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector;
end ULA_pkg; --end of package

package body ULA_pkg is --start of package body

------------------------------------------------------------DIVISAO------------------------------------------------------------

function divide (a:std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
	variable a1: std_logic_vector(7 downto 0):=a;
	variable b1: std_logic_vector(7 downto 0):=b;
	variable p1: std_logic_vector(7 downto 0):= (others => '0');
	variable i : integer := 0;
	begin
		for i in 0 to 7 loop
			p1(7 downto 0):= p1(7 downto 0);
			p1(0) := a1(7);
			a1(7 downto 0):= a1(7 downto 0);
			p1:= subtracao(p1,b1);
			if(p1(7)='1') then
				a1(0) :='0';
				p1 := soma(p1,b1);
			else
				a1(0) := '1';
			end if;
		end loop;
		return a1;
	end divide;

-------------------------------------------------------------SOMA--------------------------------------------------------------

function soma (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
	variable vaium: std_logic;
	variable soma: std_logic_vector(7 downto 0);
	begin
		vaium:='0';
		for i in 0 to 3 loop
			soma(i):=a(i)xor b(i)xor vaium;
			vaium:=(a(i)and b(i)) or (b(i) and vaium) or (vaium and a(i));
		end loop;
		return soma;
	end soma;

-----------------------------------------------------------SUBTRACAO-----------------------------------------------------------

function subtracao (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
	variable ve: std_logic;
	variable subtrai: std_logic_vector(7 downto 0);
	begin
		ve:='0';
		for i in 0 to 3 loop
			subtrai(i) := a(i) xor b(i) xor ve;
			ve := ((not a(i)) and b(i)) or ((not a(i)) and ve) or (b(i) and ve);
		end loop;
		return subtrai;
	end subtracao;

---------------------------------------------------------MULTIPLICACAO---------------------------------------------------------

--função deslocamento de 1 bit para a esquerda, zerando o bit menos significativo

function deslocador(x: std_logic_vector(7 downto 0)) return std_logic_vector is
	variable y: std_logic_vector(7 downto 0);
	begin
		for i in 7 downto 1 loop
			y(i):=x(i-1);
		end loop;
		y(0):= '0';
		return y;
	end deslocador;

--somador de 8 bits

function somador8bits (a: std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0))return std_logic_vector is
	variable vaium: std_logic;
	variable soma: std_logic_vector(7 downto 0);
	begin
		vaium:='0';
		for i in 0 to 7 loop
			soma(i):=a(i)xor b(i)xor vaium;
			vaium:=(a(i)and b(i)) or (b(i) and vaium) or (vaium and a(i));
		end loop;
		return soma;
	end somador8bits;

function Multiplicador(a:std_logic_vector(7 downto 0); b: std_logic_vector(7 downto 0)) return std_logic_vector is
	variable aux1: std_logic_vector(7 downto 0);
	variable aux2: std_logic_vector(7 downto 0);
	variable vaium: std_logic;
	begin
		--inicializações
		aux1:="00000000";
		aux2:=a;
		vaium:='0';
		--implementação do algoritmo
		for i in 0 to 7 loop
			aux1:=deslocador(aux1);
			vaium:=aux2(3);
			if vaium ='1' then
				aux1:=somador8bits(aux1,b);
			end if;
			aux2:=deslocador(aux2);
		end loop;
		return aux1;
	end multiplicador;

end ULA_pkg;

--------------------------------------------------------------MUX--------------------------------------------------------------

library IEEE;
library work;
use IEEE.std_logic_1164.all;
use Ieee.numeric_std.all;
use work.ula_pkg.all;

entity ULA is
	port (sel0, sel1:in std_logic;
	a,b: in std_logic_vector(7 downto 0);
	c: out std_logic_vector(7 downto 0) );
end ULA;

architecture ulaArch of ULA is
begin
	process (a,b,Sel0,Sel1, a, b) is
	begin
		if (Sel0 ='0' and Sel1 = '0') then
			c<= soma(a, b);
		elsif (Sel0 ='1' and Sel1 = '0') then
			c <= subtracao(a, b);
		elsif (Sel0 ='0' and Sel1 = '1') then
			c <= multiplicador(a, b);
		elsif (sel0 ='1' and sel1 = '1') then
			c <= divide(a, b);
		end if;
	end process;
end ulaArch;