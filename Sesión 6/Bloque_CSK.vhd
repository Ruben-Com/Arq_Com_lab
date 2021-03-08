ENTITY Bloque_CSK IS
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(c-1 downto 0); c_out: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF Bloque_CSK IS

COMPONENT RCA IS
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(c-1 downto 0); c_out: OUT BIT);
END COMPONENT;
COMPONENT Bloque_P IS
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); P: OUT BIT);
END COMPONENT;
COMPONENT and2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT or2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
SIGNAL P, c_out_aux, and_aux: BIT;
BEGIN

	sumador: RCA PORT MAP(x_in, y_in, c_in, sal, c_out_aux);
	propagacion: Bloque_P PORT MAP(x_in, y_in, P);
	and_cout: and2 PORT MAP(P, c_in, and_aux);
	or_cout: or2 PORT MAP(and_aux, c_out_aux, c_out);

END estructural;
