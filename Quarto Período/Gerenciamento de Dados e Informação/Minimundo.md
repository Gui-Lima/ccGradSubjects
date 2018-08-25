# MiniMundo clínica veterinária
Clínicas veterinárias são basicamente hospitais de animais. Lá tem toda uma staff de ajudantes, como atendentes, e os médicos(as) e enfermeiros(as). Os pacientes são animais, mas em geral temos os donos desses animais, que são os clientes. Algumas clínicas podem até operar em animais silvestres a maioria da cidade opera em Pets. Há checagem, cirurgias, consultas e basicamente tudo que um hospital comum tem.

A VetPet é uma clínica veterinária de Pets localizada em Casa Forte. Lá, tem-se o controle do cadastro de pessoas,que podem ser funcionários, veterinários ou clientes, pets, operações e materiais.
Pessoas podem ser funcionários, veterinários ou clientes.
Funcionários tem Nome, Data de nascimento, País, Estado, Cidade, CEP, Foto, CPF, Código da carteira de trabalho e número de funcionário.
Veterinários tem Nome, Data de nascimento, País, Estado, Cidade, CEP, Foto, CPF, Código da carteira de trabalho e número de veterinário.
Clientes tem Nome, Data de nascimento, País, Estado, Cidade, CEP, CPF e PETs.
Cada CPF é único entre pessoas. Ele é usado como Login no sistema.
Pets podem ser Cachorro, gato, pássaro ou roedor. Pets também são registrados, com seu nome, idade, raça e uma breve descrição.
Operações podem ser diversos tipos de cirurgia ou checagem.
Temos também o controle de material necessário para o VetPet. Não são tantos quanto num hospital, mas são necessários certos itens que nunca é bom deixar acabar.

Pessoas podem ter mais de um Pet, e vários Pets podem estar fazendo operações, inclusive da mesma pessoa.
A mesma operação pode estar registrada para Pets diferentes, mas não para um mesmo Pet. Mas um Pet pode ter várias operações registradas.
As operações tem Data, pois são marcadas antes de serem feitas. Existem três tipos de operações: Checagem, consultas e cirurgias. Qualquer uma das três pode ser uma "Emergência".

Cenários que acontecem na VetPet são:
i. O cliente chega com seu Pet com algum sintoma grave 
	Marca-se uma operação de emergência(podendo ser checagem seguido de cirurgia)
ii. O cliente vem para marcar uma checagem em seu Pet
	Marca-se uma data e uma hora para que uma das operações seja efetuada
iii. 
(Mais cenários)

Vamos a maiores detalhes

Entidades -
(Seres humanos)
Cliente - Nome, Data de nascimento, País, Estado, Cidade, CEP, CPF e PETs.
Funcionário - Nome, Data de nascimento, País, Estado, Cidade, CEP, Foto, CPF, Código da carteira de trabalho e número de funcionário.
Veterinário - Nome, Data de nascimento, País, Estado, Cidade, CEP, Foto, CPF, Código da carteira de trabalho e número de veterinário.

(Pets)
Cachorro - nome, idade, raça e uma breve descrição.
Gato - nome, idade, raça e uma breve descrição.
Pássaro - nome, idade, raça e uma breve descrição.
Roedor - nome, idade, raça e uma breve descrição.

(Operações)
Checagem - Data e hora
Consulta - Data e hora
Cirurgia - Data, hora e tipo

(Materiais)
Luva - Quantidade disponível
Pinça - Quantidade disponível
Otoscópio - Quantidade disponível

Relacionamentos -
Cliente - Pet
Cliente pode ter um ou mais Pets. Cada Pet só tem um cliente. (1:N)

Pet - Operação
Um pet pode ter uma ou mais operações marcadas, e uma operação pode ter diversos pets, mas não na mesma hora(óbviamente) ( N : M)

...

