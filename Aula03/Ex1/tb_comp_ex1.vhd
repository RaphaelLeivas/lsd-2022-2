library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_comp_ex1 is
end tb_comp_ex1;

architecture teste of tb_comp_ex1 is

  component comp_ex1 is
    port (
      a, b : in std_logic;
      f : out std_logic);
  end component;

  signal A, B, F : std_logic;
begin
  instancia_comp_ex1 : comp_ex1 port map(a => A, b => B, f => F);
  A <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
  B <= '0', '0' after 10 ns, '1' after 30 ns, '1' after 50 ns;
end teste;