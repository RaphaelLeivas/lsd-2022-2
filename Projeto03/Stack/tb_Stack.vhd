library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Stack is
end tb_Stack;

architecture arch_tb_Stack of tb_Stack is

  component Stack is
    port (
      Clk : in std_logic; --Clock for the stack.
      Reset : in std_logic; --active high reset.    
      Enable : in std_logic; --Enable the stack. Otherwise neither push nor pop will happen.
      Data_In : in std_logic_vector(15 downto 0); --Data to be pushed to stack
      Data_Out : out std_logic_vector(15 downto 0); --Data popped from the stack.
      PUSH_barPOP : in std_logic; --active low for POP and active high for PUSH.
      Stack_Full : out std_logic; --Goes high when the stack is full.
      Stack_Empty : out std_logic); --Goes high when the stack is empty.); -- saidas efetivas da FSM
  end component;

  constant PERIODO : time := 20 ns; -- 50MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal ENT_RST, ENT_ENABLE, ENT_PUSH_barPOP, SAI_STACK_FULL, SAI_STACK_EMPTY : std_logic;
  signal ENT_DATA_IN, SAI_DATA_OUT : std_logic_vector(15 downto 0);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 50 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : Stack port map(
    CLK => ENT_CLK,
    Reset => ENT_RST,
    Enable => ENT_ENABLE,
    Data_In => ENT_DATA_IN,
    Data_Out => SAI_DATA_OUT,
    PUSH_barPOP => ENT_PUSH_barPOP,
    Stack_Full => SAI_STACK_FULL,
    Stack_Empty => SAI_STACK_EMPTY
  );

  --  process para os estímulos das entradas
  -- stimulus : process
  -- begin
  --   ENT_RST <= '0';
  --   wait for 25 * PERIODO;
  --   ENT_RST <= '1';
  --   wait for 10 * PERIODO;
  --   ENT_RST <= '0';

  --   wait;
  -- end process stimulus;

  -- Stimulus process
  stim_proc : process
  begin
    ENT_RST <= '1'; --apply ENT_RST for one clock cycle.
    wait for PERIODO;
    ENT_RST <= '0';
    wait for PERIODO * 3; --wait for 3 clock periods(simply)
    ENT_ENABLE <= '1'; --ENT_ENABLE stack
    wait for PERIODO * 3; --wait for 3 clock periods(simply)
    ENT_PUSH_barPOP <= '1'; --Set for push operation.
    ENT_DATA_IN <= X"FFFF"; --Push something to stack.
    wait for PERIODO;
    ENT_DATA_IN <= X"7FFF"; --Push something to stack.
    wait for PERIODO;
    ENT_DATA_IN <= X"2FFF"; --Push something to stack.
    wait for PERIODO;
    ENT_DATA_IN <= X"AAFF"; --Push something to stack.
    wait for PERIODO;
    ENT_DATA_IN <= X"BBFF"; --Push something to stack.
    wait for PERIODO;
    ENT_PUSH_barPOP <= '0'; --POP two of the above pushed values.
    wait for PERIODO * 2;
    ENT_PUSH_barPOP <= '1'; --Set for push operation.
    ENT_DATA_IN <= X"1234"; --Push something to stack.
    wait for PERIODO;
    ENT_DATA_IN <= X"5678"; --Push something to stack.
    wait for PERIODO;

    -- ENT_RST <= '1';
    -- wait for 15 * PERIODO;
    -- ENT_RST <= '0';

    ENT_PUSH_barPOP <= '0'; --POP all the above pushed values.
    wait for PERIODO * 10; --wait for some time.
    ENT_PUSH_barPOP <= '1'; --Set for push operation.
    ENT_DATA_IN <= X"0020"; --Push something to stack.
    wait for PERIODO;
    ENT_PUSH_barPOP <= '0'; --pop what was pushed.
    wait for PERIODO * 10;
    ENT_ENABLE <= '0'; --disable stack.

    wait for PERIODO * 10; --wait for some time.
    wait;
  end process;
end arch_tb_Stack;