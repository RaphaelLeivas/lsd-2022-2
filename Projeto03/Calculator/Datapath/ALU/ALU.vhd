
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity ALU is
  port (
    OPERATOR : in std_logic_vector(1 downto 0);
    NUM1, NUM2 : in std_logic_vector(3 downto 0);
    RESULT : out std_logic_vector(3 downto 0)
  );
end ALU;

architecture arch_ALU of ALU is
begin
  operationProcess : process (OPERATOR, NUM1, NUM2)
  begin
    case (OPERATOR) is
      when "00" =>
        RESULT <= std_logic_vector(unsigned(NUM1) + unsigned(NUM2));      
      when "01" =>
        RESULT <= std_logic_vector(unsigned(NUM1) - unsigned(NUM2));      
      when "10" =>
        RESULT <= std_logic_vector(shift_left(unsigned(NUM1), to_integer(unsigned(NUM2)))); 
      when "11" =>
        RESULT <= std_logic_vector(shift_right(unsigned(NUM1), to_integer(unsigned(NUM2))));
      when others => RESULT <= "0000";
    end case;
  end process operationProcess;
end arch_ALU;