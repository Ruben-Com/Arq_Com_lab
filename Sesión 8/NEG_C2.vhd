ENTITY NEG_C2 IS
	GENERIC(n:INTEGER :=4);
	PORT(x: IN BIT_VECTOR(n-1 DOWNTO 0); e: IN BIT; r: OUT BIT_VECTOR(n-1 DOWNTO 0); des: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF NEG_C2 IS

COMPONENT Bloque_neg IS
	PORT(x, e, c_in: IN BIT; r, c_out: OUT BIT);
END COMPONENT;
COMPONENT not2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT and2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;

FOR ALL: Bloque_neg USE ENTITY WORK.Bloque_neg(estructural);
FOR ALL: and2 USE ENTITY WORK.and2(comportamiento);
FOR ALL: not2 USE ENTITY WORK.not2(comportamiento);

SIGNAL c: BIT_VECTOR(n-1 DOWNTO 0);
SIGNAL d: BIT;

BEGIN

	G: FOR i IN 0 TO n-1 GENERATE
		primero: IF i = 0 GENERATE
			primer_bit: Bloque_neg PORT MAP(x(i), e, x(i), r(i), c(i));
		END GENERATE primero;
		intermedios: IF i > 0 GENERATE
			siguientes: Bloque_neg PORT MAP(x(i), e, c(i-1), r(i), c(i));
		END GENERATE intermedios;
	END GENERATE G;
	desbor: not2 PORT MAP(c(n-2), d);
	desbordamiento: and2 PORT MAP(x(n-1), d, des);
	

END estructural;
