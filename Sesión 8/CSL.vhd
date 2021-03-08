ENTITY CSL IS
	GENERIC (k: INTEGER:=4; TAMANO_PALABRA_RCA: INTEGER:=2);
	PORT(x_in, y_in: IN BIT_VECTOR(k-1 downto 0); c_in: IN BIT; sal, c_out: OUT BIT_VECTOR(k-1 downto 0));
END ENTITY;

ARCHITECTURE estructural OF CSL IS

	COMPONENT RCA
		GENERIC (c: INTEGER:=TAMANO_PALABRA_RCA);
		PORT(x_in, y_in: IN BIT_VECTOR(TAMANO_PALABRA_RCA-1 downto 0); c_in: IN BIT; sal, c_out: OUT BIT_VECTOR(TAMANO_PALABRA_RCA-1 downto 0));
	END COMPONENT;
	COMPONENT mux21
		PORT (e1, e2, control: IN BIT; s: OUT BIT);
	END COMPONENT;
	COMPONENT and2
		GENERIC (retardo: TIME:= 1 ns);
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	COMPONENT or2
		GENERIC (retardo: TIME:= 1 ns);
		PORT (e1, e2: IN BIT; sal: OUT BIT);
	END COMPONENT;
	
	FOR ALL: RCA USE ENTITY WORK.RCA(estructural);
	FOR ALL: mux21 USE ENTITY WORK.mux21(estructural);
	FOR ALL: and2 USE ENTITY WORK.and2(comportamiento);
	FOR ALL: or2 USE ENTITY WORK.or2(comportamiento);
	
SIGNAL RCA_0, RCA_1: BIT_VECTOR(k-1 DOWNTO 0);
SIGNAL RCA_0_Cout, RCA_1_Cout: BIT_VECTOR(TAMANO_PALABRA_RCA-1 DOWNTO 0);
SIGNAL Cin_and_Cout:BIT;
BEGIN

	RCA_carry_0: RCA PORT MAP(x_in, y_in, '0', RCA_0, RCA_0_Cout);
	RCA_carry_1: RCA PORT MAP(x_in, y_in, '1', RCA_1, RCA_1_Cout);
	G: FOR i IN 0 TO k-1 GENERATE
		multiplexor: mux21 PORT MAP(RCA_0(i), RCA_1(i), c_in, sal(i));
	END GENERATE G;
	Cout_and: and2 PORT MAP (c_in, RCA_1_Cout(TAMANO_PALABRA_RCA-1), Cin_and_Cout);
	Cout_or: or2 PORT MAP (RCA_0_Cout(TAMANO_PALABRA_RCA-1), Cin_and_Cout, c_out);
	
END estructural;
