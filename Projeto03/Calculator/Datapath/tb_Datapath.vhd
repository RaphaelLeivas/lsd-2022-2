library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Datapath is
end tb_Datapath;

architecture arch_tb_Datapath of tb_Datapath is

  component Datapath is
    port (
      clk : in std_logic;
      num : in std_logic_vector(3 downto 0);
      opr : in std_logic_vector(1 downto 0);
      sel_alu_num : in std_logic;
      sel_two_stack_pos, sel_stack_pos : in std_logic_vector(2 downto 0);
      clear_stack0, clear_stack1, clear_stack2, load_stack0, load_stack1, load_stack2 : in std_logic;
  
      isEmpty_stack0, isEmpty_stack1, isEmpty_stack2 : out std_logic;
      result_output : out std_logic_vector(3 downto 0)
    );
  end component;

  constant PERIODO : time := 20 ns; -- 50MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação

  signal tb_num : std_logic_vector(3 downto 0);
  signal tb_opr : std_logic_vector(1 downto 0);
  signal tb_sel_alu_num : std_logic;
  signal tb_sel_stack_pos : std_logic_vector(2 downto 0);
  signal tb_sel_two_stack_pos : std_logic_vector(2 downto 0);
  signal tb_clear_stack0 : std_logic;
  signal tb_clear_stack1 : std_logic;
  signal tb_clear_stack2 : std_logic;
  signal tb_load_stack0 : std_logic;
  signal tb_load_stack1 : std_logic;
  signal tb_load_stack2 : std_logic;

  signal tb_isEmpty_stack0 : std_logic;
  signal tb_isEmpty_stack1 : std_logic;
  signal tb_isEmpty_stack2 : std_logic;
  signal tb_result_output : std_logic_vector(3 downto 0);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 80 * PERIODO;

  -- instanciação do DUT
  DUT : Datapath port map(
    clk => ENT_CLK,
    num => tb_num,
    opr => tb_opr,
    sel_alu_num => tb_sel_alu_num,
    sel_stack_pos => tb_sel_stack_pos,
    sel_two_stack_pos => tb_sel_two_stack_pos,
    clear_stack0 => tb_clear_stack0,
    clear_stack1 => tb_clear_stack1,
    clear_stack2 => tb_clear_stack2,
    load_stack0 => tb_load_stack0,
    load_stack1 => tb_load_stack1,
    load_stack2 => tb_load_stack2,

    isEmpty_stack0 => tb_isEmpty_stack0,
    isEmpty_stack1 => tb_isEmpty_stack1,
    isEmpty_stack2 => tb_isEmpty_stack2,
    result_output => tb_result_output
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    -- inicializa entradas todas para remover variaveis de erro
    tb_num <= "0101";
    tb_opr <= "00";
    tb_sel_alu_num <= '0';
    tb_sel_stack_pos <= "001";
    tb_sel_two_stack_pos <= "011";
    tb_clear_stack0 <= '0';
    tb_clear_stack1 <= '0';
    tb_clear_stack2 <= '0';
    tb_load_stack0 <= '0';
    tb_load_stack1 <= '0';
    tb_load_stack2 <= '0';

    wait for 5 * PERIODO;
    -- entro com um numero
    tb_num <= "1010";
    -- wait for 5 * PERIODO;
    -- tb_enter_num <= '0';
    -- wait for 5 * PERIODO;

    -- -- entro com outro numero
    -- tb_enter_num <= '1';
    -- wait for 5 * PERIODO;
    -- tb_enter_num <= '0';
    -- wait for 5 * PERIODO;

    -- -- operacao
    -- tb_enter_opr <= '1';
    -- wait for 5 * PERIODO;
    -- tb_enter_opr <= '0';
    -- wait for 5 * PERIODO;

    -- tb_reset <= '1';

    wait;
  end process stimulus;
end arch_tb_Datapath;