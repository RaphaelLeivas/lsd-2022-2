library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_aula4_comp_ex1_b is
end tb_aula4_comp_ex1_b;

architecture teste of tb_aula4_comp_ex1_b is

  component aula4_comp_ex1_b is
    port (
      a, b, c, d : in std_logic;
      f : out std_logic);
  end component;

  signal A, B, C, D, F : std_logic;
begin
  instancia_aula4_comp_ex1_b : aula4_comp_ex1_b port map(a => A, b => B, c => C, d => D, f => F);
  A <= '0', '1' after 20 ns, '0' after 70 ns;
  B <= '0', '1' after 30 ns, '0' after 50 ns;
  C <= '0', '1' after 20 ns, '1' after 60 ns;
  D <= '0', '0' after 10 ns, '1' after 40 ns;
end teste;