# Aula 1 - Introdução


*Arranjo de dados aleatório NÃO pode ser considerado um banco de dados*

### Histórico Evolutivo de Banco de Dados

* 1960: Sistema de Arquivos (Pascal)
* Final de 1960: Modelo Hierárquico (IMS)
* 1970 e início de 1980: Modelo de Redes (IDMS, DMS-II)
* Meados de 1980: Modelo Relacional (Codd) - DB-2, SQL-DS, Oracle, Ingres
* Final de 1980: Modelo Orientado a Objetos e Objeto-Relacional (Orion, Informix, Oracle, Jasmine)


Objetivo de um sistema de BD é oferecer uma visão abstrata dos dados ao usuário. Os detalhes referentes a forma como estes dados estão armazenados e mantidos não interessa aos seus usuários, mas a disponibilidade eficiente desses dados é que são fundamentais


### Abstração de Dados
O conceito de abstração está associado à característica de se observar somente os aspectos de interesse, sem se preocupar com maiores detalhes envolvidos
No contexto de abstração de dados de um banco de dados pode ser visto sem se considerar a forma como os dados estão armazenados fisicamente.

### Dados X Informações
* Dado: denota um fato que pode ser registrado e possui significado implícito
* Informação: denota uma organização em relação a um conteúdo ou novidade

### Propriedades Implícitas
* Coleção logicamente coerente de dados.
* Projetado e construído com dados para um propósito específico.
* Ele possui um grupo de usuários e algumas aplicações pré-concebidas, as quais esses usuários estão interessados.
* Representa algum aspecto do mundo real e a alteração nesse mundo tem que ser refletida no banco de dados.7

### Um banco de dados tem …
* Alguma fonte de onde os dados são derivados
* “Taxa” de interação com eventos do mundo real
* “Audiência” interessada em seu conteúdo
* Qualquer quantidade de dados (1, 1000, milhões,...)
* Variação de complexidade Agenda pessoal X Controle da Receita Federal
* Criação e manutenção manualmente ou por equipamento(s) (exemplo no controle de uso na biblioteca)

## Abstração de Dados
Observar os aspectos de interesse.

**Metadados: informação da informação, informação que explica outra informação.**


## SISTEMA GERENCIADOR DE BANCO DE DADOS

É uma coleção de programas que habilitam usuários a criar e manter um banco de dados. É um software de propósito geral que facilita o processo de definição, contrução e manipulação de um banco de dados.

### Características de um bom SGBD
* Controle sobre a redundância
* Compartilhamento de Dados
* Restrição de acesso não autorizado
* Fornecimento de múltiplas interfaces
* Forçar restrições de integridade

### Vantagens com a abordagem de BD
* Desenvolvimento de padrões
* Flexibilidade
* Tempo de desenvolvimento reduzido
* Disponibilidade de informações atualizadas

### Terminologia Inicial

* CAMPO: Unidade básica de informação mínima com significado
* REGISTRO: conjunto de campos
* ARQUIVO: conjunto de registros
* BANCO DE DADOS: conjunto de arquivos e suas formas de manipulação

### Linguagens em Banco de Dados

Um sistema de banco de dados proporciona dois tipos de linguagem: uma específica para as estruturas do BD e outra para expressar consultas a atualizações nas estrututas

* Linguagem de Definição de Dados (DDL-Data Definition Language):  estrutura de dados é representada por um conjunto de definições expressas por uma linguagem.
O resultado no uso da DDL contitui em um arquivo especial chamado de DICIONÁRIO.
Um dicionário é um arquivo de METADADOS


## METADADOS
São informações a respeito dos dados. Tem o objetivo de fornecer mais informações sobre os dados tornando mais fácil sua organização e o armazenamento eficiente.

* Linguagem de Manipulação dos Dados (DML - Data Manipulation Language): é uma linguagem que viabiliza o acesso ou a manipulação dos dados de forma compatível ao modelo de dados apropriado. 

Por manipulação de dados entende-se:
* Recuperação dos dados armazenados no BD
* Inserção de novos dados
* Remoção e modificação da dados já armazenados

Linguagem de Consulta dos Dados: é uma parte de uma DML responsável pela recuperação de dados (SQL - Strutured Query Language)

Apesar da SQL ser trata como uma linguagem de consulta, ela apresenta recursos como:
* meios de definição de estruturas de dados
* recursos de modificação de dados no BD
* especificação de restrições de segurança, entre outras
