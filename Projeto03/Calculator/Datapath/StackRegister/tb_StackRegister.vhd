library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_StackRegister is
end tb_StackRegister;

architecture arch_tb_StackRegister of tb_StackRegister is

  component StackRegister is
    port (
      X : in std_logic_vector(3 downto 0);
      load, clear : in std_logic;
      isEmpty : out std_logic;
      Y : out std_logic_vector(3 downto 0)
    );
  end component;

  signal tb_X : std_logic_vector(3 downto 0);
  signal tb_load, tb_clear, tb_isEmpty : std_logic;
  signal tb_Y : std_logic_vector(3 downto 0);
begin
  DUT : StackRegister port map(
    X => tb_X,
    load => tb_load,
    clear => tb_clear,
    isEmpty => tb_isEmpty,
    Y => tb_Y
  );

  tb_clear <= '1', '0' after 2 ns;
  tb_load <= '0', '1' after 22 ns;
  tb_X <= "1101", "0010" after 20 ns, "0010" after 40 ns;
  -- tb_lo
end arch_tb_StackRegister;
