:: Modifique a linha abaixo para o caminho do seu computador onde se encontra os seus arquivos fonte a serem compilados e simulados.
cd C:\dev\lsd-2022-2\Aula09\Ex3 - Decoder\

:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a Decoder3x8/Decoder3x8.vhd
pause
ghdl -a OR4x1/OR4x1.vhd
pause
ghdl -a ComponentEx3.vhd
pause

ghdl -a tb_ComponentEx3.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_ComponentEx3
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_ComponentEx3 --vcd=tb_ComponentEx3.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_ComponentEx3.vcd  --script=gtkwave_print.tcl

:Done
