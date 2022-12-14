library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_FSM is
end tb_FSM;

architecture arch_tb_FSM of tb_FSM is

  component FSM is
    port (
      CLK_FSM : in std_logic;
      X : in std_logic; -- entrada da FSM
      Z0, Z1, Z2, Z3, Z4, Z5 : out std_logic_vector(0 to 7)); -- saidas efetivas da FSM
  end component;

  constant PERIODO : time := 20 ns; -- 50MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal ENT_X : std_logic; 
  signal SAI_Z0, SAI_Z1, SAI_Z2, SAI_Z3, SAI_Z4, SAI_Z5 : std_logic_vector(0 to 7);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 50 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : FSM port map(
    CLK_FSM => ENT_CLK,
    X => ENT_X,
    Z0 => SAI_Z0,
    Z1 => SAI_Z1,
    Z2 => SAI_Z2,
    Z3 => SAI_Z3,
    Z4 => SAI_Z4,
    Z5 => SAI_Z5
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    ENT_X <= '0';
    wait for 25 * PERIODO;
    ENT_X <= '1';
    wait for 10 * PERIODO;
    ENT_X <= '0';

    wait;
  end process stimulus;
end arch_tb_FSM;