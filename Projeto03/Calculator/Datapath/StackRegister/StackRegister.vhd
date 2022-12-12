
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity StackRegister is
  port (
    X : in std_logic_vector(3 downto 0);
    load, clear : in std_logic;
    isEmpty : out std_logic;
    Y : out std_logic_vector(3 downto 0)
  );
end StackRegister;

architecture arch_StackRegister of StackRegister is
  signal Y_interm : std_logic_vector(3 downto 0);
begin
  Y_interm <=
    "0000" when clear = '1' else
    X when load = '1' else
    Y_interm;

  isEmpty <= clear;
  Y <= Y_interm;
end arch_StackRegister;