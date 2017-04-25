--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:33:23 04/24/2017
-- Design Name:   
-- Module Name:   F:/GitHub/Procesador2-imm/procesador2_tb2.vhd
-- Project Name:  Procesador2-imm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: procesador2
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
 
ENTITY procesador2_tb2 IS
END procesador2_tb2;
 
ARCHITECTURE behavior OF procesador2_tb2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT procesador2
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         out_procesador2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal out_procesador2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clock_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: procesador2 PORT MAP (
          clock => clock,
          reset => reset,
          out_procesador2 => out_procesador2
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		reset<='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
				
				reset<='0';
				
      wait;
   end process;

END;
