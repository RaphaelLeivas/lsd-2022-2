-- Componente da Atividade prática da Guia de Aula 05
-- f(x) = r * x * not(x)
-- r = 2.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx is
  port (
    x : in std_logic_vector(3 downto 0);
    f : out unsigned(7 downto 0));
end ComponentEx;

architecture arch_ComponentEx of ComponentEx is
begin
  f <= unsigned(x) sll to_integer(unsigned(x)); -- shift left equivale a multiplicar por dois
end arch_ComponentEx;