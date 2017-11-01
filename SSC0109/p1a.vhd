Library IEEE;
Use IEEE.std_logic_1164.all;


entity logic is
port (A, B: in std_logic;
		LED1,LED2,LED3,LED4,LED5,LED6,LED7: out std_logic);
end logic;
Architecture arch1 of logic is
begin

LED1 <= A and B;
LED2 <= A or B;
LED3 <= not A;
LED4 <= not B;
LED5 <= A nand B;
LED6 <= A nor B;
LED7 <= A xor B;

end arch1;
