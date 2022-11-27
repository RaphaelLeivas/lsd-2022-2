-- CLK_COUNTER_MAX = (1/2) * (fi / fo)
-- fi: freq de entrada do clock. fo: freq de saida do clock

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

entity ClockDivider is
  generic (
    INPUT_FREQUENCY : integer := 50000000; -- 50MHz default
    OUTPUT_FREQUENCY : integer := 2 -- 2Hz default
  );
  port (
    CLK_INPUT : in std_logic;
    CLK_OUTPUT : out std_logic
  );
end ClockDivider;

architecture arch_ClockDivider of ClockDivider is
  signal CLK_AUX : std_logic := '0';

  -- constantes
  constant CLK_COUNTER_MAX : integer := integer(INPUT_FREQUENCY / (2 * OUTPUT_FREQUENCY));
begin

  process (CLK_INPUT, CLK_AUX)
    variable count : integer range 0 to 2 ** 26 - 1;
  begin
    if (rising_edge(CLK_INPUT)) then
      count := count + 1;
      if (count = CLK_COUNTER_MAX) then
        CLK_AUX <= not CLK_AUX;
        count := 0;
      end if;
    end if;
    CLK_OUTPUT <= CLK_AUX;
  end process;
end arch_ClockDivider;