ENTITY op_not_4 IS
	PORT (vector_a: IN BIT_VECTOR (3 DOWNTO 0);
				vector_r: OUT BIT_VECTOR (3 DOWNTO 0));
END op_not_4;

ARCHITECTURE estructural OF op_not_4 IS
	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	FOR ALL: not2 USE ENTITY WORK.not2(comportamiento);
BEGIN
	celda0: not2 PORT MAP (vector_a(0), vector_r(0));
	celda1: not2 PORT MAP (vector_a(1), vector_r(1));
	celda2: not2 PORT MAP (vector_a(2), vector_r(2));
	celda3: not2 PORT MAP (vector_a(3), vector_r(3));
END estructural;
