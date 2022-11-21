-- Conversor binario 4 bits para display 7 segmentos (BCD para 7 segmentos)
-- segmentos sao ANODO COMUM -> acionam com nivel logico 0!
-- mais info no manual da FPGA (DE-10)

library ieee;
use ieee.std_logic_1164.all;

entity Decoder7Seg is
  port (
    BCD_INPUT : in std_logic_vector(3 downto 0);
    BCD_OUTPUT : out std_logic_vector(7 downto 0));
end Decoder7Seg;

architecture arch_Decoder7Seg of Decoder7Seg is
begin
  -- BCD_OUTPUT(0) = a, BCD_OUTPUT(6) = g, BCD_OUTPUT(7) = ponto decimal
  BCD_OUTPUT <=
    "00000011" when (BCD_INPUT = "0000") else
    "10011111" when (BCD_INPUT = "0001") else
    "00100101" when (BCD_INPUT = "0010") else
    "00001101" when (BCD_INPUT = "0011") else
    "10011001" when (BCD_INPUT = "0100") else
    "01001001" when (BCD_INPUT = "0101") else
    "01000001" when (BCD_INPUT = "0110") else
    "00011111" when (BCD_INPUT = "0111") else
    "00000001" when (BCD_INPUT = "1000") else
    "00001001" when (BCD_INPUT = "1001") else
    "00000011"; -- mostra zero no display  caso contrario
end arch_Decoder7Seg;