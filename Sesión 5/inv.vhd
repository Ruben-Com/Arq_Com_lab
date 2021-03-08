ENTITY inv IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e: IN BIT; sal: OUT BIT);
END inv;

ARCHITECTURE comportamiento OF inv IS
BEGIN
	PROCESS (e)
	BEGIN
		sal <= NOT e AFTER retardo;
	END PROCESS;
END comportamiento;
