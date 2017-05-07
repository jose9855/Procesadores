
-- VHDL Instantiation Created from source file InstructionMemory.vhd -- 00:41:04 10/18/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT InstructionMemory
	PORT(
		Direccion : IN std_logic_vector(31 downto 0);
		Rst : IN std_logic;          
		Instruccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Direccion => ,
		Rst => ,
		Instruccion => 
	);


