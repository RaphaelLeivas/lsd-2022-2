-- CLK_COUNTER_MAX = (1/2) * (fo / fd)
-- fo: freq original do clock. fd: freq desejada do clock

library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider is
  port (
    clk_50Mhz : in std_logic;
    clk_2Hz : out std_logic
  );
end ClockDivider;

architecture arch_ClockDivider of ClockDivider is
  signal clk_aux : std_logic := '0';

  -- constantes
  constant CLK_COUNTER_MAX : integer := 12499999;
  constant TESTBENCH_CLK_COUNTER_MAX : integer := 10;
begin

  -- converte clock de 50Mhz na entrada para 2Hz na saida
  -- process (clk_50Mhz, clk_aux)
  --   variable count : integer range 0 to 2 ** 26 - 1;
  -- begin
  --   if (rising_edge(clk_50Mhz)) then
  --     count := count + 1;
  --     if (count = CLK_COUNTER_MAX) then
  --       clk_aux <= not clk_aux;
  --       count := 0;
  --     end if;
  --   end if;
  --   clk_2Hz <= clk_aux;
  -- end process;

  -- para fins exclusivos de testbench: converte clock de 50Mhz na entrada para 5MHz na saida
  process (clk_50Mhz, clk_aux)
    variable count : integer range 0 to 2 ** 26 - 1;
  begin
    if (rising_edge(clk_50Mhz)) then
      count := count + 1;
      if (count = TESTBENCH_CLK_COUNTER_MAX) then
        clk_aux <= not clk_aux;
        count := 0;
      end if;
    end if;
    clk_2Hz <= clk_aux;
  end process;
end arch_ClockDivider;