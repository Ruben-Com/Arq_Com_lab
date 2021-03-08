--puerta and de 2 entradas

ENTITY or2 IS
	GENERIC (retardo: TIME:= 2 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END or2;

ARCHITECTURE comportamiento OF or2 IS
BEGIN
	PROCESS (e1, e2)
	BEGIN
		sal <= e1 OR e2 AFTER retardo;
	END PROCESS;
END comportamiento;
