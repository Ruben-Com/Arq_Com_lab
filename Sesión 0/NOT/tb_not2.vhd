ENTITY tb_not2 IS
END tb_not2;

ARCHITECTURE estructural OF tb_not2 IS

	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	

	FOR componente: not2 USE ENTITY WORK.not2(comportamiento);


	SIGNAL a: BIT:='0';
	SIGNAL s: BIT:='0';


BEGIN

	componente: not2 PORT MAP (a, b, s1, s2);
	
	
	PROCESS
	BEGIN
		a<= '0';
		WAIT FOR 5 ns;
		a<= '1';
		WAIT FOR 5 ns;
		a<= '0';
	END PROCESS;
END estructural;
