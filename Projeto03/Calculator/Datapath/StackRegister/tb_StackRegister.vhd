library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_StackRegister is
end tb_StackRegister;

architecture arch_tb_StackRegister of tb_StackRegister is

  component StackRegister is
    port (
      X : in std_logic_vector(3 downto 0);
      load, clear, clk : in std_logic;
      isEmpty : out std_logic;
      Z : out std_logic_vector(3 downto 0)
    );
  end component;

  constant PERIODO : time := 20 ns; -- 50 MHz
  signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
  signal ENT_CLK_ENABLE : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação

  signal tb_X : std_logic_vector(3 downto 0);
  signal tb_load, tb_clear, tb_isEmpty : std_logic;
  signal tb_Z : std_logic_vector(3 downto 0);

begin
  -- geração do clock com periodo PERIODO
  ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
  ENT_CLK_ENABLE <= '1', '0' after 40 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  DUT : StackRegister port map(
    clk => ENT_CLK,
    X => tb_X,
    load => tb_load,
    clear => tb_clear,
    isEmpty => tb_isEmpty,
    Z => tb_Z
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    tb_load <= '1';
    tb_clear <= '0';
    tb_X <= "0010";
    wait for 10 * PERIODO;
    tb_load <= '0';
    tb_clear <= '1';
    wait for 2 * PERIODO;
    tb_X <= "1010";
    wait for 10 * PERIODO;
    tb_clear <= '0';
    wait for 5 * PERIODO;
    tb_load <= '1';
    wait for 5 * PERIODO;
    tb_X <= "1111";

    wait;
  end process stimulus;
end arch_tb_StackRegister;