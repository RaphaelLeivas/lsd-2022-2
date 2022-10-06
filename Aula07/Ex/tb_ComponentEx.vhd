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
      o    : out std_logic_vector(7 downto 0)
    );
  end component;

  signal A, B, O : std_logic_vector(7 downto 0);
  signal S : std_logic_vector(2 downto 0);
begin
  instancia_ComponentEx : ComponentEx port map(a => A, b => B, s => S, o => O);
  S <= "000", "001" after 30 ns, "010" after 60 ns, "011" after 90 ns, "100" after 120 ns, "101" after 150 ns, "110" after 180 ns, "111" after 210 ns, "000" after 250 ns;
  A <= x"00", x"25" after 20 ns, x"25" after 50 ns, x"25" after 80 ns, x"25" after 110 ns, x"25" after 140 ns, x"25" after 170 ns, x"25" after 200 ns;
  B <= x"00", x"30" after 20 ns, x"30" after 50 ns, x"30" after 80 ns, x"30" after 110 ns, x"30" after 140 ns, x"30" after 170 ns, x"30" after 200 ns;
end arch_tb_ComponentEx;