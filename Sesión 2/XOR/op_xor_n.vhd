ENTITY op_xor_n IS
	GENERIC (n: INTEGER:=8);
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); r:OUT BIT_VECTOR(n-1 DOWNTO 0));
END op_xor_n;

ARCHITECTURE estructural OF op_xor_n IS
	COMPONENT xor2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
BEGIN
	bateria: FOR i IN 0 TO n-1 GENERATE
		puertas: xor2 PORT MAP (x(i), y(i), r(i));
	END GENERATE;
END estructural;
