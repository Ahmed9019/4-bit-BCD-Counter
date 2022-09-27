library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_count is
    Port ( 
           clk,rst,updown : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (3 downto 0)
           );
end updown_count;

architecture Behavioral of updown_count is

signal temp:std_logic_vector(3 downto 0):="0000";

begin
process(clk,rst)
begin

if(rst='1')then
   temp<="0000";
elsif(rising_edge(clk))then
   if(updown='0')then
        temp<=temp+1;
        if(temp="1001" or temp="1010" or temp="1011" or temp="1100" or temp="1101" or temp="1110" or temp="1111" )then
                 temp<="0000" ;
        end if ;
   else
        temp<=temp-1;
        if(temp="0000" or temp="1010" or temp="1011" or temp="1100" or temp="1101" or temp="1110" or temp="1111" )then
                 temp<="1001" ;
        end if ;
   end if;
end if;
end process;

count<=temp;
end Behavioral;