----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:43 03/30/2017  
-- Design Name: 
-- Module Name:    InstructionMemory - Behavioral 
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
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMemory is
    Port ( Direccion : in  STD_LOGIC_VECTOR (31 downto 0);
           Reset : in  STD_LOGIC;
           Instruccion : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is

	--variable que almacenara una matriz de 32*32
	type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);
	--funcion que devuelve los mismos resultados siempre y cuando se evalue con los mismos argumentos
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile: text open read_mode is RomFileName; --Abre un archivo de tipo text en modo lectura
		variable RomFileLine :line;  --Variable para capturar cada linea del archivo abierto;
		variable temp_bv : bit_vector(31 downto 0); --Variable que almacena bit a bit el valor de la fila;
		variable temp_mem : rom_type; --variable que almacena todo el fichero en un array;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine); --leyendo cada linea del fichero
				read(RomFileLine,temp_bv); --leyendo y capturando los bits de cada linea
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	signal instructions : rom_type := InitRomFromFile("programa.data");

begin

	process(Direccion, Reset, instructions)
	begin
		if(Reset = '1')then
			Instruccion <= (others=>'0');
		else
			Instruccion <= instructions(conv_integer(Direccion(4 downto 0)));
		end if;

	end process; 

end Behavioral;

