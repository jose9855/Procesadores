
-- VHDL Instantiation Created from source file ALU.vhd -- 00:49:38 11/02/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT ALU
	PORT(
		Aluop : IN std_logic_vector(5 downto 0);
		ConReg1 : IN std_logic_vector(31 downto 0);
		ConReg2 : IN std_logic_vector(31 downto 0);
		Carry : IN std_logic;          
		Resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_ALU: ALU PORT MAP(
		Aluop => ,
		ConReg1 => ,
		ConReg2 => ,
		Carry => ,
		Resultado => 
	);


