----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:02:31 03/30/2017 
-- Design Name: 
-- Module Name:    rf - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rf is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0); --Contenido RS1
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0); -- Contenido RS2
			  dwr : in  STD_LOGIC_VECTOR (31 downto 0); --contenido RD: registro destino
           rst : in  STD_LOGIC);
end rf;

architecture Behavioral of rf is


type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
	signal reg : ram_type :=(others => x"00000000");

begin
process(rs1,rs2,rst,rd,dwr)

begin
	if(rst = '1')then
				crs1<= (others=>'0');
				crs2<= (others=>'0');
			
				reg<= (others => x"00000000");
			else
				crs1<= reg(conv_integer(rs1));
				crs2<= reg(conv_integer(rs1));
				
				
			if(rd  /= "000000")then
					reg(conv_integer(rd)) <= dwr;
				end if;
			end if;
	
end process; 

end Behavioral;

