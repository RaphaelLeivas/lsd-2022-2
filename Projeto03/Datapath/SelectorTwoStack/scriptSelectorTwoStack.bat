:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a SelectorTwoStack.vhd
pause

ghdl -a tb_SelectorTwoStack.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e SelectorTwoStack
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_SelectorTwoStack --vcd=tb_SelectorTwoStack.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_SelectorTwoStack.vcd  --script=gtkwave_print.tcl

:Done
