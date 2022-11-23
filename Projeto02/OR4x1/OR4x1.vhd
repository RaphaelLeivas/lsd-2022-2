-- Decoder 3 : 8, com Enable ativo em low, entradas ativas em nível high, e saídas ativas em nível high.
-- Feito com CASE

library ieee;
use ieee.std_logic_1164.all;

entity OR4x1 is
  port (
    OR_INPUT : in std_logic_vector(3 downto 0);
    OR_OUT : out std_logic);
end OR4X1;

architecture arch_OR4x1 of OR4x1 is
begin
  OR_OUT <= OR_INPUT(0) OR OR_INPUT(1) or OR_INPUT(2) or OR_INPUT(3);
end arch_OR4x1;
