-- --------      aula6exer4      ------------
--
--                    SCRIPT DE CONSULTA (DDL)
--
-- Data Criacao ........... 26/04/2021
-- Autor(es) .............. Micaella Lorraine Gouveia de Lima
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula6exer4
--
--
-- PROJETO = 01 Base de Dados
--         = 08 Tabelas
--         = 2 Usuários
-- -----------------------------------------------------------------

-- 2) Instrução SQL que realiza uma operação de ALTERAÇÃO envolvendo uma CONSULTA (SELECT) integrada na instrução UPDATE
-- Objetivo: Atualizar os salários de todos os empregados que trabalham no projeto de número 10

UPDATE EMPREGADO as e
SET salario = 7000 
WHERE e.matriculaEmpregado in (
	SELECT t.matriculaEmpregado 
	FROM trabalha as t
	where t.numeroProjeto = 10
);

-- 4) Instrução SQL que realiza uma CONSULTA (SELECT) possuindo uma SUBCONSULTA (outro SELECT) integrada na instrução SELECT
-- Objetivo: Selecionar os dependentes associados aos empregados que trabalham no projeto localizado no Predio Class

SELECT *
FROM DEPENDENTE AS D
where D.matriculaEmpregado IN (
	select t.matriculaEmpregado 
	from PROJETO p
	join trabalha t ON p.numeroProjeto = t.numeroProjeto 
	where p.localizacao = 'Predio Class'
);