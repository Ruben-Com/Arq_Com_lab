ENTITY tb_op_not_n IS
END tb_op_not_n;

ARCHITECTURE estructural OF tb_op_not_n IS
	COMPONENT op_not_n
		GENERIC (n: INTEGER:=8);
		PORT (x: IN BIT_VECTOR(n-1 DOWNTO 0); s: OUT BIT_VECTOR(n-1 DOWNTO 0));
	END COMPONENT;
	
	FOR operador: op_not_n USE ENTITY WORK.op_not_n(estructural);
	
	CONSTANT TAMANO_PALABRA: integer := 2;
	
	SIGNAL A, B: BIT_VECTOR(TAMANO_PALABRA-1 DOWNTO 0);

BEGIN
	operador: op_not_n GENERIC MAP (TAMANO_PALABRA) PORT MAP(A, B);
	
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
				WAIT FOR 2 ns;
				
		END LOOP;
		
		WAIT FOR 2 ns;
		WAIT;
	END PROCESS;
END estructural;
