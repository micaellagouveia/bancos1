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

CREATE DATABASE IF NOT EXISTS aula9extra1;
USE aula9extra1;


CREATE TABLE ESTADO (
    sigla CHAR(2)     NOT NULL,
    nomeCompleto VARCHAR(20) NOT NULL,

    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
)ENGINE = InnoDB;

CREATE TABLE CIDADE (
    codigo INT(5) NOT NULL,
    nome VARCHAR(50)     NOT NULL,
    sigla CHAR(2)     NOT NULL,
    habitantes BIGINT       NOT NULL,

    CONSTRAINT CIDADE_PK PRIMARY KEY (codigo),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (sigla) REFERENCES ESTADO (sigla),
    CONSTRAINT CIDADE_UK UNIQUE KEY (sigla, nome)
)ENGINE = InnoDB;