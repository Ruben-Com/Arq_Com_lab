ENTITY tb_and2 IS
END tb_and2;

ARCHITECTURE estructural OF tb_and2 IS

	COMPONENT and2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	

	FOR componente: and2 USE ENTITY WORK.and2(comportamiento);


	SIGNAL a, b: BIT:='0';
	SIGNAL s: BIT:='0';


BEGIN

	componente: and2 PORT MAP (a, b, s);
	
	
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
