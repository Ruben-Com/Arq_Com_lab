ENTITY CSK IS
	GENERIC (n: INTEGER:=16);
	PORT(x_in, y_in: IN BIT_VECTOR(n-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(n-1 downto 0); c_out: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF CSK IS

COMPONENT Bloque_CSK
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(c-1 downto 0); c_out: OUT BIT);
END COMPONENT;
COMPONENT RCA
	GENERIC (c: INTEGER:=4);
	PORT(x_in, y_in: IN BIT_VECTOR(c-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(c-1 downto 0); c_out: OUT BIT);
END COMPONENT;

CONSTANT c: integer:=4;
SIGNAL c_aux: BIT_VECTOR ((n/4)-1 DOWNTO 0);

BEGIN

	primeros_bits: RCA PORT MAP(x_in(3 DOWNTO 0), y_in(3 DOWNTO 0), c_in, sal(3 DOWNTO 0), c_aux(0));
	G: FOR i IN 1 TO (n/4)-1 GENERATE
		siguientes: IF i < (n/4)-1 GENERATE
			intermedios: Bloque_CSK PORT MAP(x_in((i+1)*c-1 DOWNTO i*c), y_in((i+1)*c-1 DOWNTO i*c), c_aux(i-1), sal((i+1)*c-1 DOWNTO i*c), c_aux(i));
		END GENERATE siguientes;
		msb: IF i = c-1 GENERATE
			ultimos: Bloque_CSK PORT MAP(x_in((i+1)*c-1 DOWNTO i*c), y_in((i+1)*c-1 DOWNTO i*c), c_aux(i-1), sal((i+1)*c-1 DOWNTO i*c), c_out);
			END GENERATE msb;
	END GENERATE G;
END estructural;
