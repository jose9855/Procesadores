----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:36 04/13/2017 
-- Design Name: 
-- Module Name:    procesador2 - arq_procesador 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity procesador2 is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           out_procesador2 : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture arq_procesador of procesador2 is

	COMPONENT sumador
	PORT(
		dato1 : IN std_logic_vector(31 downto 0);
		dato2 : IN std_logic_vector(31 downto 0);          
		sum_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT npc
	PORT(
		dir : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clock : IN std_logic;          
		out_npc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT pc
	PORT(
		in_pc : IN std_logic_vector(31 downto 0);
		Clock : IN std_logic;
		Reset : IN std_logic;          
		out_pc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT uc
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		alu_op : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

	COMPONENT rf
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		dwr : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		ctrs1 : OUT std_logic_vector(31 downto 0);
		ctrs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT mux
	PORT(
		i : IN std_logic;
		ctrs2 : IN std_logic_vector(31 downto 0);
		out_seu : IN std_logic_vector(31 downto 0);          
		out_mux : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT seu
	PORT(
		imm : IN std_logic_vector(12 downto 0);          
		out_seu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT alu
	PORT(
		ctrs1 : IN std_logic_vector(31 downto 0);
		ctrs2 : IN std_logic_vector(31 downto 0);
		alu_op : IN std_logic_vector(5 downto 0);          
		alu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;



signal sumadorTOnpc, npcTOpc, pcTOim, imTOURS, aluResult, rfTOALU1, rfTOMUX, seuTOMUX, muxTOALU : STD_LOGIC_VECTOR (31 downto 0);
signal aluop1: STD_LOGIC_VECTOR(5 downto 0);  

begin

	Inst_sumador: sumador PORT MAP(
		dato1 => x"00000001",
		dato2 =>  npcTOpc,
		sum_out => sumadorTOnpc
	);

	Inst_npc: npc PORT MAP(
		dir => sumadorTOnpc,
		Reset => reset,
		Clock => clock,
		out_npc => npcTOpc
	);
	
	Inst_pc: pc PORT MAP(
		in_pc => npcTOpc,
		Clock => clock,
		Reset => reset,
		out_pc => pcTOim
	);

	Inst_instructionMemory: instructionMemory PORT MAP(
		address => pcTOim ,
		reset => reset,
		outInstruction => imTOURS
	);
	
	Inst_uc: uc PORT MAP(
		op => imTOURS(31 downto 30),
		op3 => imTOURS(24 downto 19),
		alu_op => aluop1
	);

	Inst_rf: rf PORT MAP(
		rs1 => imTOURS(18 downto 14),
		rs2 => imTOURS(4 downto 0),
		rd => imTOURS(29 downto 25),
		ctrs1 => rfTOALU1,
		ctrs2 => rfTOMUX,
		dwr => aluResult,
		reset => reset
	);

	Inst_mux: mux PORT MAP(
		i => imTOURS(13),
		ctrs2 => rfTOMUX,
		out_seu => seuTOMUX,
		out_mux => muxTOALU
	);

	Inst_seu: seu PORT MAP(
		imm => imTOURS(12 downto 0),
		out_seu => seuTOMUX
	);
	
	Inst_alu: alu PORT MAP(
		ctrs1 => rfTOALU1,
		ctrs2 => muxTOALU,
		alu_op => aluop1,
		alu_out => aluResult
	);

out_procesador2<=aluResult;

end arq_procesador;

