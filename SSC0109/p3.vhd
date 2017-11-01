library ieee;
use ieee.std_logic_1164.all;

entity main is
	port(a1, b1, a2, b2, a3, b3, a4, b4, carry_in1: in std_logic;
			soma1, soma2, soma3, soma4, carry_out: out std_logic);
end main;

architecture arch_main of main is
	signal s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, carry_out1, carry_out2, carry_out3: std_logic;
	signal carry_in2, carry_in3, carry_in4: std_logic;
begin
	-- BEGIN FIRST SUM
	s1 <= a1 xor b1; 
	s2 <= carry_in1 and b1;
	s3 <= carry_in1 and a1;
	s4 <= a1 and b1;
	soma1 <= s1 xor carry_in1;
	carry_out1 <= s2 or s3 or s4;
	-- END FIRST SUM
	
	-- BEGIN SECOND SUM
	carry_in2 <= carry_out1;
	s5 <= a2 xor b2; 
	s6 <= carry_in2 and b2;
	s7 <= carry_in2 and a2;
	s8 <= a2 and b2;
	soma2 <= s5 xor carry_in2;
	carry_out2 <= s6 or s7 or s8;
	-- END SECOND SUM
	
	-- BEGIN THIRD SUM
	carry_in3 <= carry_out2;
	s9 <= a3 xor b3; 
	s10 <= carry_in3 and b3;
	s11 <= carry_in3 and a3;
	s12 <= a3 and b3;
	soma3 <= s9 xor carry_in3;
	carry_out3 <= s10 or s11 or s12;
	-- END THIRD SUM
	
	-- BEGIN FOURTH SUM
	carry_in4 <= carry_out3;
	s13 <= a4 xor b4; 
	s14 <= carry_in4 and b4;
	s15 <= carry_in4 and a4;
	s16 <= a4 and b4;
	soma4 <= s13 xor carry_in4;
	carry_out <= s14 or s15 or s16;
	-- END FOURTH SUM
end arch_main;

