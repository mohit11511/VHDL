----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2020 23:29:41
-- Design Name: 
-- Module Name: data_reg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_reg is
Port (
clk,reset,load: in std_logic;
d             : in std_logic_vector(3 downto 0);
q             : out std_logic_vector(3 downto 0)  );
end data_reg;

architecture Behavioral of data_reg is
begin
datareg_proc_1: process(clk,reset,load)
begin
if(reset='1') then
q<="0000";
elsif(rising_edge(clk)) then
if(load='1') then
q<=d;
else
q<="0000";
end if;
end if;
end process datareg_proc_1;
end Behavioral;
