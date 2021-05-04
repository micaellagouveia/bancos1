-- --------     aula6exer4Evolucao2     ------------
--
--                    SCRIPT DE CONSULTA
--
-- Data Criacao ........... 27/04/2021
-- Autor(es) .............. Micaella Lorraine Gouveia de Lima
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula6exer4Evolucao2
--
--
-- PROJETO = 01 Base de Dados
--         = 08 Tabelas
--         = 2 Usuários
-- -----------------------------------------------------------------
USE aula6exer4Evolucao2;

-- A) Mostrar todos empregados de um departamento específico definido pelo usuário;
SELECT * FROM EMPREGADO WHERE numeroDepartamento = '1';

-- B) Listar todas os departamentos e seus respectivos gerentes, inclusive os departamentos que estiverem momentaneamente sem gerentes, que também deverão ser listados;
SELECT nome, nomeCompleto FROM DEPARTAMENTO LEFT OUTER JOIN 
gerencia JOIN EMPREGADO ON (gerencia.matriculaEmpregado = EMPREGADO.matriculaEmpregado)
ON (gerencia.numeroDepartamento = DEPARTAMENTO.numeroDepartamento);

-- C) Mostrar todos os empregados que nasceram em um intervalo de datas de nascimento definidas pelo usuário no esquema de consulta DE.. ATÉ... (usar nova instrução BETWEEN);
SELECT * FROM EMPREGADO WHERE dtNasc BETWEEN '1970-01-01' AND '2001-01-01';

-- D) Apresentar quantos empregados estão trabalhando em cada projeto (sem identificar os empregados - mostrar somente a quantidade numérica de empregados, nome do projeto e número que identifica cada projeto).
SELECT nome, PROJETO.numeroProjeto, COUNT(*) FROM PROJETO JOIN trabalha 
ON (PROJETO.numeroProjeto = trabalha.numeroProjeto)
WHERE trabalha.numeroProjeto = '10';

-- E) Mostrar todos os dados dos dependentes consultando por qualquer parte do nome fornecido na pesquisa, além da matrícula funcional e o nome do empregado ao qual este dependente esta associado na empresa.
SELECT * FROM DEPENDENTE JOIN EMPREGADO ON (DEPENDENTE.matriculaEmpregado = EMPREGADO.matriculaEmpregado)
WHERE EMPREGADO.nomeComplato LIKE '%Daniel%';