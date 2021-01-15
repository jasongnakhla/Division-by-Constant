----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2019 07:58:16 PM
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

--use ieee.std_logic_arith.all

entity DIV_CONST is
    Port ( dividend : in STD_LOGIC_VECTOR (7 downto 0);
           remainder : out STD_LOGIC_VECTOR (5 downto 0);
           quotient : out STD_LOGIC_VECTOR (2 downto 0));
end DIV_CONST;

architecture Behavioral of DIV_CONST is
Signal r, r1, r2, r3, r4, r5: integer;
Signal q, q1, q2, q3, q4, q5: integer;
signal sel1, sel2, sel3, sel4: std_logic;
constant divider: integer := 53;

begin
process(dividend, r, q, r1, q1, r2, q2, r3, q3, r4, q4)
    begin
    
q <= 0;
r <= to_integer(unsigned(dividend));

-- First MUX    
    if (r >= divider) then
        sel1 <= '1';
    else    
        sel1 <= '0';
    end if;
    
    if (sel1 = '1') then
        q1 <= q + 1;
        r1 <= r - divider;
    else
        q1 <= q;
        r1 <= r;
    end if;
    
    
-- Second MUX 
    if (r1 >= divider) then
        sel2 <= '1';
    else    
        sel2 <= '0';
    end if;
    
    if (sel2 = '1') then
        q2 <= q1 + 1;
        r2 <= r1 - divider;
    else
        q2 <= q1;
        r2 <= r1;
    end if;
    
    
-- Third MUX 
    if (r2 >= divider) then
        sel3 <= '1';
    else    
        sel3 <= '0';
    end if;
    
    if (sel3 = '1') then
        q3 <= q2 + 1;
        r3 <= r2 - divider;
    else
        q3 <= q2;
        r3 <= r2;
    end if;
    
    
-- Fourth MUX 
    if (r3 >= divider) then
        sel4 <= '1';
    else    
        sel4 <= '0';
    end if;
    
    if (sel4 = '1') then
        q4 <= q3 + 1;
        r4 <= r3 - divider;
    else
        q4 <= q3;
        r4 <= r3;
    end if;
    

    if (sel1 = '0') then
        remainder <= std_logic_vector(to_unsigned(r,6));
    elsif (sel1='1' and sel2='0') then
        remainder <= std_logic_vector(to_unsigned(r1,6));
    elsif (sel2='1' and sel3='0') then
        remainder <= std_logic_vector(to_unsigned(r2,6));
    elsif (sel3='1' and sel4='0') then
        remainder <= std_logic_vector(to_unsigned(r3,6));
    elsif (sel4 = '1') then
        remainder <= std_logic_vector(to_unsigned(r4,6));
    end if;
    
    if (sel1 = '0') then
        quotient <= std_logic_vector(to_unsigned(q,3));
    elsif (sel1='1' and sel2='0') then
        quotient <= std_logic_vector(to_unsigned(q1,3));
    elsif (sel2='1' and sel3='0') then
        quotient <= std_logic_vector(to_unsigned(q2,3));
    elsif (sel3='1' and sel4='0') then
        quotient <= std_logic_vector(to_unsigned(q3,3));
    elsif (sel4 = '1') then
        quotient <= std_logic_vector(to_unsigned(q4,3));
    end if;
    
    
end process; 
    
end Behavioral;
