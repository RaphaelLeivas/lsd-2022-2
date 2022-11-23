:: Modifique a linha abaixo para o caminho do seu computador onde se encontra os seus arquivos fonte a serem compilados e simulados.
cd C:\dev\lsd-2022-2\Projeto02

:: Modifique as linhas seguintes para incluir os arquivos .vhd que deseja analisar (compilar).
ghdl -a Decoder3x8/Decoder3x8.vhd
pause
ghdl -a OR4x1/OR4x1.vhd
pause
ghdl -a Projeto02.vhd
pause

ghdl -a tb_Projeto02.vhd
pause

:: Modifique a linha a seguir com o nome da entidade top level do arquivo testbench que você deseja simular.
ghdl -e tb_Projeto02
pause

:: Modifique a linha a seguir com o nome do arquivo testbench que você deseja simular e o nome do arquivo .vcd que deseja gerar.
ghdl -r tb_Projeto02 --vcd=tb_Projeto02.vcd
pause

:: Modifique a linha a seguir com o nome do arquivo .vcd que deseja visualizar com o GTKWAVE.
gtkwave -f tb_Projeto02.vcd  --script=gtkwave_print.tcl

:Done
