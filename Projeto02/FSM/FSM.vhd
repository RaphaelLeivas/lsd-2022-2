-- Atividade pratica da Guia de Aula 08
-- Exercicio 8, pagina 114 do livro Free Range VHDL (2018)

library IEEE;
use IEEE.std_logic_1164.all;

entity FSM is
  port (
    CLK_FSM : in std_logic;
    X : in std_logic; -- entrada da FSM
    Z0 : out std_logic_vector(0 to 7)); -- saidas efetivas da FSM
end FSM;

architecture arch_FSM of FSM is
  type state_type is (ST0, ST1, ST2, ST3, ST4, ST5);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is "000 001 010 011 100 101";
  signal PS, NS : state_type;
  signal Y : std_logic_vector(2 downto 0); -- signal para os proximos estados da FSM
begin
  sync_process : process (CLK_FSM, NS)
  begin
    if (rising_edge(CLK_FSM)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (PS, X)
  begin
    Z0 <= "01111111";

    case PS is
      when ST0 =>
        if (X = '1') then
          NS <= ST0;
          Z0 <= "01111111";
        elsif (X = '0') then
          NS <= ST1;
          Z0 <= "01111111";
        else -- catch all
          NS <= ST0;
          Z0 <= "01111111";
        end if;

      when ST1 =>
        if (X = '1') then
          NS <= ST0;
          Z0 <= "01111111";
        elsif (X = '0') then
          NS <= ST2;
          Z0 <= "10111111";
        else -- catch all
          NS <= ST0;
          Z0 <= "01111111";
        end if;

      when ST2 =>
        if (X = '1') then
          NS <= ST0;
          Z0 <= "01111111";
        elsif (X = '0') then
          NS <= ST0;
          Z0 <= "11011111";
        else -- catch all
          NS <= ST0;
          Z0 <= "01111111";
        end if;

      when others => -- catch all, nunca deve chegar aqui
        NS <= ST0;
        Z0 <= "01111111";
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
    "000" when others;
end arch_FSM;