ENTITY NEG_C2 IS
	GENERIC(n:INTEGER :=16);
	PORT(x, e: IN BIT_VECTOR(n-1 DOWNTO 0); r: OUT BIT_VECTOR(n-1 DOWNTO 0); des: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF NEG_C2 IS

COMPONENT Bloque_neg IS
	PORT(x, e, c_in: IN BIT; r, c_out: OUT BIT);
END COMPONENT;
COMPONENT not2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END COMPONENT;
COMPONENT or2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END COMPONENT;
SIGNAL c, cal_d: BIT_VECTOR(n-1 DOWNTO 0);
SIGNAL d, de, x_neg_0: BIT;

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
	B: FOR i IN 1 TO n-2 GENERATE
		primer: IF i = 1 GENERATE
			primeros_bit: or2 PORT MAP(x(i), x(i-1), cal_d(i));
		END GENERATE primer;
		intermedio: IF i > 1 AND i < n-2 GENERATE
			siguiente: or2 PORT MAP(x(i), cal_d(i-1), cal_d(i));
		END GENERATE intermedio;
		final: IF i = n-2 GENERATE
			ultimo: or2 PORT MAP(x(i), cal_d(i-1), cal_d(i));
		END GENERATE final;
	END GENERATE B;
	d_negada: not2 PORT MAP(x(n-1), d);
	desborde:  or2 PORT MAP(d, cal_d(n-2), de);
	desbor:  not2 PORT MAP(de, des);
	

END estructural;
