library IEEE;
use IEEE.std_logic_1164.all;

entity Datapath is
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
end Datapath;

architecture arch_Datapath of Datapath is
  type state_type is (RESET_BOOT, WAIT_ENTER, UPDATE_NUM, WAIT_ENTER_NUM_DOWN, EXECUTE_OPERATION, WAIT_ENTER_OPR_DOWN);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is
  "000 001 010 011 100 101";
  signal PS, NS : state_type;
  signal Y : std_logic_vector(2 downto 0); -- signal para os proximos estados da FSM

  -- signals internos do bloco datapath
  signal stack2_in, stack1_in, stack0_in, stack2_out, stack1_out, stack0_out : std_logic_vector(3 downto 0);
  signal alu_num1, alu_num2, result_alu : std_logic_vector(3 downto 0);

  component ALU is
    port (
      OPERATOR : in std_logic_vector(1 downto 0);
      NUM1, NUM2 : in std_logic_vector(3 downto 0);
      RESULT : out std_logic_vector(3 downto 0)
    );
  end component;

  component SelectorALU_NUM is
    port (
      X0, X1 : in std_logic_vector(3 downto 0);
      sel0 : in std_logic;
      sel1 : in std_logic_vector(2 downto 0);
      Y0, Y1, Y2 : out std_logic_vector(3 downto 0)
    );
  end component;

  component SelectorTwoStack is
    port (
      X0, X1, X2 : in std_logic_vector(3 downto 0);
      sel : in std_logic_vector(2 downto 0);
      Y0, Y1 : out std_logic_vector(3 downto 0)
    );
  end component;

  component StackRegister is
    port (
      X : in std_logic_vector(3 downto 0);
      load, clear, clk : in std_logic;
      isEmpty : out std_logic;
      Z : out std_logic_vector(3 downto 0)
    );
  end component;

begin
  inputSelector : SelectorALU_NUM port map(
    X0 => result_alu,
    X1 => num,
    sel0 => sel_alu_num,
    sel1 => sel_stack_pos,
    Y0 => stack0_in,
    Y1 => stack1_in,
    Y2 => stack2_in
  );

  stack0 : StackRegister port map(
    clk => clk,
    X => stack0_in,
    load => load_stack0,
    clear => clear_stack0,
    isEmpty => isEmpty_stack0,
    Z => stack0_out
  );

  stack1 : StackRegister port map(
    clk => clk,
    X => stack1_in,
    load => load_stack1,
    clear => clear_stack1,
    isEmpty => isEmpty_stack1,
    Z => stack1_out
  );

  stack2 : StackRegister port map(
    clk => clk,
    X => stack2_in,
    load => load_stack2,
    clear => clear_stack2,
    isEmpty => isEmpty_stack2,
    Z => stack2_out
  );

  outputSelector : SelectorTwoStack port map(
    X0 => stack0_out,
    X1 => stack1_out,
    X2 => stack2_out,
    sel => sel_two_stack_pos,
    Y0 => alu_num1,
    Y1 => alu_num2
  );

  stackALU : ALU port map(
    OPERATOR => opr,
    NUM1 => alu_num1, 
    NUM2 => alu_num2,
    RESULT => result_alu
  );

  result_output <= alu_num1;

end arch_Datapath;