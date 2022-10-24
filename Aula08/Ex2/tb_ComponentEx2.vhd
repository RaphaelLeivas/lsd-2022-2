library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ComponentEx2 is
end tb_ComponentEx2;

architecture arch_tb_ComponentEx2 of tb_ComponentEx2 is

  component ComponentEx2 is
    port (
      CLK : in std_logic;
      X : in std_logic_vector(1 downto 0); -- entradas da FSM
      Y : out std_logic_vector(1 downto 0); -- saidas para os proximos estados da FSM
      Z : out std_logic); -- saida efetiva da FSM
  end component;

  constant PERIODO : time := 10 ns;
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal ENT_X : std_logic_vector(1 downto 0); 
  signal SAI_Y : std_logic_vector(1 downto 0);
  signal SAI_Z : std_logic;

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 20 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT, que nesse exemplo é um ffd
  DUT : ComponentEx2 port map(
    CLK => ENT_CLK,
    X => ENT_X,
    Y => SAI_Y,
    Z => SAI_Z
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    ENT_X <= "00";
    wait for 4 * PERIODO;
    ENT_X <= "01";
    wait for 4 * PERIODO;
    ENT_X <= "10";
    wait for 4 * PERIODO;
    ENT_X <= "11";
    wait for 4 * PERIODO;
    wait;
  end process stimulus;
end arch_tb_ComponentEx2;