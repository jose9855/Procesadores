----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:22 04/08/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.All;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( ctrs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           ctrs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
			  Carry : in STD_LOGIC; 
           alu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

begin
process(ctrs1,ctrs2, alu_op)
begin
 case (alu_op) is 
			when "000001" => -- ADD
				alu_out <= ctrs1 + ctrs2;
			when "000010" => -- ADDcc
				alu_out <= ctrs1 + ctrs2;
			when "000011" => -- ADDx
				alu_out <= ctrs1 + ctrs2 + Carry;
			when "000100" => -- ADDxcc
				alu_out <= ctrs1 + ctrs2 + Carry;
			when "000101" => -- SUB
				alu_out <= ctrs1 - ctrs2;
			when "000110" => -- SUBcc
				alu_out <= ctrs1 - ctrs2;
			when "000111" => -- SUBx
				alu_out <= ctrs1 - ctrs2 - Carry;
			when "001000" => -- SUBxcc
				alu_out <= ctrs1 - ctrs2 - Carry;
			when "001001" => --AND
				alu_out <= ctrs1 and ctrs2;
			when "001010" => --ANDcc
				alu_out <= ctrs1 and ctrs2;
			when "001011" => --ANDN
				alu_out <= ctrs1 nand ctrs2;
			when "001100" => --ANDNcc
				alu_out <= ctrs1 nand ctrs2;
			when "001101" => -- OR
				alu_out <= ctrs1 or ctrs2;
			when "001110" => -- ORcc
				alu_out <= ctrs1 or ctrs2;
			when "001111" => -- ORN
				alu_out <= ctrs1 nor ctrs2;
			when "010000" => -- ORNcc
				alu_out <= ctrs1 nor ctrs2;
			when "010001" => -- XOR
				alu_out <= ctrs1 xor ctrs2;
			when "010010" => -- XORcc
				alu_out <= ctrs1 xor ctrs2;
			when "010011" => -- XORN
				alu_out <= ctrs1 xnor ctrs2;
			when "010100" => -- XORNcc
				alu_out <= ctrs1 xnor ctrs2;
			when others => -- Cae el nop
				alu_out <= (others=>'0');

		end case;
	
	end process;

end Behavioral;

