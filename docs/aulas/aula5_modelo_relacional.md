# Modelo Relacional de Dados

**Modelo de Dados** é um conjunto de conceitos utlizados para descrever a estrutura de um banco de dados. É a principal ferramenta no fornecimento de informações sobre a abstração efetuada.

![modelos](./implementacao.png)

### Esquema
* Descrição da organização dos dados de m BD.
* Um esquema de BD é especificado durante o projeto do BD e não é frquentemente modificado.

### Instância
* Os dados armazenados em um BD, em um momento específico, são denominados instâncias do BD (seria a fotografia do BD em um instante)

<br><br>

**Modelo Relacional** representa os dados em um BD por meio de um *conjunto de relações* (TABELAS). Estas relações contém informações sobre entidades ou relacionamentos existentes no *domínio da aplicação* utilizada como alvo da Modelagem.

Informalmente, um relação pode ser considerada como uma *tabela de valores*, em que cada linha desta tabela representa uma *coleção de valores de dados inter-relacionados*.

### Terminologia do Modelo Relacional

| Nome | Descrição |
| - | - |
| Tupla | linha da tabela |
| Relação | Tabela |
| Atributo | nome da coluna |
| Domínio | conjunto de valores que cada atributo pode assumir em uma relação |
| Esquema | conjunto de atributos que descreve as características dos elementos da relação|

* A quantidade de atributos em uma relação é denominado **Grau da Relação**.

![fornecedor](./fornecedor.png)

## Características das Relações (tabelas)
* Não há tuplas duplicadas em uma relação.
* A ordem das tuplas não é relevante para diferenciar uma relação de outra.
* Existe ordem dos valores nas tuplas, uma vez que o cabeçalho da relação (ou esquema) é definido como um conjunto de atributos.
* Os valores dos atributos devem ser atômicos, não sendo divisíveis em componentes.
    * Atributos multivalorados são representados por
meio de uma outra relação;
    * Atributos compostos são pelos seus componentes.


## Chaves e Restrições de Integridade Relacional
* Como não pode ter uma tupla repetida em uma instância da relação, é necessário identificar um atributo ou mais que terá a responsabilidade de identificar *unicamente* cada tupla. Este atributo, ou conjunto de atributos, pe chamado de **CHAVE DA RELAÇÃO**.

A definição dessa chave será **CHAVE PRIMÁRIA (COMPOSTA)** da relação.

## Restrições de Integridade
* **de Chaves**: cada atributo das chaves candidatas deve possuir *valor único* em todas as tuplas da relação.
* **de Entidade**: uma chave primária *não* pode assumir valor *nulo* nas tuplas da relação.
* **Referencial**: inclusão de atributo(s) de uma relação que referencia outra tupla em outra relação, surgindo um novo *tipo de chave - estrangeira*.
* **de Integridade Semântica**: se referem mais especificamente sobre *valores ou características que determinados atributos podem possuir* no contexto de uma determinada aplicação. (ex: sexo)
* **de Participação**: determina que a existência de uma entidade depende de sua participação em um tipo de relacionamento.

### Restrição de participação
Existem dois tipos: TOTAL e PARCIAL.
* **Total**: está estreitamente relacionada a *dependência de existência*.
    * Exemplo: Suponha que um empregado deve trabalhar em um departamento, ou seja, não existem empregados que não estejam vinculados a algum departamento. Assim, uma entidade do tipo EMPREGADO existe somente se ela participa em uma instância de relacionamento *trabalha*.

    ![total](./total.png)

* **Parcial**: não estás ligado à uma relação de dependência de existência.
    * Exemplo: o tipo de relacionamento *gerencia*, o qual envolve os tipos de entidade EMPREGADO e DEPARTAMENTO. A participação do tipo de entidade EMPREGADO é parcial, pois somente alguns empregados gerenciam departamentos, o que não limita a existência dos demais empregados.

    ![parcial](./parcial.png)


