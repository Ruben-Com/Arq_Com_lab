ENTITY RCA IS
	GENERIC (n: INTEGER:=8);
	PORT(x_in, y_in: IN BIT_VECTOR(n-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(n-1 downto 0); c_out: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF RCA IS
	COMPONENT sumador
		PORT (x, y, c_in: IN BIT; s, c_out:OUT BIT);
	END COMPONENT;
	COMPONENT and3
		PORT (e1, e2, e3: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT or4
		PORT (e1, e2, e3, e4: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	SIGNAL c_aux: BIT_VECTOR(n-1 downto 0);
BEGIN
	G: FOR i IN 0 TO n-1 GENERATE
		lsb: IF i = 0 GENERATE
			primeros: sumador PORT MAP(x_in(0), y_in(0), c_in, sal(0), c_aux(0));
		END GENERATE lsb;
		
		siguientes: IF i > 0 AND i < n-1 GENERATE
			intermedios: sumador PORT MAP(x_in(i), y_in(i), c_aux(i-1), sal(i), c_aux(i));
		END GENERATE siguientes;
		
		msb: IF i = n-1 GENERATE
			primeros: sumador PORT MAP(x_in(i), y_in(i), c_aux(i-1), sal(i), c_out);
		END GENERATE msb;
	END GENERATE G;
END estructural;
