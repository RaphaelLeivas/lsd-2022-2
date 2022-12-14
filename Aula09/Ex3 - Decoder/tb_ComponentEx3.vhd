library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ComponentEx3 is
end tb_ComponentEx3;

architecture arch_tb_ComponentEx3 of tb_ComponentEx3 is

  component ComponentEx3 is
    port (
      A, B, C : in std_logic;
      F : out std_logic
    );
  end component;

  signal A_TB, B_TB, C_TB : std_logic;
  signal F_TB : std_logic;
begin
  instancia_ComponentEx3 : ComponentEx3 port map(A => A_TB, B => B_TB, C => C_TB, F => F_TB);
  A_TB <= '0', '1' after 40 ns, '0' after 80 ns, '0' after 120 ns, '0' after 160 ns;
  B_TB <= '0', '0' after 40 ns, '1' after 80 ns, '0' after 120 ns, '0' after 160 ns;
  C_TB <= '0', '0' after 40 ns, '0' after 80 ns, '1' after 120 ns, '1' after 160 ns;
end arch_tb_ComponentEx3;