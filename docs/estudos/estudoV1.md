## Representação simplificada BD
1. Aplicações -> manipulação e consulta de dados

SGBD -> gerenciamento do BD
-------------------------------------------------
2. Gerenciador de Transações -> processamento de Dados
3. Gerenciador de Dados -> acesso aos dados
-------------------------------------------------

4. Metadados -> informação sobre os dados

5. BD -> dados armazenados

## Armazenamento de dados
### Registro
* Conjunto de unidades de informação logicamente relacionada
* Cada unidade de informação corresponde a um campo ou atributo do registro

### Arquivo
* Conjunto de registros armazenados em um dispositivo de memória ou armazenamento secundário.
* Recurso de armazenamento persistente, ou seja, não volátil
* A organização dos registros armazenados dentro de um arquivo pode ser variada e procura distribuir as unidades de informação de maneira mais eficiente.

## Meios Físicos de Armazenamento
| Armazenamento | Velocidade| Custo | Ordem | Obs
| - | - | - | - | - |
| Cache | ++++++ | ++++++ | primária - volátil | |
| Memória Principal | +++++ | +++++ | primária - volátil | disponíveis ao uso e processamento do pc|
| Memória Flash | ++++ | ++++ | secundária - online | armazenmanto precisa apagar tudo para regravação, velocidade proxima à Mem principal
| Disco Magnético | +++ | +++ | secundária - online | armazenamento de dados por longo tempo, tem um BD inteiro nele
| Disco optico | ++ | ++ | terciária - offline | lidos por laser
| Fitas magnéticas | + | + | terciária - offline | acesso sequencial, backup, grande armazenamento

## Tipos de arquivos

### Sequencial 
* ordenação, chave de ordenação
* acesso sequencial
* saperfeiçoa armazenamento de registros dispostos aleatoriamente no arquivo.
* perda de flexibilidade para modificação dos dados
* indicado quando o acesso é feito pela chave de ordenação

### Sequencial indexado
* grande volume de acesso aleatorio, precisa de um índice
* indice - par  de uma chave de acesso com o endereço físico no arquivo
* pode precisar de areas de extensçao para inserção de novos registros

### Direto
* acesso pela chave primária
* eficiencia no acesso aleatório

## Operações algorítmicas
* abrir arquivo
* fechar arquivo
* recuperar registro do arquivo
* inserir novo registro no arquivo
* alterar um registro existente no arquivo
* apagar um registro do arquivo

# SGBD

Objetivo -> oferecer visão abstrata dos dados os usuário. Disponibilidade eficiente

Mundo real -> abstração -> modelo -> representação em computadores

## Características
* Controle sobre redundância
  * espaço para armazenamento
  * duplicação de esforços
  * inconsistência na base de dados

* Compartilhamento de Dados

* Restrição de acesso não autorizado
  * acesso
  * permissão
  * proteção de contas pessoais ou grupo por senhas
  * identificação dos perfis
  * segurança no uso do SGBD

* Fornecimento de múltiplas interfaces
  * níveis deconhecimento entre os diferentes tipos de usuários
  * lingaguens de consulta, programação

* Restrições de integridade
  * regras de negocios
  * coerência dos dados: tipo, unicidade, nulo, relacionamentos
  * dificultar o erro

* Backup e recovery
  * caso de falha no hardware ou software
  * recuperação da situação anteriormente encontrada

* Vantagens
  * padrões: ajuda na comunicação e cooperação entre os setores, projetos e usuários
  * flexibilidade: algumas alterações nao afetam mt as aplicações
  * tempo de desenvolvimento reduzido: mais rapido q a abordagem tradicional de Arquivo de Dados
  * disponibilidade de informações atualizadas


## Quando não usar
* custo desnecessário em relação a abordagem tradicional de Arquivo de Dados
* alto investimento inicial com software e hardware
* overhead de segurança, controle de concorrência, recuperação e funções de integridade
* bd simples que n terão muitas atlerações
* multiplos acessos nao necessários

--------------------------------------
Definição -> especificar estruturas, descrição detalhada de cada tipo (metadados)

Construção -> popular inicialmente os dados no BD

Manipulação -> consulta e atualização

**Catálogo = dicionário = metadados**

FÍSICO  -> LÓGICO -> CONCEITUAL
interno -> lógico -> externo

| Interno | Lógico | Externo |
| - | - | - | 
| Descreve como os dados realmente estão armazenados, onde complexas estruturas são descritas em detalhes|
descreve quais os dados estão armazenados de fato e as relações entre eles. Escrito em termos de estruturas relativamente simples| Descreve parte do BD por meio de estruturas mais simples que no conceitual/lógico

| Banco de Dados | Sistema de Arquivos |
| -  | -  | 
| Único repositório de dados é mantido| Implementa os arquivos necessários para uma aplicação específica |
| Acesso de todos os usuários sobre o mesmo BD - único espaço de armazenamento, atualização dos dados em apenas uma estrutura de dados| Redundância de arquivos - perda de espaço, esforço adicional para atualização dos dados|


Um Sistema Gerenciador de Banco de Dados (SGBD) é uma coleção de PROGRAMAS que habilitam usuários a criar e manter um banco de dados. O SGBD é um software de propósito geral, que facilita o processo de definição, construção e manipulação de um bancos de dados.

* Campo: unidade básica de informação mínima com significado
* Registro: conjunto de campos 
* Arquivo: conjunto de registros 
* Banco de Dados (BD): conjunto de arquivos e suas formas de manipulação

## Linguagens
* DDL - definição de dados: resultado constitui um arquivo de dicionário, que é um arquivo de Metadados

* DML - manipulação de dados: acesso e manipulação dos dados, como recuperação dos dados, inserção de novos dados, remoção e modificação.

* SQL - consulta de dados: recuperação de dados, também possui meios de definição de estruturas, recursos de modificações, especificações de restrições de segurança.

## Modelo de dados
* Modelo de Dados Conceitual ou de alto nível
  * Fornece conceitos que são próximos da percepção lógica dos usuários a respeito dos dados
* Modelo de Dados de Implementação
  * Utilizado em SGBDs comerciais, sendo o mais popular denominado Modelo Relacional (MR)
* Modelo de Dados Físico ou de baixo nível
  * Descreve como os (fisicamente) realmente