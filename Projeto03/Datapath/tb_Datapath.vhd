library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Datapath is
end tb_Datapath;

architecture arch_tb_Datapath of tb_Datapath is

  component Datapath is
    port (
      clk : in std_logic;
      enter_num, enter_opr, reset : in std_logic;
      is_empty0, is_empty1, is_empty2 : in std_logic;
      load_stack0, load_stack1, load_stack2 : out std_logic;
      clear_stack0, clear_stack1, clear_stack2 : out std_logic;
      select_alu_num : out std_logic;
      select_stack_pos, select_two_stack_pos : out std_logic_vector(2 downto 0)
    );
  end component;

  constant PERIODO : time := 20 ns; -- 50MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal tb_enter_num, tb_enter_opr, tb_reset : std_logic;
  signal tb_is_empty0, tb_is_empty1, tb_is_empty2 : std_logic;
  signal tb_load_stack0, tb_load_stack1, tb_load_stack2 : std_logic;
  signal tb_clear_stack0, tb_clear_stack1, tb_clear_stack2 : std_logic;
  signal tb_select_alu_num : std_logic;
  signal tb_select_stack_pos, tb_select_two_stack_pos : std_logic_vector(2 downto 0);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 80 * PERIODO;

  -- instanciação do DUT
  DUT : Datapath port map(
    clk => ENT_CLK,
    enter_num => tb_enter_num,
    enter_opr => tb_enter_opr,
    reset => tb_reset,
    is_empty0 => tb_is_empty0,
    is_empty1 => tb_is_empty1,
    is_empty2 => tb_is_empty2,
    load_stack0 => tb_load_stack0,
    load_stack1 => tb_load_stack1,
    load_stack2 => tb_load_stack2,
    clear_stack0 => tb_clear_stack0,
    clear_stack1 => tb_clear_stack1,
    clear_stack2 => tb_clear_stack2,
    select_alu_num => tb_select_alu_num,
    select_stack_pos => tb_select_stack_pos,
    select_two_stack_pos => tb_select_two_stack_pos
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    -- inicializa entradas tudas para remover variaveis de erro
    tb_enter_num <= '0';
    tb_enter_opr <= '0';
    tb_reset <= '0';
    tb_is_empty0 <= '0';
    tb_is_empty1 <= '0';
    tb_is_empty2 <= '0';

    wait for 5 * PERIODO;
    -- entro com um numero
    tb_enter_num <= '1';
    wait for 5 * PERIODO;
    tb_enter_num <= '0';
    wait for 5 * PERIODO;

    -- entro com outro numero
    tb_enter_num <= '1';
    wait for 5 * PERIODO;
    tb_enter_num <= '0';
    wait for 5 * PERIODO;

    -- operacao
    tb_enter_opr <= '1';
    wait for 5 * PERIODO;
    tb_enter_opr <= '0';
    wait for 5 * PERIODO;

    tb_reset <= '1';

    wait;
  end process stimulus;
end arch_tb_Datapath;