library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_ALU is
end tb_ALU;

architecture arch_tb_ALU of tb_ALU is

  component ALU is
    port (
      OPERATOR : in std_logic_vector(1 downto 0);
      NUM1, NUM2 : in std_logic_vector(3 downto 0);
      RESULT : out std_logic_vector(3 downto 0)
    );
  end component;

  signal TB_OPERATOR : std_logic_vector(1 downto 0);
  signal TB_NUM1, TB_NUM2 : std_logic_vector(3 downto 0);
  signal TB_RESULT : std_logic_vector(3 downto 0);
begin
  DUT : ALU port map(
    OPERATOR => TB_OPERATOR,
    NUM1 => TB_NUM1, 
    NUM2 => TB_NUM2,
    RESULT => TB_RESULT
  );

  TB_OPERATOR <= "00";
  TB_NUM1 <= "0000", "0010" after 20 ns, "0010" after 40 ns, "1101" after 60 ns, "0001" after 80 ns, "0001" after 100 ns;
  TB_NUM2 <= "0000", "0001" after 20 ns, "0010" after 40 ns, "1001" after 60 ns, "0100" after 80 ns, "0100" after 100 ns;
end arch_tb_ALU;
