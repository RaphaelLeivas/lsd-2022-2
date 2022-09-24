-- Componente do Exercício 1 (a) página 48 
-- Livro Free Range VHDL por Bryan Mealy e Fabrizio Tappero, 2018

library ieee;
use ieee.std_logic_1164.all;

entity ComponentEx7 is
  port (
    a : in std_logic_vector(3 downto 0);
    e : in std_logic;
    y : out std_logic_vector(7 downto 0));
end ComponentEx7;

architecture fluxo_de_dados of ComponentEx7 is
begin
  myComponentEx7 : process (a, e, y)
  begin
    if (e = '0') then
      y <= "00000000";
    else y <= "11111111";
    end if;

  end process myComponentEx1;
end fluxo_de_dados;