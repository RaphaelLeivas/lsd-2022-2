library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_OR4x1 is
end tb_OR4x1;

architecture arch_tb_OR4x1 of tb_OR4x1 is
  component OR4x1 is
    port (
      OR_INPUT : in std_logic_vector(3 downto 0);
      OR_OUT : out std_logic );
  end component;

  signal OR_INPUT_TB : std_logic_vector(3 downto 0); 
  signal OR_OUT_TB : std_logic; 
begin
  instancia_OR4x1 : OR4x1 port map(OR_INPUT => OR_INPUT_TB, OR_OUT => OR_OUT_TB);
  OR_INPUT_TB <= "0000", "0011" after 40 ns, "0100" after 60 ns, "1100" after 80 ns, "1100" after 100 ns, "0001" after 120 ns;
end arch_tb_OR4x1;