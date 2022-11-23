library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_Decoder7Seg is
end tb_Decoder7Seg;

architecture arch_tb_Decoder7Seg of tb_Decoder7Seg is

  component Decoder7Seg is
    port (
      BCD_INPUT : in std_logic_vector(3 downto 0);
      BCD_OUTPUT : out std_logic_vector(7 downto 0));
  end component;

  signal A : std_logic_vector(3 downto 0);
  signal F : std_logic_vector(7 downto 0);
begin
  DUT : Decoder7Seg port map(BCD_INPUT => A, BCD_OUTPUT => F);
  A <= "0000", "0010" after 20 ns, "1000" after 40 ns, "1101" after 60 ns, "1101" after 80 ns;
end arch_tb_Decoder7Seg;