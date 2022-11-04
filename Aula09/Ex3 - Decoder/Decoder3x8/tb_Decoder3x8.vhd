library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_Decoder3x8 is
end tb_Decoder3x8;

architecture arch_tb_Decoder3x8 of tb_Decoder3x8 is
  component Decoder3x8 is
    port (
      DEC_INPUT : in std_logic_vector(2 downto 0);
      DEC_EN : in std_logic;
      DEC_OUT : out std_logic_vector(7 downto 0));
  end component;

  signal DEC_INPUT_TB : std_logic_vector(2 downto 0); 
  signal DEC_EN_TB : std_logic; 
  signal DEC_OUT_TB : std_logic_vector(7 downto 0); 
begin
  instancia_Decoder3x8 : Decoder3x8 port map(DEC_INPUT => DEC_INPUT_TB, DEC_EN => DEC_EN_TB, DEC_OUT => DEC_OUT_TB);
  DEC_EN_TB <= '0', '0' after 20 ns, '0' after 60 ns;
  DEC_INPUT_TB <= "000", "001" after 40 ns, "010" after 60 ns, "100" after 80 ns, "110" after 100 ns, "111" after 120 ns;
end arch_tb_Decoder3x8;