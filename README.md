# rede-eletrica-com-grafos
Trabalho Final da disciplina Algoritmo em Grafos, onde que tivemos que conectar torres, usando grafos.

Descrição do que foi feito:

Componentes: André Marinho Moreira, Clinton Julio Novais Amaral, Lucas Stehling Lara Carvalho

1 - Introdução (Descrição do Problema):

O oeste catarinense está na escuridão total, pois um tornado devastou a região.
Antes, a infraestrutura elétrica da região era maravilhosa, de modo que duas torres
de energia eram conectadas diretamente por cabos de energia se e somente se entre
essas torres existia uma estrada. O tornado não danificou as estradas, apenas as
torres e cabos de energia. De todas as empresas que se propuseram a restaurar a
infraestrutura elétrica da região, a que apresentou a melhor proposta foi a Pikachu S.
A. Para começar os trabalhos, a Pikachu S. A. exigiu do Governo algumas
informações. Se essas informações não satisfizerem algumas condições, a Pikachu
S. A. rescindirá o contrato e o Governo terá de contratar uma empresa, para nossa
tristeza. A saber, as condições exigidas pela Pikachu S. A. são:
1. A empresa não construirá nenhuma torre nova, apenas restaurará todas as torres
antigas.
2. A empresa não conectará duas torres por cabos de energia se essas torres não
eram antes conectadas.
3. A empresa fará apenas o mínimo de conexões entre torres necessário para que as
torres estejam todas interconectadas, direta ou indiretamente, e gastará o mínimo
possível de metros de cabeamento.
4. Cada torre que for restaurada precisará receber um funcionário da Pikachu S. A.
para monitorar a torre diariamente. Este funcionário pode ser um funcionário efetivo
ou um estagiário.
5. Se os funcionários que duas torres receberem forem estagiários, então deve existir
uma estrada conectando as duas torres diretamente.
6. Se os funcionários que duas torres receberem forem efetivos, então não deve
existir uma estrada conectando as duas torres diretamente.
7. O número de funcionários efetivos deve ser o menor possível.
Uma curiosidade acerca da infraestrutura antiga é que a cada torre havia sido
atribuído um código binário, de modo que a conexão entre duas torres, se existisse,
custasse, em metros de cabeamento, exatamente o comprimento do maior subcódigo
binário comum aos códigos de ambas as torres. Por exemplo, se os códigos de duas 
torres eram respectivamente 000011 e 001100, o custo da conexão entre essas duas
torres era, e continua sendo, 4 (0011).


2 – Modelagem do Problema como um Grafo G (V,E)
Vértices V: torres
Arestas E: Cabeamento que liga as torres
Ponderação das Arestas: Custo em metros de cabeamento das torres

2.1 - Solução para as exigências 1,2 e 3 da Pikachu S.A:
Visto que a Pikachu fará apenas o mínimo de conexões entre torres necessário para
que as torres estejam todas interconectadas, direta ou indiretamente, e gastará o
mínimo possível de metros de cabeamento, grafos podem resolver o problema
gerando o menor caminho (menor custo em metros de cabeamento) entre todas as
torres através de uma Arvore Geradora Mínima com o Algoritmo de Prim.
Algoritmo de Prim:
• Comece com uma árvore vazia
• A cada passo, adicione uma torre (vértice) para crescer a árvore. Esta torre
deve se conectar à árvore já existente
• Iniciar o conjunto T com uma torre (vértice) v arbitrária
• A cada passo, selecionar o menor custo em metros de cabeamento (aresta de
menor peso) que toca T
• Acrescentar a T a torre (vértice) ligado por esta aresta
• Continuar até T obter todos as torres (vértices) de G
• Retornar o menor custo possível de metros de cabeamento

2.2 - Solução para as exigências 4,5,6
Para encontrar a quantidade de estagiários e funcionários efetivos, foi necessário
percorrer toda lista de vértices da árvore e para cada vértice era necessário verificar
se algum de seus adjacentes já teriam uma estação com funcionário efetivo. Caso
positivo, o vértice em questão era indicado como estagiário, caso contrário, era
indicado como funcionário efetivo. Então, retornava dois inteiros indicando a
quantidade de funcionários efetivos necessário e a quantidade mínima de estagiários
(condição 6). Como os funcionários efetivos não podem ser adjacentes, o conjunto
encontrado é o conjunto independente mínimo. 

3 – Testes Realizados
Foram realizados os testes do arquivo disponível para teste:
6 11
1 2
1 3
1 4
1 5
1 6
2 3
2 6
3 4
3 6
4 6
5 6
000011
001100
001111
110000
110011
111100

3 - Conclusão
Com a modelagem do grafo para resolver o problema em questão e sua posterior
implementação, foi possível observar que é possível resolver, com algoritmos em
grafos e os tópicos aprendidos, diversos problemas quanto a caminhos mínimos e
conjuntos independentes. Foi possível praticar o aprendizado de Árvores,
principalmente no que se refere a Arvores Geradoras Mínimas, onde com o trabalho,
aprendemos a implementar o Algoritmo de Prim e também testar algoritmos para
encontrar conjuntos independentes. 
