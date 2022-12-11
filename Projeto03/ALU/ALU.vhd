
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity ALU is
  port (
    COMPUTE : in std_logic;
    OPERATOR : in std_logic_vector(1 downto 0);
    NUM1, NUM2 : in std_logic_vector(3 downto 0);
    RESULT : out std_logic_vector(3 downto 0)
  );
end ALU;

architecture arch_ALU of ALU is
  signal RESULT_INTERM : std_logic_vector(3 downto 0);
begin
  RESULT_INTERM <=
    RESULT_INTERM when COMPUTE = '0' else
    std_logic_vector(unsigned(NUM1) + unsigned(NUM2)) when OPERATOR = "00" else
    std_logic_vector(unsigned(NUM1) - unsigned(NUM2)) when OPERATOR = "01" else
    std_logic_vector(shift_left(unsigned(NUM1), to_integer(unsigned(NUM2)))) when OPERATOR = "10" else
    std_logic_vector(shift_right(unsigned(NUM1), to_integer(unsigned(NUM2)))) when OPERATOR = "11" else
    RESULT_INTERM;

  RESULT <= RESULT_INTERM;
end arch_ALU;