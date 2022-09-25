library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ComponentEx is
end tb_ComponentEx;

architecture arch_tb_ComponentEx of tb_ComponentEx is

  component ComponentEx is
    port (
      x : in unsigned(3 downto 0);
      f : out unsigned(7 downto 0));
  end component;

  signal X : unsigned(3 downto 0);
  signal F : unsigned(7 downto 0);
begin
  instancia_ComponentEx : ComponentEx port map(f => F, x => X);
  X <= "0000", "0011" after 10 ns, "1101" after 20 ns, "1101" after 30 ns;
end arch_tb_ComponentEx;