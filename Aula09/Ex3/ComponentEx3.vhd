-- Componente da Atividade pratica da Guia de Aula 09
-- Exercicio 3 item (b) pagina 132 livro Free Range VHDL

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx3 is
  port (
    A, B, C : in std_logic;
    F : out std_logic
  );
end ComponentEx3;

architecture arch_ComponentEx3 of ComponentEx3 is
  -- puxa o decoder feito no outro arquivo
  component Decoder3x8 is
    port (
      DEC_INPUT : in std_logic_vector(2 downto 0);
      DEC_EN : in std_logic;
      DEC_OUT : out std_logic_vector(7 downto 0)
    );
  end component;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_BUS : std_logic_vector(7 downto 0);
  signal INTERNAL_DEC_ENABLE : std_logic;

begin
  INTERNAL_DEC_ENABLE <= '0'; -- sempre ativado por enquanto

  -- mapeia do decoder para o ComponentEx3 (alto nivel)
  my_dec : Decoder3x8 port map(
    DEC_INPUT(2) => A,
    DEC_INPUT(1) => B,
    DEC_INPUT(0) => C,
    DEC_OUT => INTERNAL_BUS,
    DEC_EN => INTERNAL_DEC_ENABLE
  );

  F <=
    INTERNAL_BUS(0) or
    INTERNAL_BUS(1) or
    INTERNAL_BUS(3) or
    INTERNAL_BUS(4);

end arch_ComponentEx3;