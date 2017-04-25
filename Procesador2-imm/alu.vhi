
-- VHDL Instantiation Created from source file alu.vhd -- 18:25:04 04/24/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT alu
	PORT(
		ctrs1 : IN std_logic_vector(31 downto 0);
		ctrs2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		alu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_alu: alu PORT MAP(
		ctrs1 => ,
		ctrs2 => ,
		alu_op => ,
		alu_out => 
	);


