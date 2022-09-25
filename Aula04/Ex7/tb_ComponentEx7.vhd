library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_ComponentEx7 is
end tb_ComponentEx7;

architecture teste of tb_ComponentEx7 is
  component ComponentEx7 is
    port (
      a : in std_logic_vector(2 downto 0); -- ativas em high
      e : in std_logic; -- ativo em low
      y : out std_logic_vector(7 downto 0)); -- ativas em low
  end component;

  signal A : std_logic_vector(2 downto 0); 
  signal E : std_logic; 
  signal Y : std_logic_vector(7 downto 0); 
begin
  instancia_ComponentEx7 : ComponentEx7 port map(a => A, e => E, y => Y);
  E <= '0', '1' after 20 ns, '0' after 60 ns;
  A <= "000", "001" after 40 ns, "010" after 60 ns, "100" after 80 ns, "110" after 100 ns, "111" after 120 ns;
end teste;