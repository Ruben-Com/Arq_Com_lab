ENTITY op_or_n IS
	GENERIC (n: INTEGER:=8);
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); r:OUT BIT_VECTOR(n-1 DOWNTO 0));
END op_or_n;

ARCHITECTURE estructural OF op_or_n IS
	COMPONENT or2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
BEGIN
	bateria: FOR i IN 0 TO n-1 GENERATE
		puertas: or2 PORT MAP (x(i), y(i), r(i));
	END GENERATE;
END estructural;
