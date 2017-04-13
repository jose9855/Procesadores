--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:49:48 04/13/2017
-- Design Name:   
-- Module Name:   F:/GitHub/Procesador2-imm/mux_tb.vhd
-- Project Name:  Procesador2-imm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux
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
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         i : IN  std_logic;
         ctrs2 : IN  std_logic_vector(31 downto 0);
         out_seu : IN  std_logic_vector(31 downto 0);
         out_mux : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal ctrs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal out_seu : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal out_mux : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          i => i,
          ctrs2 => ctrs2,
          out_seu => out_seu,
          out_mux => out_mux
        );

   -- Clock process definitions
--   <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
-- 
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for <clock>_period*10;

      -- insert stimulus here 
   stim_proc: process
   begin	
		i <='0';
		out_seu <= x"00000003";
		ctrs2 	<= x"00000005";
	


      wait;
   end process;

END;
