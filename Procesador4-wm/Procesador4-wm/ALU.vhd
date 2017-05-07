----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:22 04/08/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           ConReg1  : in  STD_LOGIC_VECTOR (31 downto 0);
           ConReg2  : in  STD_LOGIC_VECTOR (31 downto 0);
			  Carry : in STD_LOGIC; 
           Resultado: out  STD_LOGIC_VECTOR (31 downto 0):= (others => '0'));
end ALU;

architecture Behavioral of ALU is

begin
process(ConReg1, ConReg2, Aluop)
begin
 case (Aluop) is 
			when "000001" => -- ADD
				Resultado <= ConReg1 + ConReg2;
			when "000010" => -- ADDcc
				Resultado <= ConReg1 + ConReg2;
			when "000011" => -- ADDx
				Resultado <= ConReg1 + ConReg2 + Carry;
			when "000100" => -- ADDxcc
				Resultado <= ConReg1 + ConReg2 + Carry;
			when "000101" => -- SUB
				Resultado <= ConReg1 - ConReg2;
			when "000110" => -- SUBcc
				Resultado <= ConReg1 - ConReg2;
			when "000111" => -- SUBx
				Resultado <= ConReg1 - ConReg2 - Carry;
			when "001000" => -- SUBxcc
				Resultado <= ConReg1 - ConReg2 - Carry;
			when "001001" => --AND
				Resultado <= ConReg1 and ConReg2;
			when "001010" => --ANDcc
				Resultado <= ConReg1 and ConReg2;
			when "001011" => --ANDN
				Resultado <= ConReg1 nand ConReg2;
			when "001100" => --ANDNcc
				Resultado <= ConReg1 nand ConReg2;
			when "001101" => -- OR
				Resultado <= ConReg1 or ConReg2;
			when "001110" => -- ORcc
				Resultado <= ConReg1 or ConReg2;
			when "001111" => -- ORN
				Resultado <= ConReg1 nor ConReg2;
			when "010000" => -- ORNcc
				Resultado <= ConReg1 nor ConReg2;
			when "010001" => -- XOR
				Resultado <= ConReg1 xor ConReg2;
			when "010010" => -- XORcc
				Resultado <= ConReg1 xor ConReg2;
			when "010011" => -- XORN
				Resultado <= ConReg1 xnor ConReg2;
			when "010100" => -- XORNcc
				Resultado <= ConReg1 xnor ConReg2;
			
			when "111100" => --SAVE (SE SIMULA QUE FUERA UNA SUMA PERO MODIFICANDO EL CWP-CURRENT WINDOW POINTER)
				Resultado <=   ConReg1 - ConReg2; 
			when "111101" => --RESTORE
				Resultado <=   ConReg1 + ConReg2;
			
			when others => -- pasa el NOP
				Resultado <= (others=>'0');
		end case;
end process; 

end Behavioral;
