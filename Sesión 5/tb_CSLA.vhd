ENTITY tb_CSLA IS
END tb_CSLA;

ARCHITECTURE estructural OF tb_CSLA IS
	COMPONENT CSLA
		GENERIC (n: INTEGER:=4; k: INTEGER:=2);
		PORT(x_in, y_in: IN BIT_VECTOR(n-1 downto 0);
		     c_in: IN BIT;
		     sal: OUT BIT_VECTOR(n-1 downto 0);
		     c_out: OUT BIT);
	END COMPONENT;

	FOR componente: CSLA USE ENTITY WORK.CSLA(estructural);
	
	CONSTANT TAMANO_PALABRA: INTEGER := 4;
	CONSTANT TAMANO_PALABRA_RCA: INTEGER := 2;
	
	SIGNAL A, B, R: BIT_VECTOR(TAMANO_PALABRA-1 downto 0);
	SIGNAL cin, cout, marca: BIT;
	
BEGIN
	
	componente: CSLA GENERIC MAP (TAMANO_PALABRA) PORT MAP (A, B, Cin, R, Cout);
	
	PROCESS
	VARIABLE valor, limite, cuenta_carry, sol: INTEGER;
	BEGIN
		
		limite:= 2**TAMANO_PALABRA-1;
		
		FOR i IN 0 TO limite LOOP
			valor:=i;
			
			FOR k IN B'REVERSE_RANGE LOOP
				A(k)<=BIT'VAL(valor REM 2);--cambiamos A
				valor:=valor/2;
			END LOOP;
			
			FOR j IN 0 TO limite LOOP
				valor:=j;
				
				FOR k IN B'REVERSE_RANGE LOOP
					B(k)<=BIT'VAL(valor REM 2);--cambiamos B
					valor:=valor/2;
				END LOOP;
				FOR carry IN 0 TO 1 LOOP
					cin<=BIT'VAL(carry REM 2);
					WAIT FOR 20 ns;
				END LOOP;
			END LOOP;
		END LOOP;
	WAIT;
	END PROCESS;
END estructural;
