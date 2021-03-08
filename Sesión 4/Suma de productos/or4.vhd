ENTITY or4 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2, e3, e4: IN BIT; sal: OUT BIT);
END or4;

ARCHITECTURE comportamiento OF or4 IS
BEGIN
	PROCESS (e1, e2, e3, e4)
	BEGIN
		sal <= e1 OR e2 OR e3 OR e4 AFTER retardo;
	END PROCESS;
END comportamiento;
