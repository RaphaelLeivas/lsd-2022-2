:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a SelectorALU_NUM.vhd
pause

ghdl -a tb_SelectorALU_NUM.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e SelectorALU_NUM
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_SelectorALU_NUM --vcd=tb_SelectorALU_NUM.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_SelectorALU_NUM.vcd  --script=gtkwave_print.tcl

:Done
