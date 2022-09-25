# lsd-2022-2
Repositório para os códigos da disciplina de laboratório de Sistemas Digitais - 2022/2

:warning: Lembre de trocar o endereço dos diretórios ao rodar os scripts de compilação!

:warning: Use o atalho ``` shift + alt + f ``` para formatar automaticamente o arquivo .vhdl para manter o estilo de código padronizado.

## :pencil2:  Padronizações de código :pencil2:

:warning: Use o atalho ``` shift + alt + f ``` para formatar automaticamente o arquivo .vhdl para manter o estilo de código padronizado.

- Nome de componente / entidade: UpperCamelCase. Ex: ComponentEx7 <br />
    Evite nomes muitos longos (e com muitos underlines) para facilitar manutenção.
- Nome de testbench: tb_ComponentEx7
- Nome de process: process_ComponentEx7
- Nome de arquitetura: arch_ComponentEx7 / arch_tb_ComponentEx7

## :computer:  Configuração de ambiente (Windows) :computer:

Para configurar o ambiente local da máquina, siga o passo a passo
(ou siga o PDF de instalação na pasta /docs.)

1) Instale o editor VS Code (recomendado)

2) Instale o compilador e simulador VHDL: GHDL
Para baixar (download) o GHDL para MS-Windows clique aqui:
<br />  https://github.com/ghdl/ghdl/releases/download/v0.37/ghdl-0.37-mingw32-mcode.zip <br />
Descompacte o arquivo .zip baixado para um diretório do seu computador.
Anote o local que a pasta descompactada está, será necessário voltar lá.

3) Vá nas variáveis de ambiente e adicione no final da lista de endereçoes da variável de sistema Path o endereço para dentro da basta /bin, que se encontra dentro da pasta descompactada do item (2).

4) Feche todos os terminais, abra um novo e rode o comando 
<br /> <br /> ``` ghdl ``` <br /> <br />
 Deve se aparecer a resposta do tipo 
<br /> <br /> ```C:\GHDL\0.37-mingw32-mcode\bin\ghdl.exe: missing command, try C:\GHDL\0.37-mingw32-mcode\bin\ghdl.exe --help ``` <br /> <br /> 
Se aparecer isso, a instalação do GHDL está correta.


5) Instale o visualizador de formas de onda: GTKWAVE
Para baixar (download) o GTKWAVE para MS-Windows clique aqui:
<br /> https://sourceforge.net/projects/gtkwave/files/gtkwave-3.3.100-bin-win32/ <br />
Descompacte o arquivo .zip baixado para um diretório do seu computador.
Anote o local que a pasta descompactada está, será necessário voltar lá.

6) Vá nas variáveis de ambiente e adicione no final da lista de endereçoes da variável de sistema Path o endereço para a dentro da basta /bin, que se encontra dentro da pasta descompactada do item (5).

7) Feche todos os terminais, abra um novo e rode o comando
<br /> <br /> ``` gtkwave ``` <br /> <br />
Deve abrir automaticamente a tela do aplicativo do GTKWAVE.

8) Instale as seguintes extensões no VS Code
- TerosHDL
- GHDL Interface



