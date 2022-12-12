ghdl -a ALU/ALU.vhd
ghdl -a SelectorALU_NUM/SelectorALU_NUM.vhd
ghdl -a SelectorTwoStack/SelectorTwoStack.vhd
ghdl -a StackRegister/StackRegister.vhd

ghdl -a Datapath.vhd
pause

ghdl -a tb_Datapath.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_Datapath
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_Datapath --vcd=tb_Datapath.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_Datapath.vcd  --script=gtkwave_print.tcl

:Done
