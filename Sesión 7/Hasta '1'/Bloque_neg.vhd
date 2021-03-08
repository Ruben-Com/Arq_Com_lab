ENTITY Bloque_neg IS
	PORT(x, e, c_in: IN BIT; r, c_out: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF Bloque_neg IS

COMPONENT and2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT or2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT xor2 IS
	GENERIC (retardo: TIME:= 3 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT not2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END COMPONENT;

SIGNAL e_and_c, x_negada: BIT;

BEGIN
	
	neg_x: not2 PORT MAP(x, x_negada);
	c_and_e: and2 PORT MAP(e, c_in, e_and_c);
	salida: xor2 PORT MAP(x, e_and_c, r);
	siguiente_c: and2 PORT MAP(x_negada, c_in, c_out);

END estructural;
