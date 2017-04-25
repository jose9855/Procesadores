
-- VHDL Instantiation Created from source file npc.vhd -- 14:01:10 04/23/2017
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT npc
	PORT(
		dir : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clock : IN std_logic;          
		out_npc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	Inst_npc: npc PORT MAP(
		dir => ,
		Reset => ,
		Clock => ,
		out_npc => 
	);


