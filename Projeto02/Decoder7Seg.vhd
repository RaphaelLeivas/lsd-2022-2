-- Conversor binario 4 bits para display 7 segmentos (BCD para 7 segmentos)
-- segmentos sao ANODO COMUM -> acionam com nivel logico 0!
-- mais info no manual da FPGA (DE-10)

library ieee;
use ieee.std_logic_1164.all;

entity Decoder7Seg is
  port (
    CLK : in std_logic;
    RST : in std_logic; -- entradas da FSM
    Y : out std_logic_vector(2 downto 0); -- saidas para os proximos estados da FSM
    Z : out std_logic_vector(0 to 5)); -- saida efetiva da FSM
end Decoder7Seg;

architecture arch_Decoder7Seg of Decoder7Seg is
  type state_type is (ST0, ST1, ST2, ST3, ST4, ST5);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is "000 001 010 011 100 101";
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
    Z <= "111110"; -- pre-assing saidas

    case PS is

      when ST0 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST1;
          Z <= "111101";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;

      when ST1 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST2;
          Z <= "111101";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;

      when ST2 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST3;
          Z <= "111011";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;

      when ST3 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST4;
          Z <= "110111";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;

      when ST4 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST5;
          Z <= "101111";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;

      when ST5 =>
        if (RST = '1') then
          NS <= ST0;
          Z <= "111110";
        elsif (RST = '0') then
          NS <= ST0;
          Z <= "011111";
        else -- catch all, deixa igual o anterior mesmo
          NS <= ST0;
          Z <= "111110";
        end if;
      when others => -- catch all, nunca deve chegar aqui
        NS <= ST0;
        Z <= "111110";
    end case;
  end process comb_process;

  -- codificação dos estados Y
  with PS select
    Y <= "000" when ST0,
    "001" when ST1,
    "010" when ST2,
    "011" when ST3,
    "100" when ST4,
    "101" when ST5,
    "000" when others;
end arch_Decoder7Seg;