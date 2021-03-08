--este es el test_bench de un operador AND de 4 bits
ENTITY tb_op_not_4 IS
END tb_op_not_4;

ARCHITECTURE estructural OF tb_op_not_4 IS
--declaración del componente a estudiar
	COMPONENT op_not_4
			PORT (vector_a: IN BIT_VECTOR (3 DOWNTO 0);
						vector_r: OUT BIT_VECTOR (3 DOWNTO 0));
	END COMPONENT;
--especificación de la configuración del componente
	FOR componente: op_not_4 USE ENTITY WORK.op_not_4(estructural);
--declaración de señales de interconexión
	SIGNAL A, B: BIT_VECTOR (3 DOWNTO 0):= X"0";
--comienza la descripción de los procesos
BEGIN
--primer proceso: instalación del componente a estudiar
	componente: op_not_4 PORT MAP (A, B);
--segudno proceso: estímulo de las señales de entrada
	PROCESS
		TYPE tipo_patron IS RECORD
--entradas a la puerta
			a, b: BIT_VECTOR (3 DOWNTO 0);
		END RECORD;
--la tabla de verdad
		TYPE array_patron IS ARRAY (NATURAL RANGE <>) of tipo_patron;
		CONSTANT tabla_verdad: array_patron :=
		((X"0", X"F"),
		(X"A", X"5"),
		(X"F", X"0"),
		(X"3", X"C"));
	BEGIN
--inyecta las señales desde la tabla de verdad
		FOR i IN tabla_verdad'RANGE LOOP
			A <= tabla_verdad(i).a;
--espero al resultado
			WAIT FOR 5 ns;
--compruebo si es correcto
			ASSERT B = tabla_verdad(i).b REPORT "resultado incorrecto" SEVERITY ERROR;
		END LOOP;
--mensaje final
		ASSERT false REPORT "fin del test" SEVERITY NOTE;
		WAIT;
	END PROCESS;
END estructural;
