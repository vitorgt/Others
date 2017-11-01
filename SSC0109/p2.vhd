Library IEEE;
Use IEEE.std_logic_1164.all;


entity logic is
port (A, B, C, D: in std_logic;
	Y, X: out std_logic);
		
end logic;
Architecture arch1 of logic is
begin

Y <= NOT(C OR D) OR (NOT(A) AND C AND NOT(D)) OR (A AND NOT(B) AND NOT(C)) OR (NOT(A) AND NOT(B) AND C AND D) OR (A AND C AND NOT(D));
X <= (A AND B AND NOT(NOT(C) AND D)) OR (NOT(A) AND B AND D) OR (NOT(B) AND NOT(C) AND NOT (D));

end arch1;
