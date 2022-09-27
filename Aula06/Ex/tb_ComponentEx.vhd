library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_ComponentEx is
end tb_ComponentEx;

architecture arch_tb_ComponentEx of tb_ComponentEx is

  component ComponentEx is
    port (
      a, b : in std_logic_vector(7 downto 0);
      s    : in std_logic_vector(2 downto 0);
      o    : out std_logic_vector(7 downto 0);
      co   : out std_logic
    );
  end component;

  signal A, B, O : std_logic_vector(7 downto 0);
  signal S : std_logic_vector(2 downto 0);
begin
  instancia_ComponentEx : ComponentEx port map(a => A, b => B, s => S, o => O);
  S <= "100";
  A <= "00010100", "00010100" after 20 ns, "00000100" after 40 ns, "00000100" after 60 ns;
  B <= "00001100", "00001100" after 20 ns, "00001111" after 40 ns, "00001100" after 60 ns;
end arch_tb_ComponentEx;