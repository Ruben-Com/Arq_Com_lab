ENTITY tb_NEG_C2 IS
END tb_NEG_C2;

ARCHITECTURE estructural OF tb_NEG_C2 IS
	COMPONENT NEG_C2 IS
		GENERIC (n: INTEGER:=4);
		PORT(x, e: IN BIT_VECTOR(n-1 downto 0);
		     r: OUT BIT_VECTOR(n-1 downto 0);
		     des: OUT BIT);
	END COMPONENT;

	FOR componente: NEG_C2 USE ENTITY WORK.NEG_C2(estructural);
	
	CONSTANT TAMANO_PALABRA: integer := 4;
	
	SIGNAL a, b, r: BIT_VECTOR(TAMANO_PALABRA-1 downto 0);
	SIGNAL marca, d: BIT;
	
BEGIN
	
	componente: NEG_C2 GENERIC MAP (TAMANO_PALABRA) PORT MAP (A, B, R, D);
	
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
				WAIT FOR 20 ns;
			END LOOP;
		END LOOP;
	WAIT;
	END PROCESS;
END estructural;
