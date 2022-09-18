-- Componente do Exercício 2 (a) página 48 
-- Livro Free Range VHDL por Bryan Mealy e Fabrizio Tappero, 2018

library ieee;
use ieee.std_logic_1164.all;

entity comp_ex2 is
  port (
    a, b, c, d : in std_logic;
    f : out std_logic);
end comp_ex2;

architecture fluxo_de_dados of comp_ex2 is
begin
  f <= (not a and c and not d) or (not b and c) or (b and c and not d);
end fluxo_de_dados;