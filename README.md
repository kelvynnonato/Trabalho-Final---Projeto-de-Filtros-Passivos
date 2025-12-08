# Trabalho final: Projeto de Filtros Passivos
## Acadêmico: Kelvyn Augusto Waltrick Nonato

 ### Problema a ser resolvido:
 Você foi contratado(a) como engenheiro(a) para projetar um crossover passivo para uma caixa de som de duas vias (woofer e tweeter). O objetivo é garantir que os sinais de baixa frequência sejam enviados apenas para o woofer e os de alta frequência apenas para o tweeter, com máxima fidelidade e uma transição suave.

 ### Objetivos e Especificações do Projeto

 O objetivo principal do projeto é desenvolver uma ferramenta computacional que projete um crossover passivo de duas vias, o woofer e o tweeter, com filtros Butterworth de 2ª ordem. Os objetivos são:

 - Calcular automaticamente os valores ideais de capacitores e indutores a partir da frequência de corte e da impedância de carga.
 - Selecionar quais seriam os componentes comerciais mais próximos com base nas tabelas fornecidas para a atividade.
 - Gerar as funções de transferência dos filtros Passa-Baixas (LPF) e Passa-Altas (HPF), tanto para o caso ideal quanto para o caso real.
 - Gerar gráficos de Bode comparativos entre o filtro ideal e o filtro real.
 - Organizar os resultados de forma clara, permitindo a análise das diferenças entre os valores ideais e os reais.
 - Criar uma documentação completa no repositório do GitHub, a qual vai servir como relatório.

 ### Embasamento Teórico

 O projeto de um crossover passivo de duas vias envolve a implementação de filtros analógicos de 2ª ordem do tipo **Butterworth**, escolhidos por apresentarem a resposta plana quando está na banda passante e transição suave entre woofer e tweeter. A seguir são apresentadas as funções de transferência e as fórmulas utilizadas para o cálculo dos componentes ideais. 

 ####  1. Filtros Butterworth de 2ª Ordem

Um filtro Butterworth de 2ª ordem possui resposta maximamente plana na banda passante e frequência de corte definida por:


$\omega_c = 2\pi f_c $


A forma geral da função de transferência de um filtro Butterworth de 2ª ordem é:


$\ H(s) = \frac{1}{s^2 + \sqrt{2}\\omega_c s + \omega_c^2}\$

 #### 2. Filtro Passa-Baixas (LPF) - Woofer

 A **Topologia** utilizada foi um indutor em série e capacitor em derivação (shunt) com a carga.

 #### Função de transferência do circuito real:


 $\ H_{LP}(s) = \frac{1}{LC\ s^2 + R_L C\ s + 1} $


 #### Fórmulas do projeto (Butterworth 2ª ordem)

 $\ L = \frac{R_L}{\pi f_c} $

 $\ C = \frac{1}{2\pi f_c R_L} $


 #### 3. Filtro Passa-Altas (HPF) - Tweeter

 A **Topologia** utilizada foi um capacitor em série e indutor em derivação (shunt) com a carga.


 ### Impedâncias

$\ Z_C = \frac{1}{sC}  \quad Z_L = sL $


$\ Z_{\parallel} = \frac{Z_L R_L}{Z_L + R_L} $


####  Função de transferência


$\ H_{HP}(s) = \frac{Z_{\parallel}}{Z_{\parallel} + Z_C} $


####  Fórmulas de projeto (Butterworth 2ª ordem)


$\ C = \frac{1}{\pi f_c R_L} $


$\ L = \frac{R_L}{2\pi f_c} $


 ### Lógica do Programa

 Desenvolvida para automatizar o projeto de um crossover passivo de duas vias utilizando de filtros Butterworth de 2ª ordem. A lógica do programa segue nas seguintes etapas:

 #### 1. Entrada de parâmetros do usuário
  O programa inicia recebendo pelo usuário os valores fundamentais para o projeto:
  - Frequência de corte $\ f_c $.
  - Impedância de carga $\ R_L $.

 #### 2. Cálculo dos componentes ideais

  Utilizando os parâmetros do usuário de frequência e impedância. O programa calcula os componentes ideais com base nas fórmulas do filtro Butterworth de 2ª ordem:

  ##### Para o LPF (woofer)

  $\ L = \frac{R_L}{\pi f_c} $

  $\ C = \frac{1}{2 \pi f_c R_L} $

  #### Para o HPF (tweeter)

  $\ L = \frac{R_L}{2 \pi f_c} $

  $\ C = \frac{1}{\pi f_c R_L} $

  Esses serão os valores que representarão o filtro ideal, sem as limitações dos componentes de mercado.

 #### 3. Selecionando os componentes comerciais mais próximos

  O programa utiliza uma função implementada **proximo** que compara cada valor ideal com os vetores de componentes comerciais utilizando:

  $\ erro = |x_{ideal} - x_{comercial}|\$

  O componente com menor erro é selecionado como o **valor real**. Garantindo que o filtro projetado possa ser implementado fisicamente.

  #### 4. Construção das funções de transferência

  O programa monta duas funções de transferência para cada filtro: O filtro **ideal** e o filtro **real**.

  **Filtro ideal**: Usa os valores ideais de L e C.

  **Filtro real**: Usa os valores comerciais selecionados.

  As funções são construídas com base nos modelos de impedância.

  - $\ Z_L = s_L $
  - $\ Z_C = \frac{1}{s_C} $
  - $\ Z_{||} = \frac{Z_L R_L}{Z_L + R_L} $

  O MATLAB monta as expressões simbólicas automaticamente e gera os sistemas dinâmicos correspondentes.

  #### 5. Gerando os gráficos de Bode

  Com as funções de transferência ideal e real, o programa vai:

  - Calcular magnitude e fase em função da frequência.
  - Plotar ambas as curvas no mesmo gráfico.
  - Permitir a comparação:
    - do deslocamento da frequência de corte;
    - da diferença de inclinação;
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
 - O programa irá pedir para inserir os parâmetros do projeto: Frequência de Corte (em kHz) e Impedância de Carga (em Ω). Dessa forma:
   
   ![Entrada de Dados](Imagens/Entrada%20de%20Dados.png)
   
 - Ao rodar, você verá no console os valores ideais de L e C e os valores comerciais selecionados para ambos os filtros.
 - Ele irá abrir duas janelas gráficas: Gráfico de Bode do LPF (ideal x real) e Gráfico de Bode do HPF (ideal x real).

 ### Resultados

 Para a minha análise de resultados, foi utilizado uma Impedância de Carga de **8 Ω** e uma Frequência de Corte de **2.2 kHz**.
 O programa nos retornou:

 ![Componentes Recomendados](Imagens/Componentes%20Recomendados.png)

 Podemos reparar que a proximidade dos indutores é bem grande, com pouca diferença. Diferente dos capacitores, onde os ideais são muito menores que os encontrados comercialmente, o que vai refletir diretamente na implementação do filtro.

 Com os componentes reais e ideais, também recebemos o gráfico de Bode comparativo dos dois filtros:

 #### Filtro Woofer:
 ![Filtro Woofer](Imagens/Comparativo%20Bode%20-%20Passa-Baixa%202ª%20Ordem%20para%20Woofer.png)

 #### Filtro Tweeter:
 ![Filtro Tweeter](Imagens/Passa%20Alta.png)

 Os filtros Butterworth projetados com os componentes ideais apresentam uma resposta muito próxima do modelo teórico, mantendo a característica da banda passante plana e uma transição suave, o que é típico do alinhamento Butterworth. 
 Quando substituímos os valores ideais pelos componentes comerciais, podemos analisar pequenas alterações na resposta em frequência. O início da atenuação apresenta um leve "degrau" ou irregularidade, o que pode resultar em uma atenuação inicial um pouco abrupta e uma possível passagem de pequenos componentes indesejados (ruídos ou harmônicos). Evidenciando como a escolha dos componentes comerciais influencia o comportamento real do crossover.

 ### Análise Crítica

A comparação entre os filtros ideais e os filtros implementados com componentes comerciais revela diferenças importantes.

#### 1. Diferenças nos valores dos componentes

Os valores ideais calculados para L e C não coincidem exatamente com os valores disponíveis comercialmente. Na média, os desvios observados ficaram entre **5% e 20%**. Esses desvios alteram diretamente o fator de amortecimento e a frequência natural do filtro.

#### 2. Deslocamento da frequência de corte

Ao substituir os valores ideais pelos comerciais, a frequência de corte apresentou um deslocamento. Esse deslocamento é visível nos gráficos de Bode, onde o início da atenuação ocorre um pouco antes ou depois do previsto pelo modelo ideal.

#### 3. Impacto prático no sistema de áudio

Na prática, essas diferenças podem ocasionar:
- Transição menos suave entre woofer e tweeter.  
- Pequena sobreposição ou “buraco” na região do crossover.  
- Leve alteração no equilíbrio tonal.  
- Possibilidade de passagem de componentes indesejados próximas ao corte.  

Apesar disso, o impacto tende a ser **sutil** em aplicações de áudio doméstico. Entretanto, em sistemas de alta fidelidade, essas diferenças podem ser perceptíveis e justificar ajustes finos ou uso de componentes de precisão.

#### 4. A diferença seria audível?

Em condições normais, a diferença é **pouco audível**, especialmente porque:
- O ouvido humano tem tolerância natural a pequenas variações de amplitude.  
- O próprio alto‑falante mascara parte das imperfeições.  
- O ambiente acústico introduz variações muito maiores que as do filtro.  

Ainda assim, em testes críticos ou ambientes controlados, o deslocamento da frequência de corte pode ser percebido como uma leve mudança na transição entre graves e agudos.


 ### Conclusões

O projeto pôde atingir os objetivos propostos: foi desenvolvida uma ferramenta capaz de calcular os componentes ideais de um filtro Butterworth de 2ª ordem, selecionando automaticamente os valores comerciais mais próximos e gerando gráficos comparativos entre o comportamento ideal e o real. A análise dos resultados permitiu compreender o impacto prático dessas diferenças no desempenho do sistema de áudio.

O maior desafio do projeto foi como lidar com a limitação imposta pelos valores comerciais de indutores e capacitores e os selecionando pela proximidade com os valores ideais. A necessidade de adaptar o projeto aos componentes disponíveis reforça a importância de analisar o comportamento real do sistema e não apenas o modelo matemático.

O trabalho demonstrou que, por mais que os componentes comerciais introduzam pequenas variações na resposta do filtro, o desempenho geral permanece adequado para aplicações de áudio do cotidiano. Além disso, o processo reforçou o quão importante é a simulação, a análise crítica e a validação experimental como etapas essenciais em qualquer projeto de engenharia.


