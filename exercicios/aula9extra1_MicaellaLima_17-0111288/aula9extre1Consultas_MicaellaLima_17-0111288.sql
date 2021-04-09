-- --------     << aula9extra1 >>     ------------
-- 
-- SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 07/04/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: aula9extra1
-- 
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- -----------------------------------------------------------------

USE aula9extra1;

-- A) Projeção de sigla e nome do estado de sigla SP e DF;
SELECT sigla, nomeCompleto FROM ESTADO
WHERE sigla = 'DF' OR sigla = 'SP';

-- B) Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO;
SELECT nome, sigla FROM CIDADE
WHERE sigla = 'RJ' OR sigla = 'DF' OR sigla = 'GO';

-- C) Selecione todas as cidades do primeiro estado que você cadastrou mostrando somente o nome da cidade, o nome do estado e sua sigla;
SELECT E.nomeCompleto, E.sigla, C.nome
FROM ESTADO AS E 
INNER JOIN CIDADE AS C
ON E.sigla = C.sigla
WHERE E.sigla = 'PE';

-- D) Selecione somente o nome e a sigla do estado que você cadastrou por último e todas as cidades cadastradas nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome de estado e nome de cidade. 
SELECT E.nomeCompleto, E.sigla, C.nome, C.habitantes 
FROM ESTADO AS E 
INNER JOIN CIDADE AS C
ON E.sigla = C.sigla
WHERE E.sigla = 'SP'
ORDER BY C.habitantes;



