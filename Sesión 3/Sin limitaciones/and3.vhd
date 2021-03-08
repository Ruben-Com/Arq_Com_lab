ENTITY and3 IS
	GENERIC (retardo: TIME:= 2 ns);
	PORT (e1, e2, e3: IN BIT; sal: OUT BIT);
END and3;

ARCHITECTURE comportamiento OF and3 IS
BEGIN
	PROCESS (e1, e2, e3)
	BEGIN
		sal <= e1 AND e2 AND e3 AFTER retardo;
	END PROCESS;
END comportamiento;
