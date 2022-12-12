library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Calculator is
end tb_Calculator;

architecture arch_tb_Calculator of tb_Calculator is

  component Calculator is
    port (
      CLK : in std_logic;
      RST, ENTER_NUM, ENTER_OPR : in std_logic;
      NUM : in std_logic_vector(3 downto 0);
      OPR : in std_logic_vector(1 downto 0);
      -- Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
      Z0 : out std_logic_vector(0 to 3)); -- para teste no modelo reduzido
  end component;

  constant PERIODO : time := 20 ns; -- 50MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação

  signal tb_RST, tb_ENTER_NUM, tb_ENTER_OPR : std_logic;
  signal tb_NUM : std_logic_vector(3 downto 0);
  signal tb_OPR : std_logic_vector(1 downto 0);
  signal tb_Z0 : std_logic_vector(0 to 3); 

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 50 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : Calculator port map(
    CLK => ENT_CLK,
    RST => tb_RST,
    ENTER_NUM => tb_ENTER_NUM,
    ENTER_OPR => tb_ENTER_OPR,
    NUM => tb_NUM,
    OPR => tb_OPR,
    Z0 => tb_Z0
    -- Z1 => SAI_Z1,
    -- Z2 => SAI_Z2,
    -- Z3 => SAI_Z3
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    tb_RST <= '0';
    tb_ENTER_NUM <= '0';
    tb_ENTER_OPR<= '0';

    tb_NUM <= "0010";
    tb_OPR <= "00";
    wait for 5 * PERIODO;

    tb_ENTER_NUM <= '1';
    wait for 5 * PERIODO;

    tb_ENTER_NUM <= '0';
    wait for 5 * PERIODO;

    tb_NUM <= "0011";
    wait for 5 * PERIODO;

    tb_ENTER_NUM <= '1';
    wait for 5 * PERIODO;

    tb_ENTER_NUM <= '0';
    wait for 5 * PERIODO;

    tb_ENTER_OPR <= '1';
    wait for 5 * PERIODO;
    tb_ENTER_OPR <= '0';
    wait for 5 * PERIODO;

    wait;
  end process stimulus;
end arch_tb_Calculator;