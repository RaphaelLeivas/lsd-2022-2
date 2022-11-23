library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto02 is
  port (
    CLK_50MHz, RESET : in std_logic;
    DISP0 : out std_logic_vector(0 to 7)
  );
end Projeto02;

architecture arch_Projeto02 of Projeto02 is
  -- puxa o divisor de clock
  component ClockDivider is
    port (
      CLK_INPUT : in std_logic;
      CLK_OUTPUT : out std_logic
    );
  end component;

  -- puxa a FSM
  component FSM is
    port (
      CLK_FSM : in std_logic;
      X : in std_logic; -- entrada da FSM
      Y : out std_logic_vector(2 downto 0); -- saidas para os proximos estados da FSM
      Z0 : out std_logic_vector(0 to 7)); -- saidas efetivas da FSM
  end component FSM;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_CLK_2Hz : std_logic;

begin
  my_ClockDivider : ClockDivider port map(
    CLK_INPUT => CLK_50MHz,
    CLK_OUTPUT => INTERNAL_CLK_2Hz
  );

  my_FSM : FSM port map(
    CLK_FSM => INTERNAL_CLK_2Hz,
    X => RESET,
    Y => open, -- nao e usado pelo componente de alto nivel, apenas pela FSM internamente
    Z0 => DISP0
  );

end arch_Projeto02;