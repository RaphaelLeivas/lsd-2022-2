-- CLK_COUNTER_MAX = (1/2) * (fo / fd)
-- fo: freq original do clock. fd: freq desejada do clock

library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider is
  port (
    CLK_INPUT : in std_logic;
    CLK_OUTPUT : out std_logic
  );
end ClockDivider;

architecture arch_ClockDivider of ClockDivider is
  signal CLK_AUX : std_logic := '0';

  -- constantes
  constant CLK_COUNTER_MAX : integer := 12499999;
  constant TESTBENCH_CLK_COUNTER_MAX : integer := 5;
begin

  -- converte clock de 50Mhz na entrada para 2Hz na saida
  -- process (CLK_INPUT, CLK_AUX)
  --   variable count : integer range 0 to 2 ** 26 - 1;
  -- begin
  --   if (rising_edge(CLK_INPUT)) then
  --     count := count + 1;
  --     if (count = CLK_COUNTER_MAX) then
  --       CLK_AUX <= not CLK_AUX;
  --       count := 0;
  --     end if;
  --   end if;
  --   CLK_OUTPUT <= CLK_AUX;
  -- end process;

  -- para fins exclusivos de testbench: converte clock de 50Mhz na entrada para 5MHz na saida
  process (CLK_INPUT, CLK_AUX)
    variable count : integer range 0 to 2 ** 26 - 1;
  begin
    if (rising_edge(CLK_INPUT)) then
      count := count + 1;
      if (count = TESTBENCH_CLK_COUNTER_MAX) then
        CLK_AUX <= not CLK_AUX;
        count := 0;
      end if;
    end if;
    CLK_OUTPUT <= CLK_AUX;
  end process;
end arch_ClockDivider;