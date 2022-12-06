library IEEE;
use IEEE.std_logic_1164.all;

entity Calculator is
  port (
    CLK : in std_logic;
    RST : in std_logic; -- entrada da FSM
    Z0, Z1, Z2, Z3, Z4, Z5 : out std_logic_vector(0 to 7)); -- saidas efetivas da FSM
end Calculator;

architecture arch_Calculator of Calculator is
  type state_type is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9, ST10, ST11, ST12, ST13, ST14, ST15, ST16, ST17, ST18, ST19, ST20, ST21);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is
  "00000 00001 00010 00011 00100 00101 00110 00111 01000 01001 01010 01011 01100 01101 01110 01111 10000 10001 10010 10011 10100 10101";
  signal PS, NS : state_type;
  signal Y : std_logic_vector(4 downto 0); -- signal para os proximos estados da FSM
begin
  sync_process : process (CLK, NS)
  begin
    if (rising_edge(CLK)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (PS, RST)
  begin
    -- pre-assign saidas, assim nao precisa definir todas em cada estado
    Z0 <= "11111111";
    Z1 <= "11111111";
    Z2 <= "11111111";
    Z3 <= "11111111";
    Z4 <= "11111111";
    Z5 <= "11111111";

    -- condicao de RESET e a mesma para todos os estados, pode ir fora dos CASES
    if (RST /= '0') then
      NS <= ST0;
      Z0 <= "10111111";
    else
      case PS is
        when ST0 =>
          NS <= ST1;
          Z0 <= "10111111";

        when ST1 =>
          NS <= ST2;
          Z0 <= "01111111";

        when ST2 =>
          NS <= ST3;
          Z1 <= "01111111";

        when ST3 =>
          NS <= ST4;
          Z2 <= "01111111";

        when ST4 =>
          NS <= ST5;
          Z3 <= "01111111";

        when ST5 =>
          NS <= ST6;
          Z4 <= "01111111";

        when ST6 =>
          NS <= ST7;
          Z5 <= "01111111";

        when ST7 =>
          NS <= ST8;
          Z5 <= "11111011";

        when ST8 =>
          NS <= ST9;
          Z5 <= "11110111";

        when ST9 =>
          NS <= ST10;
          Z5 <= "11101111";

        when ST10 =>
          NS <= ST11;
          Z4 <= "11101111";

        when ST11 =>
          NS <= ST12;
          Z3 <= "11101111";

        when ST12 =>
          NS <= ST13;
          Z2 <= "11101111";

        when ST13 =>
          NS <= ST14;
          Z1 <= "11101111";

        when ST14 =>
          NS <= ST15;
          Z0 <= "11101111";

        when ST15 =>
          NS <= ST16;
          Z0 <= "11011111";

        when ST16 =>
          NS <= ST17;
          Z0 <= "11111101";

        when ST17 =>
          NS <= ST18;
          Z1 <= "11111101";

        when ST18 =>
          NS <= ST19;
          Z2 <= "11111101";

        when ST19 =>
          NS <= ST20;
          Z3 <= "11111101";

        when ST20 =>
          NS <= ST21;
          Z4 <= "11111101";

        when ST21 =>
          NS <= ST0;
          Z5 <= "11111101";

        when others => -- catch all, nunca deve chegar aqui
          NS <= ST0;
          Z0 <= "10111111";
      end case;
    end if;
  end process comb_process;

  -- codificação dos estados Y
  with PS select
    Y <=
    "00000" when ST0,
    "00001" when ST1,
    "00010" when ST2,
    "00011" when ST3,
    "00100" when ST4,
    "00101" when ST5,
    "00110" when ST6,
    "00111" when ST7,
    "01000" when ST8,
    "01001" when ST9,
    "01010" when ST10,
    "01011" when ST11,
    "01100" when ST12,
    "01101" when ST13,
    "01110" when ST14,
    "01111" when ST15,
    "10000" when ST16,
    "10001" when ST17,
    "10010" when ST18,
    "10011" when ST19,
    "10100" when ST20,
    "10101" when ST21,
    "00000" when others;
end arch_Calculator;