Library IEEE;
Use IEEE.std_logic_1164.all;


entity logic is
port (I1,I2,I3,I4,I5,I6,I7,I8,I9,I10,I11,I12,I13,I14: in std_logic;
		LED1,LED2,LED3,LED4,LED5,LED6,LED7: out std_logic);
end logic;
Architecture arch1 of logic is
begin

LED1 <= (((NOT I1) OR I14) XOR (I2 XOR (NOT I8))) XNOR I5;
LED2 <= ((I7 XNOR I3) AND ((I10 XOR I9) OR I13)) OR (I6 AND I4);
LED3 <= (I11 NAND I4) NOR (I1 OR I7);
LED4 <= (((I2 OR I14) XNOR (I3 XOR I6)) AND ((I5 OR I11) NOR (I7 AND I10)));
LED5 <= NOT ((I4 AND I5) NAND (I9 XNOR I3));
LED6 <= I12 NOR (((NOT I12) AND (I13 XOR I14)) OR (I8 OR I9));
LED7 <= (((I5 OR I6) AND (I1 OR I3)) AND (I2 XOR I14)) XNOR (I11 NAND I14);

end arch1;
