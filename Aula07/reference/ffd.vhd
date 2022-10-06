----------------------------------------------------------------
-- D Flip-flop model with active-high synchronous reset input. --
----------------------------------------------------------------
-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
-- entity
entity d_ff is
port (  D, CLK, RST : in std_logic;
        Q : out std_logic);
end d_ff;
-- architecture
architecture my_d_ff of d_ff is
begin
    dff: process (CLK)
    begin
        if (rising_edge(CLK)) then
            if (RST = '1') then
                Q <= '0';
            else
                Q <= D;
            end if;
        end if;
    end process dff;
end my_d_ff;
