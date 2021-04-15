-- --------      aula4exer6Evolucao4      ------------
--
--                    SCRIPT DE APAGAR (DDL)
--
-- Data Criacao ........... 21/03/2021
-- Autor(es) .............. Washington Bispo Arisita Junior, Micaella Lorraine Gouveia de Lima
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula4exer6Evolucao4
--
--
-- PROJETO = 01 Base de Dados
--         = 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer6Evolucao4;

-- A) Apresentar todos os dados dos veículos de um determinado proprietário fornecido pelo usuário
SELECT * FROM VEICULO WHERE cpf = '1123654346';

-- B) Consultar proprietário(s) por qualquer parte do nome fornecido pelo usuário
SELECT * FROM PROPRIETARIO WHERE nome LIKE '%Daniel%';

-- C) Mostrar os dados da infração e do veículo que tiveram infrações cadastradas no Detran em um período (ou data) no padrão DE... ATÉ...;
SELECT * FROM INFRACAO 
WHERE dataHora BETWEEN '2019-12-11T00:03:31+00:00' AND '2020-07-02T00:03:31+00:00';

-- D) Pesquisar quantos veículos existem cadastrados por categoria.
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '1';
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '2';
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '3';
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '4';
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '5';
SELECT COUNT(*) FROM VEICULO WHERE idCategoria = '6';
