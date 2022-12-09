library IEEE;
use IEEE.std_logic_1164.all;

entity Calculator is
  port (
    CLK : in std_logic;
    RST, ENTER_NUM, ENTER_ENTER_OPR : in std_logic;
    NUM : in std_logic_vector(3 downto 0);
    OPR : in std_logic_vector(1 downto 0);
    Z0, Z1, Z2, Z3 : out std_logic_vector(0 to 7));
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
  end process comb_process;
end arch_Calculator;