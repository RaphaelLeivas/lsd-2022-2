library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto03 is
  port (
    CLK_50MHz, RESET : in std_logic;
    DISP0, DISP1, DISP2, DISP3, DISP4, DISP5 : out std_logic_vector(0 to 7)
  );
end Projeto03;

architecture arch_Projeto03 of Projeto03 is
  -- puxa o divisor de clock
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

  -- puxa a Calculator
  component Calculator is
    port (
      CLK : in std_logic;
      RST : in std_logic; -- entrada da FSM
      Z0, Z1, Z2, Z3, Z4, Z5 : out std_logic_vector(0 to 7)); -- saidas efetivas da FSM
  end component Calculator;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_CLK : std_logic;

begin
  my_ClockDivider : ClockDivider 
  generic map(
    INPUT_FREQUENCY => 50000000, -- 50MHz
    OUTPUT_FREQUENCY => 5000000 -- 5MHz  -> PARA TESTBENCH  
    -- OUTPUT_FREQUENCY => 2 -- 2Hz -> PARA FPGA  
  )
  port map(
    CLK_INPUT => CLK_50MHz,
    CLK_OUTPUT => INTERNAL_CLK
  );

  my_Calculator : Calculator port map(
    CLK => INTERNAL_CLK,
    RST => RESET,
    Z0 => DISP0,
    Z1 => DISP1,
    Z2 => DISP2,
    Z3 => DISP3,
    Z4 => DISP4,
    Z5 => DISP5
  );

end arch_Projeto03;