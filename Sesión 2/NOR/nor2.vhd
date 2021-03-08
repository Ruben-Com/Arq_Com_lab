--puerta and de 2 entradas

ENTITY nor2 IS
	GENERIC (retardo: TIME:= 2 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END nor2;

ARCHITECTURE comportamiento OF nor2 IS
BEGIN
	PROCESS (e1, e2)
	BEGIN
		sal <= e1 NOR e2 AFTER retardo;
	END PROCESS;
END comportamiento;
