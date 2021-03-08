ENTITY tb_sumador IS
END tb_sumador;

ARCHITECTURE estructural OF tb_sumador IS

	COMPONENT sumador
		PORT (x, y, c_in: IN BIT; s, c_out: OUT BIT);
	END COMPONENT;
	

	FOR componente: sumador USE ENTITY WORK.sumador(estructural);


	SIGNAL a, b, c0, marca: BIT:='0';
	SIGNAL r, c1: BIT:='0';


BEGIN

	componente: sumador PORT MAP (a, b, c0, r, c1);
	
	
	PROCESS
	BEGIN
		a<= '1';
		b<= '1';
		c0<= '1';
		marca<= '1';
		WAIT UNTIL r<= '1' and c1<= '1';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '1';
		b<= '1';
		c0<= '0';
		marca<= '1';
		WAIT UNTIL r<= '0' and c1<= '1';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '1';
		b<= '0';
		c0<= '0';
		marca<= '1';
		WAIT UNTIL r<= '1' and c1<= '0';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '1';
		b<= '0';
		c0<= '1';
		marca<= '1';
		WAIT UNTIL r<= '0' and c1<= '1';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '0';
		b<= '1';
		c0<= '0';
		marca<= '1';
		WAIT UNTIL r<= '1' and c1<= '0';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '0';
		b<= '1';
		c0<= '1';
		marca<= '1';
		WAIT UNTIL r<= '0' and c1<= '1';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '0';
		b<= '0';
		c0<= '1';
		marca<= '1';
		WAIT UNTIL r<= '1' and c1<= '0';
		marca<= '0';
		WAIT FOR 5 ns;
		
		a<= '0';
		b<= '0';
		c0<= '0';
		marca<= '1';
		WAIT UNTIL r<= '0' and c1<= '0';
		marca<= '0';
		WAIT FOR 5 ns;
		
		WAIT;
	END PROCESS;
END estructural;
