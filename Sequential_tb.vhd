----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/09/2019 01:48:35 PM
-- Design Name: 
-- Module Name: DIV_CONST_tb - Behavioral
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

entity DIV_CONST_tb is
--  Port ( );
end DIV_CONST_tb;

architecture Behavioral of DIV_CONST_tb is

signal d_in: STD_LOGIC_VECTOR (7 downto 0);
signal r_out: STD_LOGIC_VECTOR (5 downto 0);
signal q_out: STD_LOGIC_VECTOR (2 downto 0);

component DIV_CONST is
Port ( dividend : in STD_LOGIC_VECTOR (7 downto 0);
       remainder : out STD_LOGIC_VECTOR (5 downto 0);
       quotient : out STD_LOGIC_VECTOR (2 downto 0));
end component;

begin

UUT: DIV_CONST
port map (dividend => d_in, remainder => r_out, quotient => q_out);

STIM : process

    begin
    
    -- 255
    d_in <= "11111111";
    wait for 10ns;
    
    -- 183
    d_in <= "10110111";
    wait for 10ns;
    
    -- 127
    d_in <= "01111111";
    wait for 10ns;
    
    -- 61
    d_in <= "00111101";
    wait for 10ns;
    
    -- 53
    d_in <= "00110101";
    wait for 10ns;
    
    -- 52     
    d_in <= "00110100";
    wait for 10ns;
    
    -- 21
    d_in <= "00010101";
    wait;

    
 end process STIM; 
    
end Behavioral; 




