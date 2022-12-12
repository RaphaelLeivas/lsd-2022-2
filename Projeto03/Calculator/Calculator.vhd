library IEEE;
use IEEE.std_logic_1164.all;

entity Calculator is
  port (
    CLK : in std_logic;
    RST, ENTER_NUM, ENTER_OPR : in std_logic;
    NUM : in std_logic_vector(3 downto 0);
    OPR : in std_logic_vector(1 downto 0);
    -- Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
    Z0 : out std_logic_vector(0 to 3)); -- para teste no projeto reduzido
end Calculator;

architecture arch_Calculator of Calculator is
  component ControlBlock is
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

  -- signals intermediarios (conexao entre os blocos)
  signal interm_is_empty0 : std_logic;
  signal interm_is_empty1 : std_logic;
  signal interm_is_empty2 : std_logic;
  signal interm_load_stack0 : std_logic;
  signal interm_load_stack1 : std_logic;
  signal interm_load_stack2 : std_logic;
  signal interm_clear_stack0 : std_logic;
  signal interm_clear_stack1 : std_logic;
  signal interm_clear_stack2 : std_logic;
  signal interm_select_alu_num : std_logic;
  signal interm_select_stack_pos : std_logic_vector(2 downto 0);
  signal interm_select_two_stack_pos  : std_logic_vector(2 downto 0);

begin
  blocoDeControle : ControlBlock port map(
    clk => CLK,
    enter_num => ENTER_NUM,
    enter_opr => ENTER_OPR,
    reset => RST,

    is_empty0 => interm_is_empty0,
    is_empty1 => interm_is_empty1,
    is_empty2 => interm_is_empty2,
    load_stack0 => interm_load_stack0,
    load_stack1 => interm_load_stack1,
    load_stack2 => interm_load_stack2,
    clear_stack0 => interm_clear_stack0,
    clear_stack1 => interm_clear_stack1,
    clear_stack2 => interm_clear_stack2,
    select_alu_num => interm_select_alu_num,
    select_stack_pos => interm_select_stack_pos,
    select_two_stack_pos => interm_select_two_stack_pos
  );

  blocoOperacional : Datapath port map(
    clk => CLK,
    num => NUM,
    opr => OPR,
    result_output => Z0,

    sel_alu_num => interm_select_alu_num,
    sel_stack_pos => interm_select_stack_pos,
    sel_two_stack_pos => interm_select_two_stack_pos,
    clear_stack0 => interm_clear_stack0,
    clear_stack1 => interm_clear_stack1,
    clear_stack2 => interm_clear_stack2,
    load_stack0 => interm_load_stack0,
    load_stack1 => interm_load_stack1,
    load_stack2 => interm_load_stack2,

    isEmpty_stack0 => interm_is_empty0,
    isEmpty_stack1 => interm_is_empty1,
    isEmpty_stack2 => interm_is_empty2
  );


end arch_Calculator;