# Aula 4 - Modelo Entidade Relacionamento

É baseado na percepção do mundo real que consiste em um conjunto de objetos básicos chamados **Entidades** e nos **Relacionamentos** entre estes objetos. Foi desenvolvido para facilitar o projeto de banco de dados, permitindo a **especificação de um esquema de negócio**, em que tal esquema representa a estrutua lógica geral do BD.

## Entidade
* Conjunto de objetos da realidade modelada sobre os quais deseja-se colecionar dados no BD.
* Pode ser concreta ou abstrata
* Representa um conjunto de objetos que se deseja guardar dados e é importante para o seu mundo real.

**Exemplo**: Um sistema bancário tem as seguintes entidades: clientes, contas, cheques, agências. A entidade cliente representa o conjunto de clientes que se deseja manter dados no BD.

## Relacionamento
*Conjunto de associações entre as Entidades.*

* Um conjunto de relacionamentos é uma coleção de ocorrências das entidades relacionadas (associadas).
* A função que uma entidade exerce em um relacionamento é chamada de **papel**, normalmente implícito, mas muito esclarecedor ao mundo real que se está representando.
* Também pode ter atributos descritivos onde ocorre tal relacionamento. (ex: data, hora...)
* A ocorrência de um relacionemto particular dentro de um conjunto de relacionementos de um mesmo tipo é chamda de **instância do relacionamento**.

## Atributo
O dado que é associado a cada ocorrência de uma entidade ou um relacionamento.
* Uma Entidade é representada por um único ou vários (conjuntos) atributos.
* Para cada atributo existe um conjunto ded valores permitidos, chamado **domínio** daquele atributo.
* O atributo mapeia uma entidade em um domínio.
