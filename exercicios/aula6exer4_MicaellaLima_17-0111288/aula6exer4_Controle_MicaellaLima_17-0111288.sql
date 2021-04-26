-- --------      aula6exer4      ------------
--
--                    SCRIPT DE CONTROLE (DDL)
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
USE aula6exer4;

CREATE USER 'administrador' IDENTIFIED BY '123admin';
GRANT ALL PRIVILEGES ON aula4exer6.* TO 'administrador';

CREATE USER 'funcionario' IDENTIFIED BY 'usu123';
GRANT SELECT, SHOW VIEW ON aula4exer6.* TO 'funcionario';
GRANT SELECT, INSERT, SHOW VIEW ON aula4exer6.DEPENDENTE TO 'funcionario';

FLUSH PRIVILEGES;
