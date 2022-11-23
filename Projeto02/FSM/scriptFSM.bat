:: Modifique a linha abaixo para o caminho do seu computador onde se encontra os seus arquivos fonte a serem compilados e simulados.
cd C:\dev\lsd-2022-2\Projeto02\FSM

:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a FSM.vhd
pause

ghdl -a tb_FSM.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_FSM
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_FSM --vcd=tb_FSM.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_FSM.vcd  --script=gtkwave_print.tcl

:Done
