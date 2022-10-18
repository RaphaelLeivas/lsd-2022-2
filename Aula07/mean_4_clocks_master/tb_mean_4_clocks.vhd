library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_mean_4_clocks is
end tb_mean_4_clocks;

architecture arch_tb_mean_4_clocks of tb_mean_4_clocks is

  component mean_4_clocks is
    generic (
      W : integer := 32
    );
    port (
      CLK : in std_logic;
      RESET : in std_logic;
      INPUT : in std_logic_vector(W - 1 downto 0);
      OUTPUT : out std_logic_vector(W - 1 downto 0)
    );
  end component;

  constant PERIODO : time := 10 ns;
  constant W : integer := 32;
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal ENT_RESET : std_logic;
  signal ENT_INPUT : std_logic_vector(W - 1 downto 0);
  signal SAI_OUPUT : std_logic_vector(W - 1 downto 0);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 20 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT, que nesse exemplo é um ffd
  DUT : mean_4_clocks port map(
    CLK => ENT_CLK,
    RESET => ENT_RESET,
    INPUT => ENT_INPUT,
    OUTPUT => SAI_OUPUT);
  -- a partir daqui declaro os estímulos de entrada, ou a injecao de sinais
  -- um process para o reset
  reset : process
  begin
    ENT_RESET <= '0';
    wait for 1 * PERIODO; -- um reset de duração de 1 períodos de clock
    ENT_RESET <= '0';

    wait;
  end process reset;
  -- um outro process para os estímulos da entrada D
  stimulus : process
  begin
    ENT_INPUT <= x"00000002";
    wait for 1 * PERIODO;
    ENT_INPUT <= x"00000004";
    wait for 1 * PERIODO;
    ENT_INPUT <= x"00000006";
    wait for 1 * PERIODO;
    ENT_INPUT <= x"00000008";
    wait;
  end process stimulus;
end arch_tb_mean_4_clocks;