CheatSheet estudo de SI by Guila - 1EE
        
# Conteúdo
## Agentes 

### Slide
* Entender o que é um Agente Racional
* Distinguir entre os vários tipos de ambientes e arquiteturas de agentes
* Compreender o que é IA distribuída
* Conhecer uma metodologia de desenvolvimento
### Livro
* Agente e Agente Racional
* Onisciência, aprendizado e autonomia
* Ambientes de tarefas
* Estruturas dos Agentes


## Problemas de Busca

### Slide
* Compreender o que é um problema de busca em IA
* Ser capaz de formulá-lo
* Conhecer algumas aplicações
* Entender como buscar a solução do problema
* Conhecer as várias estratégias de realizar Busca não-informada (Busca Cega)
* Determinar que estratégia se aplica melhor ao problema que queremos solucionar
* Evitar a geração de estados repetidos.
* Entender o que é Busca Heurística
* Saber escolher heurísticas apropriadas para o problema.
* Busca parcialmente observável
* Busca  CSP
### Livro


# Exercícios

***
#### A* - Problema do metrô de Paris
Suponha que queremos construir um sistema para auxiliar um usuário do metrô de Paris a saber o trajeto mais rápido entre a estação onde ele se encontra e a estação de destino. O usuário tem um painel com o mapa, podendo selecionar a sua estação de destino. O sistema então acende as luzes sobre o mapa mostrando o melhor trajeto a seguir (em termos de quais estações ele vai atravessar., e quais as conexões mais rápidas a fazer – se for o caso). Para facilitar a vida, consideramos apenas 4 linhas do metrô.
Considere que:  a distância em linha reta entre duas estações quaisquer é dada pela tabela 1 e a
distância real é dada pela tabela 2.  a  velocidade média de um trem é de 30km/h;  o tempo gasto para trocar de linha dentro de mesma estação (fazer baldeação) é
de 4 minutos.
Questões:
1. Formule este problema em termos de estado inicial, estado final, operadores
e função de avaliação para Busca heurística com A*. 2. Descreva o funcionamento do algoritmo em português (5 linhas). 3. Desenhe a árvore de busca desenvolvida pelo A* para o seguinte caso:
Ei = estação 6 linha azul Ef = estação 13 linha vermelha
Dados do problema:
Tabela1: distâncias diretas entre as estações do Metrô de Paris.
E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11 E12 E13 E14 E1 - 10 18,5 24,8 36,4 38,8 35,8 25,4 17,6 9,1 16,7 27,3 27,6 29,8 E2 - 8,5 14,8 26,6 29,1 26,1 17,3 10 3,5 15,5 20,9 19,1 21,8 E3 - 6,3 18,2 20,6 17,6 13,6 9,4 10,3 19,5 19,1 12,1 16,6 E4 - 12 14,4 11,5 12,4 12,6 16,7 23,6 18,6 10,6 15,4 E5 - 3 2,4 19,4 23,3 28,2 34,2 24,8 14,5 17,9 E6 - 3,3 22,3 25,7 30,3 36,7 27,6 15,2 18,2 E7 - 20 23 27,3 34,2 25,7 12,4 15,6 E8 - 8,2 20,3 16,1 6,4 22,7 27,6 E9 - 13,5 11,2 10,9 21,2 26,6 E10 - 17,6 24,2 18,7 21,2 E11 - 14,2 31,5 35,5 E12 - 28,8 33,6 E13 - 5,1 E14 -
Tabela2: distâncias reais entre as estações do Metrô de Paris.
E1 E2 E3 E4 E5 E6 E7 E8 E9 E10 E11 E12 E13 E14 E1 - 10 E2 - 8,5 10 3,5 E3 - 6,3 9,4 18,7 E4 - 13 15,3 12,8 E5 - 3 2,4 30 E6 - E7 - E8 - 9,6 6,4 E9 - 12,2 E10 - E11 - E12 - E13 - 5,1 E14 -
Mapa do metrô de Paris.


***
#### Busca Heurística
Uma forma de analisar e comparar o desempenho de algoritmos de busca heurística é utilizar um problema bem conhecido como referência. Um exemplo desse tipo de problema é o cálculo de rotas entre diferentes cidades. No grafo ilustrado acima, cada nó representa uma cidade distinta, e cada ramo, uma rodovia que interliga as cidades representadas pelos nós que ele une, cujo peso indica a distância, em km, entre essas cidades pela rodovia. Suponha que se deseje encontrar a melhor rota entre as cidades A e M, indicadas nesse grafo. Considere, ainda, os valores indicados na tabela abaixo como distância em linha reta, em km, de cada cidade para a cidade M.
A partir dessas informações, julgue os itens seguintes, relativos a algoritmos de busca.
* I Utilizando-se o algoritmo A*, a rota ente A e M encontrada no problema acima é ACDFLM e o custo do caminho é 56,18.
* II Utilizando-se a busca gulosa, a rota encontrada no problema acima é ACDFLM.
* III Para utilizar algoritmos de busca heurística, deve-se definir uma heurística que superestime o custo da solução.
* IV O A* é um algoritmo ótimo e completo quando heurísticas admissíveis são utilizadas.
* V No simulated annealing, é possível haver movimentos para um estado com avaliação pior do que a do estado corrente, dependendo da temperatura do processo e da probabilidade Estão corretas apenas
a) I, II e III b) I, IV e V c) I, III, V d) II, III, IV e) II, IV, V

***

#### Otimização - Subida da Encosta
Uma empresa deseja montar uma rede de computadores interna, instalando máquinas em várias salas (12 máquinas ao todo). Cada computador estará ligado a dois outros, com exceção do primeiro e do último (que estão ligados apenas a um outro computador). Nem todas as combinações de ligações entre computadores são possíveis. A tabela 3 abaixo indica as possibilidades de ligação (o traço (-) indica que não há conexão possível entre os computadores indicados). A empresa deseja fazer essas ligações de forma a economizar o cabo (em metros). Estamos diante de um problema de otimização. O operador considerado para gerar os sucessores do estado corrente é apenas a permutação da ordem atual das ligações entre computadores dois a dois, sem testar todas as combinações em uma mesma iteração. Por exemplo, dado o estado inicial: Ei (C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12)
As permutações em uma iteração seriam: E1 (C2, C1, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12) E2 (C1, C3, C2, C4, C5, C6, C7, C8, C9, C10, C11, C12) E3 (C1, C2, C4, C3, C5, C6, C7, C8, C9, C10, C11, C12) etc... A distância direta entre os pontos da rede são dadas na tabela abaixo.
Tabela 3: Distâncias entre os computadores, indicando as ligações possíveis.
C1 C2 C3 C4 C5 C6 C7 C8 C9 C10 C11 C12
C1 0 30 84 56 - 70 - 75 - 40 - 10 C2 0 65 - - - 70 - - 40 - - C3 0 60 52 55 - 135 143 48 25 - C4 0 135 - - 20 - - 58 - C5 0 70 - 122 98 80 - - C6 0 68 - 82 35 - 130 C7 0 - 120 57 - - C8 0 - - 45 - C9 0 - - 68 C10 0 10 - C11 0 14 C12 0
Questões:
1. Formule o problema em termos de:
a) estado inicial; b) estado final; c) operadores (e seus custos associados); d) função de avaliação (h).
2. Descreva, sucintamente, o funcionamento do algoritmo (explique como você
o implementaria).
3. Exemplifique o funcionamento do algoritmo em 2 iterações para
Ei= (C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12)
levando em conta os valores da função de avaliação para justificar as
escolhas.
***

O que é um Agente Inteligente? Onde pode ser aplicado?

***
Descreva as características dos seguintes agentes de acordo com a sua
estrutura.
a. Agentes reativos simples b. Agentes reativos com estado do mundo c. Agentes baseados em objetivos d. Agentes otimizadores e. Agentes com aprendizagem

***
Responda SIM ou NÃO para indicar o que caracteriza cada um dos
ambientes apresentados a seguir (justifique as suas respostas).
* Catálogo de compras da internet
* Assistente matemático para demonstração de teoremas 
Completamente 
* Observável, Determinístico,Estático, Episódico, Discreto, Agente único

*** 
Para cada um dos agentes a seguir, desenvolva uma descrição de PEAS do ambiente de tarefas.
a) Robô jogador de futebol. b) Agente de compras na Internet. c) Robô explorador de Marte. d) Assistente de matemático para demonstração de teoremas.

***
Para cada um dos agentes a seguir, caracterize o ambiente de acordo com as propriedades dadas na Seção 2.3 e selecione um projeto de agente adequado.
a) Robô jogador de futebol. b) Agente de compras na Internet. c) Robô explorador de Marte. d) Assistente de matemático para demonstração de teoremas

***
Suponha que a medida de desempenho preocupa-se apenas com os T primeiros passos de tempo do ambiente e ignora tudo a partir de então. Mostre que a ação de um agente racional depende não apenas do estado do ambiente mas também do passo de tempo que ele alcançou.

R: Isso deriva da definição de um agente racional. Um Agente racional busca ações para maximizar seu desempenho. Se o desempenho depende de T passos, o agente racional deve tomar suas ações usando isso como medida de alguma forma. Se t for o número de passos que o agente tomou e t>T, o agente não é mais racional, visto que não há mais uma medida de sua performance

***
