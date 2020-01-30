----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2020 23:11:35
-- Design Name: 
-- Module Name: d_flip_flop - Behavioral
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

entity d_flip_flop is
Port (
d,clk,set,reset : in std_logic;
q           : out std_logic  );
end d_flip_flop;

architecture Behavioral of d_flip_flop is
begin
dff_proc_1 : process(clk)
begin
if(reset='1') then
q<='0';
elsif(rising_edge(clk)) then
if(set='1') then
q<='1';
else
q<=d;
end if;
end if;
end process dff_proc_1;
end Behavioral;
