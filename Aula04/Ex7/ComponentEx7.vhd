-- Componente do Exercício 7 página 69
-- Decoder 3 : 8, com Enable ativo em low, entradas ativas em nível high, e saídas ativas em nível low.
-- Resolver com tanto CASE quanto usandd IF - ELSIF
-- Livro Free Range VHDL por Bryan Mealy e Fabrizio Tappero, 2018

library ieee;
use ieee.std_logic_1164.all;

entity ComponentEx7 is
  port (
    a : in std_logic_vector(2 downto 0);
    e : in std_logic;
    y : out std_logic_vector(7 downto 0));
end ComponentEx7;

architecture fluxo_de_dados of ComponentEx7 is
begin
  myComponentEx7 : process (a, e)
  begin
    -- USANDO IF - ELSIF
    if (e = '1') then
      y <= "11111111"; -- todas saídas desativas
    else 
      if (a = "000") then y <= "11111110";
      elsif (a = "001") then y <= "11111101";
      elsif (a = "010") then y <= "11111011";
      elsif (a = "011") then y <= "11110111";
      elsif (a = "100") then y <= "11101111";
      elsif (a = "101") then y <= "11011111";
      elsif (a = "110") then y <= "10111111";
      elsif (a = "111") then y <= "01111111";
      else y <= "11111111"; -- todas saídas desativas
      end if;
    end if;

    -- USANDO CASE
    -- case (e) is
    --   when '1' => y <= "11111111"; -- todas saídas desativas
    --   when '0' =>
    --     case (a) is
    --       when "000" => y <= "11111110";
    --       when "001" => y <= "11111101";
    --       when "010" => y <= "11111011";
    --       when "011" => y <= "11110111";
    --       when "100" => y <= "11101111";
    --       when "101" => y <= "11011111";
    --       when "110" => y <= "10111111";
    --       when "111" => y <= "01111111";
    --       when others => y <= "11111111"; -- todas saídas desativas
    --     end case;
    --   when others => y <= "11111111"; -- todas saídas desativas
    -- end case;
  end process myComponentEx7;
end fluxo_de_dados;