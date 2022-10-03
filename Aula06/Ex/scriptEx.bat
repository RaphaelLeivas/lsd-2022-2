:: Modifique a linha abaixo para o caminho do seu computador onde se encontra os seus arquivos fonte a serem compilados e simulados.
cd C:\Users\Aluno\Documents\LSD_2_SEG\Aula_6\Ex

:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a ComponentEx.vhd


ghdl -a tb_ComponentEx.vhd


:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_ComponentEx


:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_ComponentEx --vcd=tb_ComponentEx.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_ComponentEx.vcd  --script=gtkwave_print.tcl

:Done
