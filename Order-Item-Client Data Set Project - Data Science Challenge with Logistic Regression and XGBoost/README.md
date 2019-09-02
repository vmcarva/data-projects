# Data-Science-Challenge

As respostas dos exercícios e os modelos para predição de churn de clientes estão desenvolvidos no notebook **Data Science Challenge**.

A estratégia foi testar modelos com dois algoritmos diferentes em uma base com features de valores agregados e gerados da base original. A escolha de um modelo mais convencional contra um modelo mais robusto foi proposital para contrastar o desempenho de cada um deles em identificar os casos de churn. 

O primeiro é a regressão logística, geralmente usada para prever a ocorrência de algum evento com saída discreta (verdadeiro ou falso, ou 'é churn ou não'). O segundo é um algoritmo conhecidamente mais robusto e preciso chamado XGBoost. Ele é utilizado para classificação e regressão, trabalhando com um modelo conjunto, que soma a previsão de várias árvores de decisão juntas.

Sumário do que foi desenvolvido:

1. **Funções e Bibliotecas**

2. **File Import**

3. **Data Overview**

4. **Exploratory Data Analysis**

5. **Feature Engineering**

6. **Regressão Logística**

7. **XGBoost**

8. **Comparação de Resultados dos Modelos**

9. **Prevendo Casos Nulos da Base**

Tanto o código, quanto as explicações das decisões, a avaliação dos resultados dos modelos ou possíveis comparações com métodos alternativos estão em comentários junto com o desenvolvimento. O notebook está bastante explicativo em relação ao que foi realizado e aos resultados. 

No fim do notebook há respostas para futuras melhorias nos modelos.
