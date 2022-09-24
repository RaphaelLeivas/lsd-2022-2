library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_ComponentEx7 is
end tb_ComponentEx7;

architecture teste of tb_ComponentEx7 is

  component ComponentEx7 is
    port (
      a : in std_logic_vector(3 downto 0);
      e : in std_logic;
      y : out std_logic_vector(7 downto 0));
  end component;

  signal A : std_logic_vector(3 downto 0);
  signal E : std_logic;
  signal Y : std_logic_vector(7 downto 0);
begin
  instancia_ComponentEx7 : ComponentEx7 port map(a => A, e => E, y => Y);
  E <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
end teste;