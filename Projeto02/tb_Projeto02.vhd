library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity tb_Projeto02 is
end tb_Projeto02;

architecture arch_tb_Projeto02 of tb_Projeto02 is

  component Projeto02 is
    port (
      CLK, RESET : in std_logic;
      PROJ_OUT : out std_logic_vector(1 downto 0)
    );
  end component;

  constant PERIODO : time := 10 ns;
  signal ent_clk : std_logic := '0'; -- deve ser inicializado
  signal ent_clk_enable : std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
  signal sai_proj_out : std_logic_vector(1 downto 0);
  signal ent_reset : std_logic;

begin
  -- geração do clock com periodo PERIODO
  ent_clk <= ent_clk_enable and not ent_clk after PERIODO/2;
  ent_clk_enable <= '1', '0' after 200 * PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

  -- instanciação do DUT
  DUT : Projeto02 port map(
    CLK => ent_clk,
    RESET => ent_reset,
    PROJ_OUT => sai_proj_out
  );

  --  process para os estímulos das entradas
  stimulus : process
  begin
    ent_reset <= '0';
    wait for 4 * PERIODO;
    ent_reset <= '1';
    wait for 4 * PERIODO;
    ent_reset <= '0';
    wait for 4 * PERIODO;
    ent_reset <= '1';
    wait for 4 * PERIODO;
    wait;
  end process stimulus;

end arch_tb_Projeto02;