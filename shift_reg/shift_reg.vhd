----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.01.2020 00:37:26
-- Design Name: 
-- Module Name: shift_reg - Behavioral
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

-- VHDL code for serial in parallel out shift register
entity shift_reg_sp is
Port (
d0,shift,reset1,clk1 : in std_logic;
q1                  : inout std_logic_vector(3 downto 0)  );
end shift_reg_sp;

architecture Behavioral of shift_reg_sp is
begin
shift_reg_proc_1 : process(reset1,clk1)
begin
if(reset1='0') then
q1<="0000";
elsif(rising_edge(clk1)) then
if(shift='1') then
q1(0) <= d0;
q1(3 downto 1) <= q1(2 downto 0);
end if;
end if;
end process shift_reg_proc_1;
end Behavioral;


library ieee;
use ieee.std_logic_1164.all;

-- VHDL code for parallel in parallel out shift register
entity shift_reg_pp is
port (
d : in std_logic_vector(3 downto 0);
clk2,reset2 : in std_logic;
q2 : out std_logic_vector(3 downto 0)  );
end entity shift_reg_pp;

architecture arch of shift_reg_pp is
begin
shift_reg_pp1 : process(clk2)
begin
if(reset2='0') then
q2 <= "0000";
elsif(rising_edge(clk2)) then
q2 <= d;
end if;
end process shift_reg_pp1;
end architecture arch;
