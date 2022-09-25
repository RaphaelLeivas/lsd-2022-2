-- Componente do Exercício 1 (b) página 68
-- a expressão booleana da questão pode ser reduzida para
-- F(A,B,C,D) = CB' + CD'
-- Resolver com tanto CASE quanto usando IF - ELSIF
-- Livro Free Range VHDL por Bryan Mealy e Fabrizio Tappero, 2018

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx1 is
  port (
    a, b, c, d : in std_logic;
    f : out std_logic);
end ComponentEx1;

architecture arch_ComponentEx1 of ComponentEx1 is
begin
  process_ComponentEx1 : process (a, b, c, d)
  begin
    -- USANDO IF ELSIF
    -- if (c = '1' and b = '0') then f <= '1';
    -- elsif (d = '1' and c = '0') then f <= '1';
    -- else f <= '0';
    -- end if;

    -- USANDO CASE
    case (c) is
      when '1' =>
        case (b) is
          when '0' => f <= '1';
          when others => f <= '0';
        end case;

        case (d) is
          when '0' => f <= '1';
          when others => f <= '0';
        end case;
      when others => f <= '0';
    end case;
  end process process_ComponentEx1;
end arch_ComponentEx1;