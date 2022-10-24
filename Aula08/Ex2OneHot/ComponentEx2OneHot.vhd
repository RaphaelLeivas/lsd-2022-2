-- Atividade pratica da Guia de Aula 08
-- Exercicio 2, pagina 108 do livro Free Range VHDL (2018)

library IEEE;
use IEEE.std_logic_1164.all;

entity ComponentEx2OneHot is
  port (
    CLK : in std_logic;
    X : in std_logic_vector(1 downto 0); -- entradas da FSM
    Y : out std_logic_vector(2 downto 0); -- saidas para os proximos estados da FSM
    Z : out std_logic); -- saida efetiva da FSM
end ComponentEx2OneHot;

architecture arch_ComponentEx2OneHot of ComponentEx2OneHot is
  type state_type is (ST0, ST1, ST2);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is "001 010 100";
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
    Z <= '0'; -- pre-assing saidas

    case PS is

      when ST0 =>
        if (X(0) = '0') then
          NS <= ST0;
          Z <= '0';
        elsif (X(0) = '1') then
          NS <= ST1;
          Z <= '0';
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST1;
          Z <= '0';
        end if;

      when ST1 =>
        if (X(1) = '1') then
          NS <= ST2;
          Z <= '0';
        elsif (X(1) = '0') then
          NS <= ST0;
          Z <= '1';
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= '1';
        end if;

      when ST2 =>
        if (X(1) = '1') then
          NS <= ST2;
          Z <= '0';
        elsif (X(1) = '0') then
          NS <= ST0;
          Z <= '1';
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= '1';
        end if;

      when others => -- catch all, nunca deve chegar aqui
        Z <= '0';
        NS <= ST0;
    end case;
  end process comb_process;

  -- codificação dos estados Y
  with PS select
    Y <= "001" when ST0,
    "010" when ST1,
    "100" when ST2,
    "001" when others;
end arch_ComponentEx2OneHot;