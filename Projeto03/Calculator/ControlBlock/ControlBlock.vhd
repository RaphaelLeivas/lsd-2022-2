library IEEE;
use IEEE.std_logic_1164.all;

entity ControlBlock is
  port (
    clk : in std_logic;
    enter_num, enter_opr, reset : in std_logic;
    is_empty0, is_empty1, is_empty2 : in std_logic;
    load_stack0, load_stack1, load_stack2 : out std_logic;
    clear_stack0, clear_stack1, clear_stack2 : out std_logic;
    select_alu_num : out std_logic;
    select_stack_pos, select_two_stack_pos : out std_logic_vector(2 downto 0)
  );
end ControlBlock;

architecture arch_ControlBlock of ControlBlock is
  type state_type is (RESET_BOOT, WAIT_ENTER, UPDATE_NUM, WAIT_ENTER_NUM_DOWN, EXECUTE_OPERATION, WAIT_ENTER_OPR_DOWN);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is
  "000 001 010 011 100 101";
  signal PS, NS : state_type;
  signal Y : std_logic_vector(2 downto 0); -- signal para os proximos estados da FSM
begin
  sync_process : process (clk, NS)
  begin
    if (rising_edge(clk)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (
    PS, 
    reset,
    enter_num,
    enter_opr,
    reset,
    is_empty0,
    is_empty1,
    is_empty2
  )
  begin
    -- pre-assign saidas, assim nao precisa definir todas em cada estado
    load_stack0 <= '0';
    load_stack1 <= '0';
    load_stack2 <= '0';

    clear_stack0 <= '0';
    clear_stack1 <= '0';
    clear_stack2 <= '0';

    select_alu_num <= '1'; -- seleciona das chaves default
    select_stack_pos <= "100";
    select_two_stack_pos <= "110";

    case PS is
      when RESET_BOOT =>
        if (reset = '1') then
          NS <= RESET_BOOT;
        else
          NS <= WAIT_ENTER;
        end if;

        clear_stack0 <= '1';
        clear_stack1 <= '1';
        clear_stack2 <= '1';

      when WAIT_ENTER =>
        if (reset = '1') then
          NS <= RESET_BOOT;
        elsif (enter_num = '1') then
          NS <= UPDATE_NUM;
        elsif (enter_opr = '1') then
          NS <= EXECUTE_OPERATION;
        else
          NS <= WAIT_ENTER;
        end if;

      when UPDATE_NUM =>
        NS <= WAIT_ENTER_NUM_DOWN;
        select_alu_num <= '1'; -- puxa do num conectado das chaves

        -- identifica a posicao da stack que precisa carregar o conteudo das chaves
        -- e sempre a mais alta que a stack permite
        -- se todas as posicoes estao cheias, nao faz nada (nao adiciona na stack)
        if (is_empty0 = '1') then
          select_stack_pos <= "001";
          select_two_stack_pos <= "011";
          load_stack0 <= '1';
        elsif (is_empty1 = '1') then
          select_stack_pos <= "010";
          select_two_stack_pos <= "011";
          load_stack1 <= '1';
        elsif (is_empty2 = '1') then
          select_stack_pos <= "100";
          select_two_stack_pos <= "110";
          load_stack2 <= '1';
        end if;

      when WAIT_ENTER_NUM_DOWN =>
        if (enter_num = '1') then
          NS <= WAIT_ENTER_NUM_DOWN;
        else
          NS <= WAIT_ENTER;
        end if;

      when EXECUTE_OPERATION =>
        NS <= WAIT_ENTER_OPR_DOWN;
        select_alu_num <= '0'; -- puxa da ALU do datapath

        -- identifica a posicao da stack que precisa carregar o conteudo das chaves
        -- e sempre a mais alta que a stack permite
        -- se todas as posicoes estao cheias, nao faz nada (nao adiciona na stack)
        if (is_empty0 = '1') then
          select_stack_pos <= "001";
          select_two_stack_pos <= "011";
          load_stack0 <= '1';
        elsif (is_empty1 = '1') then
          select_stack_pos <= "010";
          select_two_stack_pos <= "011";
          load_stack1 <= '1';
        elsif (is_empty2 = '1') then
          select_stack_pos <= "100";
          select_two_stack_pos <= "110";
          load_stack2 <= '1';
        end if;

        -- onde e feito aqui o clear dos dois mais altos da stack?

      when WAIT_ENTER_OPR_DOWN =>
        if (enter_opr = '1') then
          NS <= WAIT_ENTER_OPR_DOWN;
        else
          NS <= WAIT_ENTER;
        end if;
        
      when others => -- catch all, nunca deve chegar aqui
        NS <= RESET_BOOT;
    end case;
end process comb_process;

-- codificação dos estados Y
with PS select
  Y <=
    "000" when RESET_BOOT,
    "001" when WAIT_ENTER,
    "010" when UPDATE_NUM,
    "011" when WAIT_ENTER_NUM_DOWN,
    "100" when EXECUTE_OPERATION,
    "101" when WAIT_ENTER_OPR_DOWN,
    "000" when others;
end arch_ControlBlock;