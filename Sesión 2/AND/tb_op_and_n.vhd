ENTITY tb_op_and_n IS
END tb_op_and_n;

ARCHITECTURE estructural OF tb_op_and_n IS
	COMPONENT op_and_n
		GENERIC (n: INTEGER:=8);
		PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); r: OUT BIT_VECTOR(n-1 DOWNTO 0));
	END COMPONENT;
	
	FOR operador: op_and_n USE ENTITY WORK.op_and_n(estructural);
	
	CONSTANT TAMANO_PALABRA: integer := 2;
	
	SIGNAL A, B, C: BIT_VECTOR(TAMANO_PALABRA-1 DOWNTO 0);

BEGIN
	operador: op_and_n GENERIC MAP (TAMANO_PALABRA) PORT MAP(A, B, C);
	
	PROCESS
	VARIABLE valor, limite: INTEGER;
	BEGIN
		limite:= 2**TAMANO_PALABRA-1;
		
		FOR i IN 0 TO limite LOOP
			valor:=i;
			
			FOR k IN A'REVERSE_RANGE LOOP
				A(k)<=BIT'VAL(valor REM 2);
				valor:=valor/2;
			END LOOP;
			
			FOR j IN 0 TO limite LOOP
				valor:=j;
				
				FOR k IN B'REVERSE_RANGE LOOP
					B(k)<=BIT'VAL(valor REM 2);
					valor:=valor/2;
				END LOOP;
				WAIT FOR 2 ns;
				
			END LOOP;
		END LOOP;
		
		WAIT FOR 2 ns;
		WAIT;
	END PROCESS;
END estructural;
