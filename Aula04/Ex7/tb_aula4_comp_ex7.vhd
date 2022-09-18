library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_aula4_comp_ex7 is
end tb_aula4_comp_ex7;

architecture teste of tb_aula4_comp_ex7 is

  component aula4_comp_ex7 is
    port (
      x, y : in std_logic_vector(7 downto 0);
      s : out std_logic_vector(7 downto 0));
  end component;

  signal A, B, S : std_logic_vector(7 downto 0);
begin
  instancia_aula4_comp_ex7 : aula4_comp_ex7 port map(x => A, y => B, s => S);
  A <= x"00", x"03" after 20 ns, x"12" after 40 ns, x"24" after 60 ns;
  B <= x"00", x"04" after 10 ns, x"13" after 30 ns, x"91" after 50 ns;
end teste;