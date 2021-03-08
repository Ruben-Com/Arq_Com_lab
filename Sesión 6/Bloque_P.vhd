ENTITY Bloque_P IS
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); P: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF Bloque_P IS

COMPONENT and2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;

COMPONENT xor2 IS
	GENERIC (retardo: TIME:= 3 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;

SIGNAL xor_0, xor_1, xor_2, xor_3, and_1, and_2: BIT;

BEGIN

	bit_0: xor2 PORT MAP(x_in(0), y_in(0), xor_0);
	bit_1: xor2 PORT MAP(x_in(1), y_in(1), xor_1);
	bit_2: xor2 PORT MAP(x_in(2), y_in(2), xor_2);
	bit_3: xor2 PORT MAP(x_in(3), y_in(3), xor_3);
	primer_and: and2 PORT MAP(xor_0, xor_1, and_1);
	segundo_and: and2 PORT MAP(xor_2, xor_3, and_2);
	tercer_and: and2 PORT MAP(and_1, and_2, P);

END ARCHITECTURE;	
