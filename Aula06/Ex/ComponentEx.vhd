-- Componente da Atividade pratica da Guia de Aula 06
-- ALU de 8 bits com 6 operacoes selecionaveis

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx is
  port (
    a, b : in std_logic_vector(7 downto 0);
    s : in std_logic_vector(2 downto 0);
    o : out std_logic_vector(7 downto 0);
    co : out std_logic
  );
end ComponentEx;

architecture arch_ComponentEx of ComponentEx is
begin
  process_ComponentEx1 : process (a, b, s)
    variable signedTemp : signed(8 downto 0) := '0' & (signed(a) + signed(b));
    variable unsignedTemp : unsigned(8 downto 0) := '0' & (unsigned(a) + unsigned(b));
  begin
    -- ainda falta entender o que fazer com o carry out CO da ALU

    case (s) is
      when "000" =>
        -- somador com sinal
        o <= std_logic_vector(signed(a) + signed(b));
        -- co <= signedTemp(8);

      when "001" =>
        -- somador sem sinal
        o <= std_logic_vector(unsigned(a) + unsigned(b));
        -- co <= unsignedTemp(8);

      when "010" =>
        -- subtrator
        o <= std_logic_vector(signed(a) - signed(b));

      when "011" =>
        -- OR bit a bit
        o <= a or b;

      when "100" =>
        -- AND bit a bit
        o <= a and b;

      when "101" =>
        -- XOR bit a bit
        o <= a xor b;

      when others =>
        -- faz XOR bit a bit para os outros casos
        o <= a xor b;
    end case;
  end process process_ComponentEx1;
end arch_ComponentEx;