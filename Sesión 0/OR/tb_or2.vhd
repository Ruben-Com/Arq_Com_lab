ENTITY tb_or2 IS
END tb_or2;

ARCHITECTURE estructural OF tb_or2 IS

	COMPONENT or2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	

	FOR componente: or2 USE ENTITY WORK.or2(comportamiento);


	SIGNAL a, b: BIT:='0';
	SIGNAL s: BIT:='0';


BEGIN

	componente: or2 PORT MAP (a, b, s);
	
	
	PROCESS
	BEGIN
		a<= '0';
		b<= '0';
		WAIT FOR 5 ns;
		a<= '1';
		b<= '0';
		WAIT FOR 5 ns;
		a<= '0';
		b<= '1';
		WAIT FOR 5 ns;
		a<= '1';
		b<= '1';
		WAIT FOR 5 ns;
		WAIT;
	END PROCESS;
END estructural;
