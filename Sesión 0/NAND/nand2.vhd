ENTITY nand2 IS
	GENERIC (retardo: TIME:= 1 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END nand2;

ARCHITECTURE comportamiento OF nand2 IS
BEGIN
	PROCESS (e1, e2)
	BEGIN
		sal <= e1 NAND e2 AFTER retardo;
	END PROCESS;
END comportamiento;
