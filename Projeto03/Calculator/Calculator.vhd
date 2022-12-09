library IEEE;
use IEEE.std_logic_1164.all;

entity Calculator is
  port (
    CLK : in std_logic;
    RST, ENTER_NUM, ENTER_OPR : in std_logic;
    NUM : in std_logic_vector(3 downto 0);
    OPR : in std_logic_vector(1 downto 0);
    Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
end Calculator;

architecture arch_Calculator of Calculator is
  type state_type is (RESET, WAIT_ENTER, SAVE_NUM);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is
  "000 001 010";
  signal PS, NS : state_type;
  signal Y : std_logic_vector(2 downto 0); -- signal para os proximos estados da FSM
  signal STACK_ENABLE : std_logic;
begin
  sync_process : process (CLK, NS)
  begin
    if (rising_edge(CLK)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (PS)
  begin
    -- pre-assign saidas, assim nao precisa definir todas em cada estado
    Z0 <= "11111111";
    Z1 <= "11111111";
    Z2 <= "11111111";
    Z3 <= "11111111";

    case PS is
      when RESET =>
        NS <= WAIT_ENTER;

      when WAIT_ENTER =>
        if (RST = '1') then
          NS <= RESET;
        end if;

        if (ENTER_NUM = '1') then
          NS <= SAVE_NUM;
        else 
          NS <= WAIT_ENTER;
        end if;

        STACK_ENABLE <= '0';

      when SAVE_NUM =>
        NS <= WAIT_ENTER;

      when others => -- catch all, nunca deve chegar aqui
        NS <= WAIT_ENTER;
    end case;
end process comb_process;

-- codificação dos estados Y
with PS select
  Y <=
  "000" when RESET,
  "001" when WAIT_ENTER,
  "010" when SAVE_NUM,
  "000" when others;
end arch_Calculator;