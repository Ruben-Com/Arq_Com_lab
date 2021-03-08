ENTITY op_not_n IS
	GENERIC (n: INTEGER:=8);
	PORT (x: IN BIT_VECTOR(n-1 DOWNTO 0); s:OUT BIT_VECTOR(n-1 DOWNTO 0));
END op_not_n;

ARCHITECTURE estructural OF op_not_n IS
	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
BEGIN
	bateria: FOR i IN 0 TO n-1 GENERATE
		puertas: not2 PORT MAP (x(i), s(i));
	END GENERATE;
END estructural;
