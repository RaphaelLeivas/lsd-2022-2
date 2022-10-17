-- Componente 1 da Atividade pratica da Guia de Aula 07
-- Exercicio 6, pagina 87 do livro Free Range VHDL (2018)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx6 is
  port (
    S, T, R, CLK : in std_logic;
    Q, Q_NOT : out std_logic);
end ComponentEx6;

architecture arch_ComponentEx6 of ComponentEx6 is
  signal Q_tmp : std_logic; -- sinal intermediario de saida
begin
  dff : process (CLK, R, S) -- R e S sao assincronos
  begin
    if (S = '0') then -- S tem precendencia sobre R
      Q_tmp <= '1';
    elsif (R = '0') then
      Q_tmp <= '0';
    elsif (rising_edge(CLK)) then
      Q_tmp <= T xor Q_tmp;
    end if;
  end process dff;

  Q <= Q_tmp;
  Q_NOT <= not Q_tmp;
end arch_ComponentEx6;