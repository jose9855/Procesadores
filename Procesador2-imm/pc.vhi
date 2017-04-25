
-- VHDL Instantiation Created from source file pc.vhd -- 14:36:41 04/23/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT pc
	PORT(
		in_pc : IN std_logic_vector(31 downto 0);
		Clock : IN std_logic;
		Reset : IN std_logic;          
		out_pc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_pc: pc PORT MAP(
		in_pc => ,
		Clock => ,
		Reset => ,
		out_pc => 
	);


