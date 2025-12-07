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

 ### 🔹 1. Filtros Butterworth de 2ª Ordem

Um filtro Butterworth de 2ª ordem possui resposta maximamente plana na banda passante e frequência de corte definida por:


\[
\omega_c = 2\pi f_c
\]


A forma geral da função de transferência de um filtro Butterworth de 2ª ordem é:


\[
H(s) = \frac{1}{s^2 + \sqrt{2}\,\omega_c s + \omega_c^2}
\]


 ### Lógica do Programa

 #### Guia de Execução

 ### Resultados

 ### Análise Crítica

 ### Conclusões

![Filtro Teste](Imagens/Comparativo%20Bode%20-%20Passa-Alta%202%C2%AA%20Ordem%20para%20Tweeter.png)
