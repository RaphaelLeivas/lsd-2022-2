library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_SelectorTwoStack is
end tb_SelectorTwoStack;

architecture arch_tb_SelectorTwoStack of tb_SelectorTwoStack is

  component SelectorTwoStack is
    port (
      X0, X1, X2 : in std_logic_vector(3 downto 0);
      sel : in std_logic_vector(2 downto 0);
      Y0, Y1 : out std_logic_vector(3 downto 0)
    );
  end component;

  signal tb_X0, tb_X1, tb_X2 : std_logic_vector(3 downto 0);
  signal tb_sel : std_logic_vector(2 downto 0);
  signal tb_Y0, tb_Y1 : std_logic_vector(3 downto 0);
begin
  DUT : SelectorTwoStack port map(
    X0 => tb_X0,
    X1 => tb_X1,
    X2 => tb_X2,
    sel => tb_sel,
    Y0 => tb_Y0,
    Y1 => tb_Y1
  );

  tb_X0 <= "1101", "0010" after 20 ns, "0010" after 40 ns;
  tb_X1 <= "1111", "0001" after 20 ns, "0001" after 40 ns;
  tb_X2 <= "1111", "0001" after 20 ns, "0001" after 40 ns;
  tb_sel <= "110", "110" after 20 ns, "011" after 40 ns, "011" after 60 ns;
end arch_tb_SelectorTwoStack;
