ENTITY RCA IS
	GENERIC (c: INTEGER:=2);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); c_in: IN BIT; sal, c_out: OUT BIT_VECTOR(c-1 downto 0));
END RCA;

ARCHITECTURE estructural OF RCA IS
	COMPONENT sumador IS
		PORT (x, y, c_in: IN BIT; s, c_out:OUT BIT);
	END COMPONENT;
	
	FOR ALL: sumador USE ENTITY WORK.sumador(estructural);
	
	SIGNAL c_out_aux: BIT_VECTOR(c-1 DOWNTO 0);
BEGIN
	G: FOR i IN 0 TO c-1 GENERATE
		lsb: IF i = 0 GENERATE
			primero: sumador PORT MAP(x_in(0), y_in(0), c_in, sal(0), c_out_aux(0));
		END GENERATE lsb;
		
		siguientes: IF i > 0 AND i < c-1 GENERATE
			intermedios: sumador PORT MAP(x_in(i), y_in(i), c_out_aux(i-1), sal(i), c_out_aux(i));
		END GENERATE siguientes;
		
		msb: IF i = c-1 GENERATE
			ultimos: sumador PORT MAP(x_in(i), y_in(i), c_out_aux(i-1), sal(i), c_out_aux(i));
		END GENERATE msb;
	END GENERATE G;
	c_out<=c_out_aux;
END estructural;
