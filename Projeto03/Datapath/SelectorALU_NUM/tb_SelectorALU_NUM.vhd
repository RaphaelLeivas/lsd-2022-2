library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_SelectorALU_NUM is
end tb_SelectorALU_NUM;

architecture arch_tb_SelectorALU_NUM of tb_SelectorALU_NUM is

  component SelectorALU_NUM is
    port (
      X0, X1 : in std_logic_vector(3 downto 0);
      sel0 : in std_logic;
      sel1 : in std_logic_vector(2 downto 0);
      Y0, Y1, Y2 : out std_logic_vector(3 downto 0)
    );
  end component;

  signal tb_X0, tb_X1 : std_logic_vector(3 downto 0);
  signal tb_sel0 : std_logic;
  signal tb_sel1 : std_logic_vector(2 downto 0);
  signal tb_Y0, tb_Y1, tb_Y2 : std_logic_vector(3 downto 0);
begin
  DUT : SelectorALU_NUM port map(
    X0 => tb_X0,
    X1 => tb_X1,
    sel0 => tb_sel0,
    sel1 => tb_sel1,
    Y0 => tb_Y0,
    Y1 => tb_Y1,
    Y2 => tb_Y2
  );

  tb_X0 <= "1101", "0010" after 20 ns, "0010" after 40 ns;
  tb_X1 <= "1111", "0001" after 20 ns, "0001" after 40 ns;
  tb_sel0 <= '0', '0' after 20 ns, '1' after 40 ns, '0' after 60 ns;
  tb_sel1 <= "001", "100" after 20 ns, "010" after 40 ns, "010" after 60 ns;
end arch_tb_SelectorALU_NUM;
