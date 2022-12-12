-- O proprio registrador da stack e uma FSM

library IEEE;
use IEEE.std_logic_1164.all;

entity StackRegister is
  port (
    X : in std_logic_vector(3 downto 0);
    load, clear, clk : in std_logic;
    isEmpty : out std_logic;
    Z : out std_logic_vector(3 downto 0)
  );
end StackRegister;

architecture arch_StackRegister of StackRegister is
  type state_type is (HOLD_ST, LOAD_ST, CLEAR_ST);
  attribute ENUM_ENCODING : string;
  attribute ENUM_ENCODING of state_type : type is "00 01 10";
  signal PS, NS : state_type;

  signal Y : std_logic_vector(1 downto 0); -- para os estados da FSM
begin
  sync_process : process (CLK, NS)
  begin
    if (rising_edge(CLK)) then
      PS <= NS;
    end if;
  end process sync_process;

  comb_process : process (PS, load, clear, X)
  begin
    
    case PS is

      when HOLD_ST =>
        if (clear = '1') then
          NS <= CLEAR_ST;
        elsif (load = '1') then
          NS <= LOAD_ST;
        else
          NS <= HOLD_ST;
        end if;

      when LOAD_ST =>
        Z <= X;
        isEmpty <= '0'; 
        NS <= HOLD_ST;

      when CLEAR_ST =>
        Z <= "0000";
        isEmpty <= '1'; 

        if (clear = '0') then
          NS <= HOLD_ST;
        else 
          NS <= CLEAR_ST;
        end if;

      when others => -- catch all, nunca deve chegar aqui
        NS <= HOLD_ST;
    end case;
  end process comb_process;

  -- codificação dos estados Y
  with PS select
    Y <= "00" when HOLD_ST,
    "01" when LOAD_ST,
    "10" when CLEAR_ST,
    "00" when others;
end arch_StackRegister;