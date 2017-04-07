--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:43:49 04/04/2017
-- Design Name:   
-- Module Name:   F:/GitHub/Procesador1/npc_tb.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: npc
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY npc_tb IS
END npc_tb;
 
ARCHITECTURE behavior OF npc_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT npc
    PORT(
         dir : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         out_npc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dir : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal out_npc : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: npc PORT MAP (
          dir => dir,
          rst => rst,
          clk => clk,
          out_npc => out_npc
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		rst <= '1';   
   -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '0';
		dir <= "00000000000000000000000000000001";
		wait for 100 ns;
		dir <= x"00000010";
		wait for 100 ns;
		dir <= x"00000001";

	
	

      -- insert stimulus here 

      wait;
   end process;

END;
