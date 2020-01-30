----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2020 01:49:02
-- Design Name: 
-- Module Name: binary_counter - Behavioral
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

entity binary_counter is
Port (
clk,reset,load,en : in std_logic;
d  : in std_logic_vector(3 downto 0);
q  : inout std_logic_vector(3 downto 0)  );
end binary_counter;

architecture Behavioral of binary_counter is
--signal result : unsigned(3 downto 0);
begin
count_proc : process(clk,reset,load,en)
begin
if(reset='1') then
q<=b"0000";
elsif(rising_edge(clk)) then
if(load='1') then
q<=d;
elsif en='1' then
q <= q + b"0001" ;
--result<=q;
--result<=result + 1;
end if;
end if;
end process count_proc;
end Behavioral;
