-----------------------------------------------------------
-- Model of a simple testbench to simulate a D Flip-Flop --
-----------------------------------------------------------
-- library declaration
library IEEE;
use IEEE.std_logic_1164.all;
-- top-level entity
entity tb_ffd is
end tb_ffd;

-- architecture
architecture teste of tb_ffd is
-- component declaration
component d_ff is
    port (  D, CLK, RST : in std_logic;
            Q : out std_logic);
end component;

constant PERIODO : time := 10 ns;
signal ENT_CLK : std_logic := '0'; -- deve ser inicializado
signal ENT_CLK_ENABLE: std_logic := '1'; -- Sinal de Enable do clock só para efeito de controle do fim da simulação
signal ENT_RST : std_logic;
signal ENT_D : std_logic;
signal SAI_Q : std_logic;

begin
    -- geração do clock com periodo PERIODO
    ENT_CLK <= ENT_CLK_ENABLE and not ENT_CLK after PERIODO/2;
    ENT_CLK_ENABLE <= '1', '0' after 20*PERIODO; -- a simulação termina após transcorrer 20 períodos de clock.

    -- instanciação do DUT, que nesse exemplo é um ffd
    DUT : d_ff port map(CLK => ENT_CLK,
                        RST => ENT_RST,
                        D => ENT_D,
                        Q => SAI_Q);
    -- a partir daqui declaro os estímulos de entrada, ou a injecao de sinais
    -- um process para o reset
    reset: process
    begin
        ENT_RST <= '1';
        wait for 2*PERIODO; -- um reset de duração de 2 períodos de clock
        ENT_RST <= '0';
        wait;
    end process reset;
    -- um outro process para os estímulos da entrada D
    stimulus: process
    begin
        ENT_D <= '0';
        wait for 4*PERIODO;
        ENT_D <= '1';
        wait for 6*PERIODO;
        ENT_D <= '0';
        wait for 3*PERIODO;
        ENT_D <= '1';
        wait;
    end process stimulus;
end teste;