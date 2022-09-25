--- Pag 48 Exercicio 1 (b)
-- a expressão booleana da questão pode ser reduzida para
-- F(A,B,C,D) = CB' + CD'

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ComponentEx1 is
  port (
    a, b, c, d : in std_logic;
    f : out std_logic);
end ComponentEx1;

architecture arch_ComponentEx1 of ComponentEx1 is
  signal ABCD : std_logic_vector (3 downto 0);
  signal F_out : std_logic;
begin
  ABCD <= a & b & c & d;
  f <= F_out;

  process_ComponentEx1 : process (a, b, c, d)
  begin
    -- USANDO IF ELSIF
    -- if (c = '1' and b = '0') then f <= '1';
    -- elsif (d = '1' and c = '0') then f <= '1';
    -- else f <= '0';
    -- end if;

    -- USANDO CASE
    -- report "The value of ABCD is " &  integer'image(to_integer(unsigned(ABCD)));
    -- assert ABCD = x"A" report "Assertion violation"  & integer'image(to_integer(unsigned(ABCD)));

    case (ABCD) is
      when "1110" =>
        report "The value of ABCD is " & integer'image(to_integer(unsigned(ABCD)));

        F_out <= '0';
        -- when "--10" => f <= '1';
      when others =>
        report "The value of ABCD is " & integer'image(to_integer(unsigned(ABCD)));

        F_out <= '1';
    end case;
  end process process_ComponentEx1;
end arch_ComponentEx1;