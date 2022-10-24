:: Modifique a linha abaixo para o caminho do seu computador onde se encontra os seus arquivos fonte a serem compilados e simulados.
cd C:\dev\lsd-2022-2\Aula08\Ex2OneHot

:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a ComponentEx2OneHot.vhd
pause

ghdl -a tb_ComponentEx2OneHot.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_ComponentEx2OneHot
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_ComponentEx2OneHot --vcd=tb_ComponentEx2OneHot.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_ComponentEx2OneHot.vcd  --script=gtkwave_print.tcl

:Done
