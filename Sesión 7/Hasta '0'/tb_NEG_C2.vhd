ENTITY tb_NEG_C2 IS
END tb_NEG_C2;

ARCHITECTURE estructural OF tb_NEG_C2 IS
	COMPONENT NEG_C2 IS
		GENERIC (n: INTEGER:=16);
		PORT(x, e: IN BIT_VECTOR(n-1 downto 0);
		     r: OUT BIT_VECTOR(n-1 downto 0);
		     des: OUT BIT);
	END COMPONENT;

	FOR componente: NEG_C2 USE ENTITY WORK.NEG_C2(estructural);
	
	CONSTANT TAMANO_PALABRA: integer := 16;
	
	SIGNAL a, b, r: BIT_VECTOR(TAMANO_PALABRA-1 downto 0);
	SIGNAL marca, d: BIT;
	
BEGIN
	
	componente: NEG_C2 GENERIC MAP (TAMANO_PALABRA) PORT MAP (A, B, R, D);
	
	PROCESS
	BEGIN
		
		A<=(others=>'0');
		B<=(others=>'0');
		marca<='0';
		WAIT FOR 10 ns;
		A<=(others=>'1');
		WAIT FOR 10 ns;
		B<=(others=>'1');
		marca<='1';
		WAIT UNTIL R(TAMANO_PALABRA-1)=NOT A(TAMANO_PALABRA-1);
		marca<='0';
		WAIT for 10 ns;
		A<=(others=>'0');
		A(TAMANO_PALABRA-1)<='1';
		marca<='1';
		WAIT UNTIL R(TAMANO_PALABRA-1)=A(TAMANO_PALABRA-1) AND D='1';
		marca<='0';
		WAIT for 10 ns;
		WAIT;

	END PROCESS;
END estructural;
