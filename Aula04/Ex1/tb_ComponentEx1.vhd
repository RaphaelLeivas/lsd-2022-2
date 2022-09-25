library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_ComponentEx1 is
end tb_ComponentEx1;

architecture teste of tb_ComponentEx1 is

  component ComponentEx1 is
    port (
      a, b, c, d : in std_logic;
      f : out std_logic);
  end component;

  signal A, B, C, D, F : std_logic;
begin
  instancia_ComponentEx1 : ComponentEx1 port map(f => F, a => A, b => B, c => C, d => D);
  A <= '1', '1' after 20 ns; -- '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns;
  B <= '0', '1' after 30 ns; -- '0' after 10 ns, '0' after 20 ns, '0' after 30 ns, '0' after 40 ns;
  C <= '1', '1' after 40 ns;-- '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '0' after 40 ns;
  D <= '0', '0' after 50 ns;-- '0' after 10 ns, '0' after 20 ns, '0' after 30 ns, '0' after 40 ns;
end teste;