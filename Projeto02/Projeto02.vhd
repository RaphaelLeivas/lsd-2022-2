library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto02 is
  port (
    CLK, RESET : in std_logic;
    PROJ_OUT : out std_logic_vector(1 downto 0)
  );
end Projeto02;

architecture arch_Projeto02 of Projeto02 is
  -- puxa o divisor de clock
  component ClockDivider is
    port (
      clk_50Mhz : in std_logic;
      clk_2Hz : out std_logic
    );
  end component;

  -- puxa a FSM
  component FSM is
    port (
      CLK_FSM : in std_logic;
      X : in std_logic; -- entradas da FSM
      Y : out std_logic_vector(2 downto 0); -- saidas para os proximos estados da FSM
      Z : out std_logic_vector(1 downto 0) -- saida efetiva da FSM
    );
  end component FSM;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_CLK_2HZ : std_logic;
  signal INTERNAL_Y : std_logic_vector(2 downto 0);

begin
  my_ClockDivider : ClockDivider port map(
    clk_50Mhz => CLK,
    clk_2Hz => INTERNAL_CLK_2HZ
  );

  my_FSM : FSM port map(
    CLK_FSM => INTERNAL_CLK_2HZ,
    X => RESET,
    Y => INTERNAL_Y,
    Z => PROJ_OUT
  );

end arch_Projeto02;