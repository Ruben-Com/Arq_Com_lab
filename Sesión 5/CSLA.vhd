ENTITY CSLA IS
	GENERIC (n: INTEGER:=4; k: INTEGER:=2; TAMANO_PALABRA_RCA: INTEGER:=2);
	PORT(x_in, y_in: IN BIT_VECTOR(n-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(n-1 downto 0); c_out: OUT BIT);
END ENTITY;

ARCHITECTURE estructural OF CSLA IS

COMPONENT CSL
	GENERIC (k: INTEGER:=TAMANO_PALABRA_RCA);
	PORT(x_in, y_in: IN BIT_VECTOR(k-1 downto 0); c_in: IN BIT; sal: OUT BIT_VECTOR(k-1 downto 0); c_out: OUT BIT);
END COMPONENT;
SIGNAL Cout_aux: BIT_VECTOR(3 DOWNTO 0);
BEGIN

	G: FOR i IN 0 TO (n/k)-1 GENERATE
	lsb: IF i = 0 GENERATE
			primero: CSL PORT MAP(x_in((i+1)*k-1 DOWNTO i*k), y_in((i+1)*k-1 DOWNTO i*k), c_in, sal((i+1)*k-1 DOWNTO i*k), Cout_aux(i));
		END GENERATE lsb;
		
		siguientes: IF i > 0 AND i < (n/k)-1 GENERATE
			intermedios: CSL PORT MAP(x_in((i+1)*k-1 DOWNTO i*k), y_in((i+1)*k-1 DOWNTO i*k), Cout_aux(i-1), sal((i+1)*k-1 DOWNTO i*k), Cout_aux(i));
		END GENERATE siguientes;
		
		msb: IF i = (n/k)-1 GENERATE
			ultimos: CSL PORT MAP(x_in((i+1)*k-1 DOWNTO (i*k)), y_in((i+1)*k-1 DOWNTO i*k), Cout_aux(i-1), sal((i+1)*k-1 DOWNTO i*k), c_out);
		END GENERATE msb;
	END GENERATE G;

END estructural;
