ENTITY mux21 IS
	PORT (e1, e2, control: IN BIT; s: OUT BIT);
END mux21;

ARCHITECTURE estructural OF mux21 IS

	COMPONENT inv
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT and2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT or2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	
	FOR negado_control: inv USE ENTITY WORK.inv(comportamiento);
	FOR puerta_and_1, puerta_and_2: and2 USE ENTITY WORK.and2(comportamiento);
	FOR puerta_or: or2 USE ENTITY WORK.or2(comportamiento);
	SIGNAL no_control, s_and_1, s_and_2: BIT;
	
BEGIN

	negado_control: inv PORT MAP (control, no_control);
	puerta_and_1: and2 PORT MAP (no_control, e1, s_and_1);
	puerta_and_2: and2 PORT MAP (control, e2, s_and_2);
	puerta_or: or2 PORT MAP (s_and_1, s_and_2, s);
	
END estructural;
