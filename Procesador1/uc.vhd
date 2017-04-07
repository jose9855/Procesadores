----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:55:07 04/03/2017 
-- Design Name: 
-- Module Name:    uc - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uc is
    Port ( op : in  STD_LOGIC_VECTOR(1 downto 0);
           op3 : in  STD_LOGIC_VECTOR(5 downto 0);
           out_uc : out  STD_LOGIC_VECTOR (5 downto 0));
end uc;

architecture Behavioral of uc is

begin
	
	process (op, op3)
	
	begin
	
	if (op="10")then
		
					case op3 is 
				
							when "000000" => -- ADD
								out_uc  <= "000001";

							when "000100" => -- SUB
								 out_uc <= "000010";
								 
							when "000001" => -- AND
								out_uc <= "000011";
								 
							when "000101" => -- ANDN
								out_uc <= "000100";
								 
							when "000010" => -- OR
								out_uc <= "000101";
								
							when "000110" => -- ORN
								out_uc <= "000110";
								 
							when "000011" => -- XOR
								out_uc  <= "000111"; 
								
							when "000111" => -- XORN
								out_uc <= "001000";
							when others => 
								out_uc <= "111111"; 

						end case;
						 
		end if; 
	
	end process;

end Behavioral;