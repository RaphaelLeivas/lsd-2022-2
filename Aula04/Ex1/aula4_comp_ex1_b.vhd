-- aula4_comp_ex1_b comportamental
-- com uso do package std_logic_unsigned da Synopsys da IEEE
-- Se usar o GHDL da GNU é necessário incluir a opção de compilação: -fsynopsys em "Make Options"
-- Observação: operadores e tipos da linguagem VHDL variam de um package para outro package
library ieee;
use ieee.std_logic_1164.all;
-- entity aula4_comp_ex1_b is
-- port ( a,b,c,d 	: in std_logic;
-- f 		: out std_logic);
-- end aula4_comp_ex1_b;
--architecture fluxo_de_dados of aula4_comp_ex1_b is
--begin
-- my_aula4_comp_ex1_b: process (a,b,c,d)  
-- begin
-- if (a = '0' and c = '1' and d = '0') then f <= '1'; 
-- elsif (b = '0' and c = '1') then f <= '1'; 
-- elsif (b = '1' and c = '1' and d = '0') then f <= '1';
-- else f <= '0';
-- end if;
-- end process my_aula4_comp_ex1_b;
-- end fluxo_de_dados;
entity aula4_comp_ex1_b is
  port (
    a, b, c, d : in std_logic;
    f : out std_logic);
end aula4_comp_ex1_b;

architecture fluxo_de_dados of aula4_comp_ex1_b is
  signal ABCD : std_logic_vector (3 downto 0);
begin
  ABCD <= a & b & c & d;
  my_aula4_comp_ex1_b : process (ABCD)
  begin
    case (ABCD) is
      when "0010" or "0110" => f <= '1';
      when "0010" or "0011" or "1011" or "1010" => f <= '1';
      when "0110" or "1110" => f <= '1';
      when others => f <= '0';
    end case;

  end process my_aula4_comp_ex1_b;
end fluxo_de_dados;