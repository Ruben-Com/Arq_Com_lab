ENTITY tb_RCA IS
END tb_RCA;

ARCHITECTURE estructural OF tb_RCA IS
	COMPONENT RCA
		GENERIC (n: INTEGER:=8);
		PORT(x_in, y_in: IN BIT_VECTOR(n-1 downto 0);
		     c_in: IN BIT;
		     sal: OUT BIT_VECTOR(n-1 downto 0);
		     c_out: OUT BIT);
	END COMPONENT;

	FOR componente: RCA USE ENTITY WORK.RCA(estructural);
	
	CONSTANT TAMANO_PALABRA: integer := 2;
	
	SIGNAL a, b, r: BIT_VECTOR(TAMANO_PALABRA-1 downto 0);
	SIGNAL cin, cout, marca: BIT;
	
BEGIN
	
	componente: RCA GENERIC MAP (TAMANO_PALABRA) PORT MAP (A, B, Cin, R, Cout);
	
	PROCESS
	VARIABLE valor, i, j, n: INTEGER;
	BEGIN
		
		valor:=0;
		i:=0;
		j:=0;
		n:=0;
		A<=(others=>'0');
		B<=(others=>'0');
		Cin<='0';
		marca<='0';
		WAIT FOR TAMANO_PALABRA*10 ns;
		A<=(others=>'1');
		Cin<='1';
		WAIT UNTIL Cout='1' AND R(TAMANO_PALABRA-1)='0';
		marca<='1';


		FOR k IN A'RANGE LOOP
			IF A(k)='1' THEN
				i:=i+2**k;
			END IF;
		END LOOP;
		FOR k IN B'RANGE LOOP
			IF B(k)='1' THEN
				j:=j+2**k;
			END IF;
		END LOOP;
		IF Cin='1' THEN
			valor:=valor+1;
			n:=1;
		ELSE
			n:=0;
		END IF;
		FOR k IN R'RANGE LOOP
			IF R(k)='1' THEN
				valor:=valor+2**k;
			END IF;
		END LOOP;
		
		IF Cout='1' THEN
			valor:=valor+2**TAMANO_PALABRA;
		END IF;
		
		ASSERT valor=i+j REPORT "resultado incorrecto" SEVERITY ERROR;
		WAIT FOR 2 ns;
		WAIT;

	END PROCESS;
END estructural;
