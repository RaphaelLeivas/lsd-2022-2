-- Componente 1 da Atividade pratica da Guia de Aula 07
-- Exercicio 2, pagina 86 do livro Free Range VHDL (2018)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx2 is
  port (
    S, D, R, CLK : in std_logic;
    Q, Q_NOT : out std_logic);
end ComponentEx2;

architecture arch_ComponentEx2 of ComponentEx2 is
begin
  dff : process (CLK, R, S) -- R e S sao assincronos
  begin
    if (S = '0') then -- S tem precendencia sobre R
      Q <= '1';
      Q_NOT <= '0';
    elsif (R = '0') then
      Q <= '0';
      Q_NOT <= '1';
    elsif (rising_edge(CLK)) then
      Q <= D;
      Q_NOT <= not D;
    end if;
  end process dff;
end arch_ComponentEx2;