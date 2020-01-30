----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2020 22:42:12
-- Design Name: 
-- Module Name: d_latch - Behavioral
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

entity d_latch is
Port (
d,gate,clr : in std_logic;
q          : out std_logic );
end entity d_latch;

architecture Behavioral of d_latch is
begin
latch_proc_1: process(gate,d)
begin
if(gate='1') then
q<=d;
end if;
end process latch_proc_1;

latch_proc_2: process(gate,clr,d)
begin
if(clr='1') then
q<='0';
elsif(gate='1') then
q<=d;
end if;
end process latch_proc_2;
end architecture Behavioral;
