# Trabalho final: Projeto de Filtros Passivos
## Acadêmico: Kelvyn Augusto Waltrick Nonato

 ### Problema a ser resolvido:
 Você foi contratado(a) como engenheiro(a) para projetar um crossover passivo para uma caixa de som de duas vias (woofer e tweeter). O objetivo é garantir que os sinais de baixa frequência sejam enviados apenas para o woofer e os de alta frequência apenas para o tweeter, com máxima fidelidade e uma transição suave

 ### Objetivos e Especificações do Projeto

 O objetivo principal do projeto é desenvolver uma ferramenta computacional que projete um crossover passivo de duas vias, o woofer e o tweeter) com filtros Butterworth de 2ª ordem. Os objetivos são:

 - Calcular automaticamente os valores ideias de capacitores e indutores a partir da frequência de corte e da impedância de carga.
 - Selecionar quais seriam os componentes comerciais mais próximoscom base nas tabelas fornecidas para a atividade.
 - Gerar as funções de transferência dos filtros Passa-Baixas (LPF) e Passa-Altas (HPF), tanto apra o caso ideal quando para o caso real.
 - Gerar gráficos de Bode comporativos entre o filtro ideal e o filtro real.
 - Organizar os resultados de forma clara, permitindo a análise das diferenças entre os valores ideais e os reais.
 - Criar uma documentação completa no repositório do GitHub, que vai servir como relatório.

 ### Embasamento Teórico

 O projeto de um crossover passivo de duas vias envolve a implementação de filtros analógicos de 2ª ordem do tipo **Butterworth**, escolhidos por apresentarem a resposta plana quando está na banda passante e transição suave entre woofer e tweeter. A seguir são apresentadas as funções de transferência e as fórmulas utilizadas para o cálculo dos componentes ideiais. 

 ####  1. Filtros Butterworth de 2ª Ordem

Um filtro Butterworth de 2ª ordem possui resposta maximamente plana na banda passante e frequência de corte definida por:


$\omega_c = 2\pi f_c\$


A forma geral da função de transferência de um filtro Butterworth de 2ª ordem é:


$\ H(s) = \frac{1}{s^2 + \sqrt{2}\\omega_c s + \omega_c^2}\$

 #### 2. Filtro Passa-Baixas (LPF) - Woofer

 A Topologia utilizada foi um indutor em série e capacitor em derivação (shunt) com a carga.

 #### Função de transferência do circuito real:


 $\ H_{LP}(s) = \frac{1}{LC\ s^2 + R_L C\ s + 1}\$


 #### Fórmulas do projeto (Butterworth 2ª ordem)

 $\ L = \frac{R_L}{\pi f_c}\$

 $\ C = \frac{1}{2\pi f_c R_L}$


 #### 3. Filtro Passa-Altas (HPF) - Tweeter

 A Topologia utilizada foi um capacitor em série e indutor em derivação (shunt) com a carga.


 ### Impedâncias

$\ Z_C = \frac{1}{sC}  \quad Z_L = sL \$


$\ Z_{\parallel} = \frac{Z_L R_L}{Z_L + R_L} \$


####  Função de transferência


$\ H_{HP}(s) = \frac{Z_{\parallel}}{Z_{\parallel} + Z_C} \$


####  Fórmulas de projeto (Butterworth 2ª ordem)


$\ C = \frac{1}{\pi f_c R_L} \$


$\ L = \frac{R_L}{2\pi f_c} \$


 ### Lógica do Programa

 Desenvolvida para automatizar o projeto de um crossover passivo de duas vias utilizando de filtros Butterworth de 2ª ordem. A lógica do programa segue nas seguites etapas:

 #### 1. Entrada de parâmetros do usuário
  O programa inicia recebendo pelo usuário os valores fundamentais para o projeto:
  - Frequência de corte $\ f_c\$.
  - Impedância de carga $\ R_L\$.

 #### 2. Cálculo dos componentes ideais

  Utilizando os parâmetros do usuário de frequência e impedância. O programa calcula os componentes ideais com base nas fórmulas do filtro ButterWorth de 2ª ordem:

  ##### Para o LPF (woofer)

  $\ L = \frac{R_L}{\pi f_c}\$

  $\ C = \frac{1}{2 \pi f_c R_L}\$

  #### Para o HPF (tweeter)

  $\ L = \frac{R_L}{2 \pi f_c}\$

  $\ C = \frac{1}{\pi f_c R_L}\$

  Esses serãos os valores que representaram o filtro ideal, sem as limitações dos componentes de mercado.

 #### 3. Selecionando os componentes comerciais mais próximos

  O programa utiliza uma função implementada **proximo** que compara cada valor ideial com os vetores de componentes comerciais usando:

  $\ erro = |x_{ideal} - x_{comercial}|\$

  O componente com menor erro é selecionado como o **valor real**. Garantido que o filtro projetado possa ser implementado fisicamente.

  #### 4. Contrução das funções de transferência

  O programa monta duas funções de transferência para cada filtro: O filtro ideal e o filtro real.

  **Filtro ideal**: Usa os valores ideias de L e C.

  **Filtro real**: Usa os valores comerciais selecionados.

  As funções são construídas com base nos modelos de impedância.

  - $\ Z_L = s_L \$
  - $\ Z_C = \frac{1}{s_C} \$
  - $\ Z_{||} = \frac{Z_L R_L}{Z_L + R_L}\$

  O MATLAB monta as expessões simbólicas atumaticamente e gera os sistemas dinâmicos correspondentes.

  #### 5. Gerando os gráficos de Bode

  Com as funções de transferência ideal e real, o programa vai:

  - Calcular magnitude e fase em função da frequência.
  - Plotar ambas as curvas no mesmo gráfico.
  - Permitir a comparação:
    - do deslocamento da frequência de corte;
    - da diferença de inclunação;
    - do impacto dos componentes comerciais;
   
  #### 6. Exibição dos resultados

  O programa apresenta:
   - Os valores ideais calculados.
   - Os valores comerciais selecionados.
   - Os gráficos de Bode comparativos.
   - As diferenças observadas entre ideal e real.

 #### Guia de Execução

 - Instale o arquivo [ProjetorDeFiltrosPassivos.m](Filtros%20Passivos/ProjetorDeFiltrosPassivos.m) e o abra com o MATLAB.
 - Execute o programa.
 - O programa irá pedir para inserir os parâmetros do projeto: Frequência de Corte (em kHz) e Impedância de Carga (em Ω).
 - Ao rodar, você verá no console: Os valores ideais de L e C e os valores comerciais selecionados para ambos os filtros.
 - Ele irá abrir duas janelas gráficas: Gráfico de Bode do LPF (ideal x real) e Gráfico de Bode do HPF (ideal x real).

 ### Resultados

 ### Análise Crítica

 ### Conclusões

![Filtro Teste](Imagens/Comparativo%20Bode%20-%20Passa-Alta%202%C2%AA%20Ordem%20para%20Tweeter.png)
