
-- VHDL Instantiation Created from source file mux.vhd -- 15:39:17 04/13/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT mux
	PORT(
		i : IN std_logic;
		ctrs2 : IN std_logic_vector(31 downto 0);
		out_seu : IN std_logic_vector(31 downto 0);          
		out_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_mux: mux PORT MAP(
		i => ,
		ctrs2 => ,
		out_seu => ,
		out_mux => 
	);


