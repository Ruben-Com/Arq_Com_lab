ENTITY sumador IS
	PORT (x, y, c_in: IN BIT; s, c_out:OUT BIT);
END sumador;

ARCHITECTURE estructural OF sumador IS
	COMPONENT and3
		PORT (e1, e2, e3: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT or4
		PORT (e1, e2, e3, e4: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT not2
		PORT (e: IN BIT; sal: OUT BIT);
	END COMPONENT;
	SIGNAL not_x, not_y, not_c_in, s_and1, s_and2, s_and3, s_and4, c_out_and1, c_out_and2, c_out_and3: BIT;
BEGIN
	notx: not2 PORT MAP (x, not_x);
	noty: not2 PORT MAP (y, not_y);
	notc_in: not2 PORT MAP (c_in, not_c_in);
	and1_sal: and3 PORT MAP (x, not_y, not_c_in, s_and1);
	and2_sal: and3 PORT MAP (not_x, y, not_c_in, s_and2);
	and3_sal: and3 PORT MAP (not_x, not_y, c_in, s_and3);
	and4_sal: and3 PORT MAP (x, y, c_in, s_and4);
	sal: or4 PORT MAP (s_and1, s_and2, s_and3, s_and4, s);
	and1_c_out: and3 PORT MAP (x, y, '1', c_out_and1);
	and2_c_out: and3 PORT MAP (x, c_in, '1', c_out_and2);
	and3_c_out: and3 PORT MAP (y, c_in, '1', c_out_and3);
	cout: or4 PORT MAP (c_out_and1, c_out_and2, c_out_and3, '0', c_out);
END estructural;
