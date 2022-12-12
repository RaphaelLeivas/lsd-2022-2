ghdl -a ControlBlock.vhd
@REM pause

ghdl -a tb_ControlBlock.vhd
@REM pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_ControlBlock
@REM pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_ControlBlock --vcd=tb_ControlBlock.vcd
@REM pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_ControlBlock.vcd  --script=gtkwave_print.tcl

:Done
