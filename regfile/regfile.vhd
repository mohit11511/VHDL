----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2020 03:48:07
-- Design Name: 
-- Module Name: regfile - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity regfile is
generic ( Dwidth : integer :=8;  -- Dwidth=Data width
          Awidth : integer :=2); -- Awidth=Address width
port (
clk,wren : in std_logic;
wdata : in std_logic_vector(Dwidth-1 downto 0);
waddr,raddr : in std_logic_vector(Awidth-1 downto 0);
rdata : out std_logic_vector(Dwidth-1 downto 0) );          
end entity regfile;

architecture Behavioral of regfile is
type array_type(0 to 2**Awidth-1) of std_logic_vector(Dwidth-1 downto 0);
signal array_reg=array_type;
begin
rf_proc : process(clk,wren,wdata,waddr,raddr)
begin
if(rising_edge(clk)) then
if(wren='1') then
array_reg(to_integer(unsigned(waddr))) <= wdata;
end if;
rdata <= array_reg(to_integer(unsigned(raddr)));
end if;
end process rf_proc;
end Behavioral;
