-- Decoder 3 : 8, com Enable ativo em low, entradas ativas em nível high, e saídas ativas em nível high.
-- Feito com CASE

library ieee;
use ieee.std_logic_1164.all;

entity Decoder3x8 is
  port (
    DEC_INPUT : in std_logic_vector(2 downto 0);
    DEC_EN : in std_logic;
    DEC_OUT : out std_logic_vector(7 downto 0));
end Decoder3x8;

architecture arch_Decoder3x8 of Decoder3x8 is
begin
  process_Decoder3x8 : process (DEC_INPUT, DEC_EN)
  begin
    case (DEC_EN) is
      when '1' => DEC_OUT <= "00000000"; -- todas saídas desativas
      when '0' =>
        case (DEC_INPUT) is
          when "000" => DEC_OUT <= "00000001";
          when "001" => DEC_OUT <= "00000010";
          when "010" => DEC_OUT <= "00000100";
          when "011" => DEC_OUT <= "00001000";
          when "100" => DEC_OUT <= "00010000";
          when "101" => DEC_OUT <= "00100000";
          when "110" => DEC_OUT <= "01000000";
          when "111" => DEC_OUT <= "10000000";
          when others => DEC_OUT <= "00000000"; -- todas saídas desativas
        end case;
      when others => DEC_OUT <= "00000000"; -- todas saídas desativas
    end case;
  end process process_Decoder3x8;
end arch_Decoder3x8;
