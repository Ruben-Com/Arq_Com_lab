ENTITY NEG_C2 IS
	GENERIC(n:INTEGER :=16);
	PORT(x, e: IN BIT_VECTOR(n-1 DOWNTO 0); r: OUT BIT_VECTOR(n-1 DOWNTO 0); des: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF NEG_C2 IS

COMPONENT Bloque_neg IS
	PORT(x, e, c_in: IN BIT; r, c_out: OUT BIT);
END COMPONENT;
COMPONENT and2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT not2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT or2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
SIGNAL c: BIT_VECTOR(n-1 DOWNTO 0);
SIGNAL x_neg_0: BIT;

BEGIN

	x_neg: not2 PORT MAP(x(0), x_neg_0);
	G: FOR i IN 0 TO n-1 GENERATE
		primero: IF i = 0 GENERATE
			primer_bit: Bloque_neg PORT MAP(x(i), e(i), x_neg_0, r(i), c(i));
		END GENERATE primero;
		intermedios: IF i > 0 GENERATE
			siguientes: Bloque_neg PORT MAP(x(i), e(i), c(i-1), r(i), c(i));
		END GENERATE intermedios;
	END GENERATE G;
	desborde: and2 PORT MAP(x(n-1), c(n-2), des);

END estructural;
