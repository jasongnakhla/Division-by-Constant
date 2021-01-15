----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2019 12:58:47 PM
-- Design Name: 
-- Module Name: DIV_CONST - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DIV_CONST is
    Port ( dividend : in STD_LOGIC_VECTOR (7 downto 0);
           remainder : out STD_LOGIC_VECTOR (5 downto 0);
           quotient : out STD_LOGIC_VECTOR (2 downto 0));
end DIV_CONST;

architecture Behavioral of DIV_CONST is

signal r, r1, r2, r3, r4: integer;
signal q, q1, q2, q3, q4: integer;
signal sel1, sel2, sel3, sel4: std_logic;
constant divider: integer:= 53;

begin
q <= 0;
r <= to_integer(unsigned(dividend));

sel1 <= '1' when (r >= divider) else
        '0';        
r1 <= r - divider when (sel1 = '1') else
      r;
q1 <= (q + 1) when (sel1 = '1') else
      q;
      
      
sel2 <= '1' when (r1 >= divider) else
        '0';        
r2 <= (r1 - divider) when (sel2 = '1') else
      r1;
q2 <= (q1 + 1) when (sel2 = '1') else
      q1;
      
      
sel3 <= '1' when (r2 >= divider) else
        '0';      
r3 <= (r2 - divider) when (sel3 = '1') else
      r2;
q3 <= (q2 + 1) when (sel3 = '1') else
      q2;
      
      
sel4 <= '1' when (r3 >= divider) else
        '0';      
r4 <= (r3 - divider) when (sel4 = '1') else
      r3;
q4 <= (q3 + 1) when (sel4 = '1') else
      q3;

remainder <= std_logic_vector(to_unsigned(r, 6)) when(sel1 = '0') else
             std_logic_vector(to_unsigned(r1, 6)) when(sel1 = '1' and sel2 = '0') else
             std_logic_vector(to_unsigned(r2, 6)) when(sel2 = '1' and sel3 = '0') else
             std_logic_vector(to_unsigned(r3, 6)) when(sel3 = '1' and sel4 = '0') else             
             std_logic_vector(to_unsigned(r4, 6)) when(sel4 = '1');  
             
quotient <=  std_logic_vector(to_unsigned(q, 3)) when(sel1 = '0') else
             std_logic_vector(to_unsigned(q1, 3)) when(sel1 = '1' and sel2 = '0') else
             std_logic_vector(to_unsigned(q2, 3)) when(sel2 = '1' and sel3 = '0') else
             std_logic_vector(to_unsigned(q3, 3)) when(sel3 = '1' and sel4 = '0') else             
             std_logic_vector(to_unsigned(q4, 3)) when(sel4 = '1');  
    
end Behavioral;
