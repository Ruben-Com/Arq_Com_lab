ENTITY xor2 IS
	GENERIC (retardo: TIME:= 3 ns);
	PORT (e1, e2: IN BIT; sal: OUT BIT);
END xor2;

ARCHITECTURE comportamiento OF xor2 IS
BEGIN
	PROCESS (e1, e2)
	BEGIN
		sal <= e1 XOR e2 AFTER retardo;
	END PROCESS;
END comportamiento;
