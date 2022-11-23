library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ClockDivider is
end tb_ClockDivider;

architecture arch_tb_ClockDivider of tb_ClockDivider is

  component ClockDivider is
    port (
      clk_50Mhz : in std_logic;
      clk_2Hz : out std_logic
    );
  end component;

  constant PERIODO : time := 10 ns;
  signal ent_clk : std_logic := '0'; -- deve ser inicializado
  signal ent_clk_enable : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal sai_clk_2Hz : std_logic;

begin
  -- geração do clock com periodo PERIODO
  ent_clk <= ent_clk_enable and not ent_clk after PERIODO/2;
  ent_clk_enable <= '1', '0' after 40 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT, que nesse exemplo é um ffd
  DUT : ClockDivider port map(
    clk_50Mhz => ent_clk,
    clk_2Hz => sai_clk_2Hz
  );

end arch_tb_ClockDivider;