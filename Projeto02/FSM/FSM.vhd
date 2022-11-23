-- Atividade pratica da Guia de Aula 08
-- Exercicio 8, pagina 114 do livro Free Range VHDL (2018)

library IEEE;
use IEEE.std_logic_1164.all;

entity FSM is
  port (
    CLK : in std_logic;
    X : in std_logic; -- entradas da FSM
    Y : out std_logic_vector(2 downto 0); -- saidas para os proximos estados da FSM
    Z : out std_logic_vector(1 downto 0)); -- saida efetiva da FSM
end FSM;

architecture arch_FSM of FSM is
  type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is "000 001 010 011 100 101 110 111";
  signal PS, NS : state_type;
begin
  sync_process : process (CLK, NS)
  begin
    if (rising_edge(CLK)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (PS, X)
  begin
    Z <= "00"; -- pre-assing saidas

    case PS is
      when ST0 =>
        Z <= "00";

        if (X = '0') then
          NS <= ST0;
        else NS <= ST1;
        end if;

      when ST1 =>
        Z <= "00";

        if (X = '0') then
          NS <= ST1;
        else NS <= ST2;
        end if;

      when ST2 =>
        Z <= "00";

        if (X = '0') then
          NS <= ST2;
        else NS <= ST3;
        end if;

      when ST3 =>
        Z <= "10";

        if (X = '0') then
          NS <= ST3;
        else NS <= ST4;
        end if;

      when ST4 =>
        Z <= "01";

        if (X = '0') then
          NS <= ST0;
        else NS <= ST5;
        end if;

      when ST5 =>
        Z <= "11";

        if (X = '0') then
          NS <= ST5;
        else NS <= ST6;
        end if;

      when ST6 =>
        Z <= "11";

        if (X = '0') then
          NS <= ST6;
        else NS <= ST7;
        end if;

      when ST7 =>
        Z <= "11";

        if (X = '0') then
          NS <= ST7;
        else NS <= ST0;
        end if;

      when others => -- catch all, nunca deve chegar aqui
        Z <= "00";
        NS <= ST0;
    end case;
  end process comb_process;

  -- codificação dos estados Y
  with PS select
    Y <=
    "000" when ST0,
    "001" when ST1,
    "010" when ST2,
    "011" when ST3,
    "100" when ST4,
    "101" when ST5,
    "110" when ST6,
    "111" when ST7,
    "000" when others;
end arch_FSM;