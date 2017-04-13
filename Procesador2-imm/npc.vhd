----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:33 03/30/2017 
-- Design Name: 
-- Module Name:    npc - Behavioral 
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

entity npc is
    Port ( dir : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           out_npc : out  STD_LOGIC_VECTOR (31 downto 0));
end npc;

architecture Behavioral of npc is

begin

process (Clock,Reset,dir)
	begin
	if(rising_edge(Clock))then
			if Reset='1' then
			out_npc <= x"00000000";
		else
		out_npc <= dir;		
		end if;
	end if;
end process;

end Behavioral;

