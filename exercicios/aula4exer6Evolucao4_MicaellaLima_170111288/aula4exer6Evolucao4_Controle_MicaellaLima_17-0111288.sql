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

CREATE USER 'admin' IDENTIFIED BY '1admin2';
GRANT ALL PRIVILEGES ON aula4exer6Evolucao4 . * TO 'admin1';

CREATE USER 'pessoa' IDENTIFIED BY '3pes4';
GRANT SELECT ON aula4exer6Evolucao4 . * TO 'pessoa';
GRANT INSERT ON aula4exer6Evolucao4 . PROPRIETARIO TO 'pessoa';