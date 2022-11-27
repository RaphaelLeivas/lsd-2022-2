library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Projeto02 is
end tb_Projeto02;

architecture arch_tb_Projeto02 of tb_Projeto02 is

  component Projeto02 is
    port (
      CLK_50MHz, RESET : in std_logic;
      DISP0, DISP1, DISP2, DISP3, DISP4, DISP5 : out std_logic_vector(0 to 7)
    );
  end component;

  constant PERIODO : time := 20 ns; -- 50 MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal SAI_DISP0, SAI_DISP1, SAI_DISP2, SAI_DISP3, SAI_DISP4, SAI_DISP5 : std_logic_vector(0 to 7);
  signal ENT_RESET : std_logic;

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 300 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : Projeto02 port map(
    CLK_50MHz => ENT_CLK,
    RESET => ENT_RESET,
    DISP0 => SAI_DISP0,
    DISP1 => SAI_DISP1,
    DISP2 => SAI_DISP2,
    DISP3 => SAI_DISP3,
    DISP4 => SAI_DISP4,
    DISP5 => SAI_DISP5
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    ENT_RESET <= '0';
    wait for 220 * PERIODO;
    ENT_RESET <= '1';
    wait for 15 * PERIODO;
    ENT_RESET <= '0';

    wait;
  end process stimulus;

end arch_tb_Projeto02;