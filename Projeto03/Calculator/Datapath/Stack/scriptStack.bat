:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a Stack.vhd
pause

ghdl -a tb_Stack.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_Stack
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_Stack --vcd=tb_Stack.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_Stack.vcd  --script=gtkwave_print.tcl

:Done
