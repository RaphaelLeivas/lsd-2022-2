
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SelectorTwoStack is
  port (
    X0, X1, X2 : in std_logic_vector(3 downto 0);
    sel : in std_logic_vector(2 downto 0);
    Y0, Y1 : out std_logic_vector(3 downto 0)
  );
end SelectorTwoStack;

architecture arch_SelectorTwoStack of SelectorTwoStack is
begin
  Y1 <= X2 when sel = "110" else
    X1 when sel = "011" else 
    X0 when sel = "001";
  Y0 <= X1 when sel = "110" else
    X0 when sel = "011" else
    "0000" when sel = "001";

end arch_SelectorTwoStack;