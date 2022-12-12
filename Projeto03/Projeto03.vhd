library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Projeto03 is
  port (
    CLK_50MHz : in std_logic;
    RST, ENTER_NUM, ENTER_OPR : in std_logic;
    NUM : in std_logic_vector(3 downto 0);
    OPR : in std_logic_vector(1 downto 0);
    -- Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
    Z0 : out std_logic_vector(0 to 3)); -- para teste no projeto reduzido
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
      RST, ENTER_NUM, ENTER_OPR : in std_logic;
      NUM : in std_logic_vector(3 downto 0);
      OPR : in std_logic_vector(1 downto 0);
      -- Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
      Z0 : out std_logic_vector(0 to 3)); -- para teste no projeto reduzido
  end component Calculator;

  -- signals intermediarios (internos ao componente de alto nivel)
  signal INTERNAL_CLK : std_logic;

begin
  my_ClockDivider : ClockDivider 
  generic map(
    INPUT_FREQUENCY => 50000000, -- 50MHz
    OUTPUT_FREQUENCY => 25000000 -- 25MHz  -> PARA TESTBENCH  
    -- OUTPUT_FREQUENCY => 2 -- 2Hz -> PARA FPGA  
  )
  port map(
    CLK_INPUT => CLK_50MHz,
    CLK_OUTPUT => INTERNAL_CLK
  );

  my_Calculator : Calculator port map(
    CLK => INTERNAL_CLK,
    RST => RST,
    ENTER_NUM => ENTER_NUM,
    ENTER_OPR => ENTER_OPR,
    NUM => NUM,
    OPR => OPR,
    Z0 => Z0
    -- Z1 => SAI_Z1,
    -- Z2 => SAI_Z2,
    -- Z3 => SAI_Z3
  );

end arch_Projeto03;