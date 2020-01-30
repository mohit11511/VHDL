----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.01.2020 01:57:32
-- Design Name: 
-- Module Name: finite_state_machine - Behavioral
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

entity finite_state_machine is
generic ( s_width : integer :=3;
          an0   : std_logic_vector(3 downto 0) := "000";
          an45  : std_logic_vector(3 downto 0) := "001";
          an90  : std_logic_vector(3 downto 0) := "010";
          an135 : std_logic_vector(3 downto 0) := "011";
          an180 : std_logic_vector(3 downto 0) := "100";
          an225 : std_logic_vector(3 downto 0) := "101";
          an270 : std_logic_vector(3 downto 0) := "110";
          an315 : std_logic_vector(3 downto 0) := "111"  );
Port (
clk,reset,movecw,moveccw : in std_logic_vector;
PhyPosition : in std_logic_vector(s_width-1 downto 0);
DesPosition,PosError : out std_logic_vector(s_width-1 downto 0)  );
end finite_state_machine;

architecture Behavioral of finite_state_machine is
signal current_state,next_state : std_logic_vector(s_width-1 downto 0);
begin
comb_proc : process(movecw,moveccw,PhyPosition,current_state)
begin
case(current_state  ) is

when an0 =>
if(movecw='1') then next_state <= an45;
elsif(moveccw='1') then next_state <= an315;
else next_state <= an0;
end if;

when an45 =>
if(movecw='1') then next_state <= an90;
elsif(moveccw='1') then next_state <= an0;
else next_state <= an45;
end if;

when an90 =>
if(movecw='1') then next_state <= an135;
elsif(moveccw='1') then next_state <= an45;
else next_state <= an90;
end if;

when an135 =>
if(movecw='1') then next_state <= an180;
elsif(moveccw='1') then next_state <= an90;
else next_state <= an135;
end if;

when an180 =>
if(movecw='1') then next_state <= an225;
elsif(moveccw='1') then next_state <= an135;
else next_state <= an180;
end if;

when an225 =>
if(movecw='1') then next_state <= an270;
elsif(moveccw='1') then next_state <= an180;
else next_state <= an225;
end if;

when an270 =>
if(movecw='1') then next_state <= an315;
elsif(moveccw='1') then next_state <= an225;
else next_state <= an270;
end if; 

when an315 =>
if(movecw='1') then next_state <= an0;
elsif(moveccw='1') then next_state <= an270;
else next_state <= an315;
end if;

when others => next_state <= an0;
end case;
end process comb_proc;

clk_proc : process(clk,reset)
begin
if(reset='1') then current_state <= PhyPosition;
elsif(rising_edge(clk)) then current_state <= next_state;
end if;
end process clk_proc;

DesPosition <= current_state;
PsoError <= DesPosition-PhyPosition;
end Behavioral;
