ghdl -a Datapath/ALU/ALU.vhd
ghdl -a Datapath/SelectorALU_NUM/SelectorALU_NUM.vhd
ghdl -a Datapath/SelectorTwoStack/SelectorTwoStack.vhd
ghdl -a Datapath/StackRegister/StackRegister.vhd

ghdl -a Datapath/Datapath.vhd
ghdl -a ControlBlock/ControlBlock.vhd

ghdl -a Calculator.vhd
pause

ghdl -a tb_Calculator.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_Calculator
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_Calculator --vcd=tb_Calculator.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_Calculator.vcd  --script=gtkwave_print.tcl

:Done
