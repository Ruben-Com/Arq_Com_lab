ENTITY sumador IS
	PORT (x, y, c_in: IN BIT; s, c_out:OUT BIT);
END sumador;

ARCHITECTURE estructural OF sumador IS
	COMPONENT semisumador
		PORT (x, y: IN BIT; r_xor, r_and:OUT BIT);
	END COMPONENT;
	COMPONENT or2
		PORT (e1, e2: IN BIT; sal:OUT BIT);
	END COMPONENT;
	SIGNAL r_xor, r_and_1, r_and_2: BIT;
BEGIN
	primer_semisumador: semisumador PORT MAP(x, y, r_xor, r_and_1);
	segundo_semisumador: semisumador PORT MAP(r_xor, c_in, s, r_and_2);
	or_cout: or2 PORT MAP(r_and_1, r_and_2, c_out);
END estructural;
