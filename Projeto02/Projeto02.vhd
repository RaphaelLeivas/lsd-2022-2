-- Componente da Atividade pratica da Guia de Aula 09
-- Exercicio 3 item (b) pagina 132 livro Free Range VHDL

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto02 is
  port (
    A, B, C : in std_logic;
    F : out std_logic
  );
end Projeto02;

architecture arch_Projeto02 of Projeto02 is
  -- puxa o decoder feito no outro arquivo
  component Decoder3x8 is
    port (
      DEC_INPUT : in std_logic_vector(2 downto 0);
      DEC_EN : in std_logic;
      DEC_OUT : out std_logic_vector(7 downto 0)
    );
  end component;

  component OR4x1 is
    port (
      OR_INPUT : in std_logic_vector(3 downto 0);
      OR_OUT : out std_logic);
  end component OR4x1;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_BUS : std_logic_vector(7 downto 0);
  signal INTERNAL_DEC_ENABLE : std_logic;

begin
  INTERNAL_DEC_ENABLE <= '0'; -- sempre ativado por enquanto

  -- mapeia do decoder para o Projeto02 (alto nivel)
  my_dec : Decoder3x8 port map(
    DEC_INPUT(2) => A,
    DEC_INPUT(1) => B,
    DEC_INPUT(0) => C,
    DEC_OUT => INTERNAL_BUS,
    DEC_EN => INTERNAL_DEC_ENABLE
  );

  my_or : OR4x1 port map(
   OR_INPUT(0) => INTERNAL_BUS(0),
   OR_INPUT(1) => INTERNAL_BUS(1),
   OR_INPUT(2) => INTERNAL_BUS(3),
   OR_INPUT(3) => INTERNAL_BUS(4),
   OR_OUT => F
  );

  

end arch_Projeto02;