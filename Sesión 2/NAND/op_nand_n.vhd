ENTITY op_nand_n IS
	GENERIC (n: INTEGER:=8);
	PORT (x, y: IN BIT_VECTOR(n-1 DOWNTO 0); r:OUT BIT_VECTOR(n-1 DOWNTO 0));
END op_nand_n;

ARCHITECTURE estructural OF op_nand_n IS
	COMPONENT nand2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
BEGIN
	bateria: FOR i IN 0 TO n-1 GENERATE
		puertas: nand2 PORT MAP (x(i), y(i), r(i));
	END GENERATE;
END estructural;
