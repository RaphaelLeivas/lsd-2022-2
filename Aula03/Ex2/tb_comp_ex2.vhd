library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_comp_ex2 is
end tb_comp_ex2;

architecture teste of tb_comp_ex2 is

  component comp_ex2 is
    port (
      a, b, c, d : in std_logic;
      f : out std_logic);
  end component;

  signal A, B, C, D, F : std_logic;
begin
  instancia_comp_ex2 : comp_ex2 port map(a => A, b => B, c => C, d => D, f => F);
  A <= '0', '1' after 20 ns, '1' after 40 ns, '0' after 60 ns, '1' after 80 ns;
  B <= '0', '0' after 10 ns, '0' after 30 ns, '1' after 50 ns, '0' after 90 ns;
  C <= '0', '1' after 20 ns, '1' after 40 ns, '1' after 60 ns, '1' after 100 ns;
  D <= '0', '0' after 10 ns, '0' after 30 ns, '1' after 50 ns, '1' after 120 ns;
end teste;