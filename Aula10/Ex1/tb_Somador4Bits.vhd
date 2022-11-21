library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_Somador4Bits is
end tb_Somador4Bits;

architecture arch_tb_Somador4Bits of tb_Somador4Bits is

  component Somador4Bits is
    port (
      A, B : in std_logic_vector(3 downto 0);
      F : out std_logic_vector(3 downto 0);
      CO : out std_logic);
  end component;

  signal A, B : std_logic_vector(3 downto 0);
  signal F : std_logic_vector(3 downto 0);
  signal CO : std_logic;
begin
  DUT : Somador4Bits port map(A => A, B => B, F => F);
  A <= "0000", "0010" after 20 ns, "1000" after 40 ns, "1101" after 60 ns, "1101" after 80 ns;
  B <= "0000", "0010" after 20 ns, "1000" after 40 ns, "1101" after 60 ns, "1101" after 80 ns;
end arch_tb_Somador4Bits;