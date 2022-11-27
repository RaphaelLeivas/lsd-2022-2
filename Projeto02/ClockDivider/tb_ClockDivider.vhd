library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ClockDivider is
end tb_ClockDivider;

architecture arch_tb_ClockDivider of tb_ClockDivider is

  component ClockDivider is
    generic (
      INPUT_FREQUENCY : integer := 50000000; -- 50MHz default
      OUTPUT_FREQUENCY : integer := 2 -- 2Hz default
    );
    port (
      CLK_INPUT : in std_logic;
      CLK_OUTPUT : out std_logic
    );
  end component;

  constant PERIODO : time := 20 ns; -- 50 MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal SAI_CLK_OUTPUT : std_logic;

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 40 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : ClockDivider 
  generic map(
    INPUT_FREQUENCY => 50000000, -- 50MHz
    OUTPUT_FREQUENCY => 5000000 -- 5MHz  -> PARA TESTBENCH  
    -- OUTPUT_FREQUENCY => 2 -- 2Hz -> PARA FPGA  
  )
  port map(
    CLK_INPUT => ENT_CLK,
    CLK_OUTPUT => SAI_CLK_OUTPUT
  );

end arch_tb_ClockDivider;