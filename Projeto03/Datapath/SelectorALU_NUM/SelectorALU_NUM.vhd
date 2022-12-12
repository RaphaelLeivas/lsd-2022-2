
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SelectorALU_NUM is
  port (
    X0, X1 : in std_logic_vector(3 downto 0);
    sel0 : in std_logic;
    sel1 : in std_logic_vector(2 downto 0);
    Y0, Y1, Y2 : out std_logic_vector(3 downto 0)
  );
end SelectorALU_NUM;

architecture arch_SelectorALU_NUM of SelectorALU_NUM is
begin
  Y2 <= X0 when (sel0 = '0' and sel1 = "100") else
    X1 when (sel0 = '1' and sel1 = "100");
  Y1 <= X0 when (sel0 = '0' and sel1 = "010") else
    X1 when (sel0 = '1' and sel1 = "010");
  Y0 <= X0 when (sel0 = '0' and sel1 = "001") else
    X1 when (sel0 = '1' and sel1 = "001");

end arch_SelectorALU_NUM;