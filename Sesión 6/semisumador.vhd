ENTITY semisumador IS
	PORT (x, y: IN BIT; r_xor, r_and:OUT BIT);
END semisumador;

ARCHITECTURE estructural OF semisumador IS
	COMPONENT xor2
		PORT (e1, e2: IN BIT; sal:OUT BIT);
	END COMPONENT;
	COMPONENT and2
		PORT (e1, e2: IN BIT; sal:OUT BIT);
	END COMPONENT;
BEGIN
		xor_n: xor2 PORT MAP (x, y, r_xor);
		and_n: and2 PORT MAP (x, y, r_and);
END estructural;
