ghdl -a Calculator/Datapath/ALU/ALU.vhd
ghdl -a Calculator/Datapath/SelectorALU_NUM/SelectorALU_NUM.vhd
ghdl -a Calculator/Datapath/SelectorTwoStack/SelectorTwoStack.vhd
ghdl -a Calculator/Datapath/StackRegister/StackRegister.vhd

ghdl -a Calculator/Datapath/Datapath.vhd
ghdl -a Calculator/ControlBlock/ControlBlock.vhd

ghdl -a ClockDivider/ClockDivider.vhd
ghdl -a Calculator/Calculator.vhd
ghdl -a Projeto03.vhd

ghdl -a tb_Projeto03.vhd

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_Projeto03
pause

ghdl -r tb_Projeto03 --vcd=tb_Projeto03.vcd
gtkwave -f tb_Projeto03.vcd  --script=gtkwave_print.tcl

:Done
