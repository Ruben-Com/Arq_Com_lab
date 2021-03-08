ENTITY not2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END not2;

ARCHITECTURE comportamiento OF not2 IS
BEGIN
	PROCESS (e)
	BEGIN
		sal <= NOT e AFTER retardo;
	END PROCESS;
END comportamiento;
