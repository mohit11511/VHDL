----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.01.2020 01:02:13
-- Design Name: 
-- Module Name: combinational_logic - Behavioral
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

entity combinational_logic is
Port (
a,b,c,d    : in std_logic;
va,vb      : in std_logic_vector(3 downto 0);
w,x,y,z,vz : out std_logic;
vx,vy      : out std_logic_vector(3 downto 0)
 );
end entity combinational_logic;

architecture Behavioral of combinational_logic is
begin

w <= a and b;
x <= a nor b;
y <= c xor d;
z <= c xnor d;
vz <= (a and b)or(c and d);
vx <= va and vb;
vy <= va or vb;

end architecture Behavioral;
