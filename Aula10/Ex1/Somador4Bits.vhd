-- Somador 4 bits com carry out

library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Somador4Bits is
  port (
    A, B : in std_logic_vector(3 downto 0);
    F : out std_logic_vector(3 downto 0);
    CO : out std_logic);
end Somador4Bits;

architecture arch_Somador4Bits of Somador4Bits is
  signal TEMP : unsigned(4 downto 0);
  begin
    TEMP <= '0' & unsigned(A) + unsigned(B);
    F <= std_logic_vector(TEMP(3 downto 0));
    CO <= TEMP(4);
end arch_Somador4Bits;