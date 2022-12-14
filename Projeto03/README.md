## Referências RTL e RPN

- https://en.wikipedia.org/wiki/Reverse_Polish_notation 
- "In HP calculators, the stack is four levels high." (Fonte: wikipedia). No nosso projeto, a nossa stack será representada por
exatamente 4 registradores (STACK0, STACK1, STACK2, STACK3).

## Funcionamento da calculadora

- Operadores sempre tira os dois mais altos da stack, calcula a operação, e joga o resultado no andar mais alto.
- Vamos usar clock 100kHz, nao precisa ser rapido demais para a calculadora (Usar o divisor de clock), ai da para usar o 
ClockDivider usado no Projeto02. 
    * evita problema com operação lenta em caminho crítico do RTL
- vamos tentar usar as 4 operações como +, -, *, /, pois os operadores sao mais simples.
- Usar quatro displays. Se o numero for maior que 9999 (decimal), mostra 9999 mesmo
- usa 4 registradores para a stack. O registrador de saida, que mostra nos 4 displays, é sempre o registrador mais alto
da stack, pois é sempre ele que mostra a ultima operação.
- Para tratar todos os numeros reais, usamos os 32 bits dos registradores da seguinte forma
    Reg[31] = bit de sinal
    Reg[30 até 10] = bits da parte inteira
    Reg[9 ate 0] = bits da parte decimal (2^-1, 2^-2, etc)
- os registradores da stack podem ser de 32 bits (ai é suficiente os 4 displays).
- O uso total de memoria da stack, assim, será de 4 x 32 = 128 bits = 16 bytes
- Com 32 bis conseguimos ter 10 bits para as casas decimais, mantendo uma precisão e exatidão boa para a calculadora.

- Preciso de um componente que le um numero de 32 bits (com a notação de ponto fixo e bit de sinal definida acima) e retorna ele codificado em 4 displays 7 segmentos (retorna 4 signals de 8 bits, incluindo o bit do ponto decimal). 

### Casos particulares

- Divisao por zero -> nao faz nada
- Se tiver menos que dois numeros na stack ao chamar o operador -> nao faz nada
