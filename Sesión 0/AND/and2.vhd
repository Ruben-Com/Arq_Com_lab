--puerta and de 2 entradas

ENTITY and2 IS
	GENERIC (retardo: TIME:= 2 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END and2;

ARCHITECTURE comportamiento OF and2 IS
BEGIN
	PROCESS (e1, e2)
	BEGIN
		sal <= e1 AND e2 AFTER retardo;
	END PROCESS;
END comportamiento;
