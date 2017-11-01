Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult is
	port(CLK,RESET,INICIAR,ENTRA_MULTIPLICANDO,ENTRA_MULTIPLICADOR: in std_logic;
			MULT_IN: in std_logic_vector(3 downto 0);
			MULT_OUT: out std_logic_vector(7 downto 0) );
end mult;

architecture comportamento_mult4 of mult is
	type tipo_estado is(PARADO, MUL0, MUL1);
	signal estado, prox_estado : tipo_estado;
	signal A,B,Q: std_logic_vector(3 downto 0);
	signal P: std_logic_vector(1 downto 0);
	signal C,ZERO: std_logic;
	
begin

		ZERO<=P(1) nor P(0);
		MULT_OUT<= A & Q;
		registra_estado: process(CLK,RESET)
		begin
		if(RESET ='1')then
			estado<= PARADO;
			elsif(CLK'event and CLK = '1') then
			estado <= prox_estado;
		end if;
	end process;
	
func_prox_estado: process(INICIAR, ZERO, estado)
begin
	case estado is
		when PARADO =>
			if INICIAR = '1' then
				prox_estado<=MUL0;
			else 
				prox_estado<= MUL1;
			end if;
		when MUL0 =>
			prox_estado <= MUL1;
		when MUL1 =>
			if ZERO = '1' then
				prox_estado<= PARADO;
			else 
				prox_estado<=MUL0;
			end if;
	end case;
end process;


func_fluxo_dados: process(CLK)
variable CA:std_logic_vector(4 downto 0);
begin
	if(CLK'event and CLK = '1') then
		if ENTRA_MULTIPLICANDO = '1' then
			B<= MULT_IN;
		end if;
		case estado is
			when PARADO =>
			if INICIAR = '1' then
				C<='0';
				A<= "0000";
				P<= "11";
			end if;
			when MUL0=>
			if Q(0) = '1' then
				CA:=('0'&A) +('0'&B);
			else 
				CA:=C&A;
			end if;
			C<=CA(4);
			A<=CA(3 downto 0);
			when MUL1=>
			C<='0';
			A<=CA(3 downto 0);
			Q<=A(0)&Q(3 downto 1);
			P <= P - "01";
			end case;
		end if;
	end process;
end comportamento_mult4;	
			