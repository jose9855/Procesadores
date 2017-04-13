----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:21:43 04/11/2017 
-- Design Name: 
-- Module Name:    pc - Behavioral 
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

entity pc is
    Port ( in_pc : in  STD_LOGIC_VECTOR (31 downto 0);
           Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           out_pc : out  STD_LOGIC_VECTOR (31 downto 0));
end pc;

architecture Behavioral of pc is

begin

process(Clock)
	begin
		if(rising_edge(Clock))then
			if(Reset = '1')then
				out_pc <= (others=>'0');
			else
				out_pc <= in_pc;
			end if;
		end if;
	end process;

end Behavioral;
