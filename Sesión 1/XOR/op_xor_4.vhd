ENTITY op_xor_4 IS
	PORT (vector_a, vector_b: IN BIT_VECTOR (3 DOWNTO 0);
				vector_r: OUT BIT_VECTOR (3 DOWNTO 0));
END op_xor_4;

ARCHITECTURE estructural OF op_xor_4 IS
	COMPONENT xor2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	FOR ALL: xor2 USE ENTITY WORK.xor2(comportamiento);
BEGIN
	celda0: xor2 PORT MAP (vector_a(0), vector_b(0), vector_r(0));
	celda1: xor2 PORT MAP (vector_a(1), vector_b(1), vector_r(1));
	celda2: xor2 PORT MAP (vector_a(2), vector_b(2), vector_r(2));
	celda3: xor2 PORT MAP (vector_a(3), vector_b(3), vector_r(3));
END estructural;
