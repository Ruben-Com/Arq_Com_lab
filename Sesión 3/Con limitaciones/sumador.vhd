ENTITY sumador IS
	PORT (x, y, c_in: IN BIT; s, c_out:OUT BIT);
END sumador;

ARCHITECTURE estructural OF sumador IS
	COMPONENT and2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT or2
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	SIGNAL not_x, not_y, not_c_in, s_and1_1, s_and1_2, s_and2_1, s_and2_2, s_and3_1, s_and3_2, s_and4_1, s_and4_2, c_out_and1, c_out_and2, c_out_and3, cout_aux, s1, s2: BIT;
BEGIN
	notx: not2 PORT MAP (x, not_x);
	noty: not2 PORT MAP (y, not_y);
	notc_in: not2 PORT MAP (c_in, not_c_in);
	and1_sal_1: and2 PORT MAP (x, not_y, s_and1_1);
	and1_sal_2: and2 PORT MAP (s_and1_1, not_c_in, s_and1_2);
	and2_sal_1: and2 PORT MAP (not_x, y, s_and2_1);
	and2_sal_2: and2 PORT MAP (s_and2_1, not_c_in, s_and2_2);
	and3_sal_1: and2 PORT MAP (not_x, not_y, s_and3_1);
	and3_sal_2: and2 PORT MAP (s_and3_1, c_in, s_and3_2);
	and4_sal_1: and2 PORT MAP (x, y, s_and4_1);
	and4_sal_2: and2 PORT MAP (s_and4_1, c_in, s_and4_2);
	sal1: or2 PORT MAP (s_and1_2, s_and2_2, s1);
	sal2: or2 PORT MAP (s_and3_2, s_and4_2, s2);
	sal: or2 PORT MAP (s1, s2, s);
	and1_c_out: and2 PORT MAP (x, y, c_out_and1);
	and2_c_out: and2 PORT MAP (x, c_in, c_out_and2);
	and3_c_out: and2 PORT MAP (y, c_in, c_out_and3);
	aux_cout: or2 PORT MAP (c_out_and1, c_out_and2, cout_aux);
	cout: or2 PORT MAP (cout_aux, c_out_and3, c_out);
END estructural;
