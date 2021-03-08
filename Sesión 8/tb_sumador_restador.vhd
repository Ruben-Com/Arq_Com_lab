ENTITY tb_sumador_restador IS
END tb_sumador_restador;

ARCHITECTURE estructural OF tb_sumador_restador IS
	COMPONENT SUMADOR_RESTADOR IS
		GENERIC(c: INTEGER:=4);
		PORT(X, Y: IN BIT_VECTOR(c-1 DOWNTO 0); SUMA_RESTA: IN BIT; R: OUT BIT_VECTOR(c-1 DOWNTO 0); AC, DES, SIG, CERO: OUT BIT);
	END COMPONENT;

	FOR componente: sumador_restador USE ENTITY WORK.sumador_restador(estructural);
	
	CONSTANT TAMANO_PALABRA: INTEGER := 4;
	CONSTANT TAMANO_PALABRA_RCA: INTEGER := 2;
	
	SIGNAL A, B, R: BIT_VECTOR(TAMANO_PALABRA-1 downto 0);
	SIGNAL sum_sub, ac, des, sig, cero: BIT;
	
BEGIN
	
	componente: sumador_restador GENERIC MAP (TAMANO_PALABRA) PORT MAP (A, B, sum_sub, R, ac, des, sig, cero);
	
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
					sum_sub<=BIT'VAL(carry REM 2);
					WAIT FOR 20 ns;
				END LOOP;
			END LOOP;
		END LOOP;
	WAIT;
	END PROCESS;
END estructural;
