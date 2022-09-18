-- Componente do Exercício 1 (a) página 48 
-- Livro Free Range VHDL por Bryan Mealy e Fabrizio Tappero, 2018

library ieee;
use ieee.std_logic_1164.all;

entity comp_ex1 is
  port (
    a, b : in std_logic;
    f : out std_logic);
end comp_ex1;

architecture fluxo_de_dados of comp_ex1 is
begin
  f <= (not a and b) or (a) or (a and not b);
end fluxo_de_dados;
