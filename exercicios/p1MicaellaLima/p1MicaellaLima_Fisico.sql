-- --------     << P1 >>     ------------
-- 
-- SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 06/04/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: MicaellaLima
-- 
-- PROJETO => 01 Base de Dados
--         => 05 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS MicaellaLima;
USE MicaellaLima;

CREATE TABLE INTERNAUTA (
    apelido VARCHAR(15) NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    sexo CHAR(1) NOT NULL,
    dtNasc DATE NOT NULL,

    CONSTRAINT INTERNAUTA_PK PRIMARY KEY (apelido)
) ENGINE = InnoDB;

CREATE TABLE INTERESSE (
    idInteresse INT NOT NULL AUTO_INCREMENT,
    visibilidade ENUM('P', 'I') NOT NULL,
    nomeInteresse VARCHAR(100) NOT NULL,

    CONSTRAINT INTERESSE_FK PRIMARY KEY (idInteresse)

)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE email (
    apelidoInternauta VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,

    CONSTRAINT email_UK UNIQUE KEY(email),
    CONSTRAINT email_INTERNAUTA_FK FOREIGN KEY (apelidoInternauta) REFERENCES INTERNAUTA (apelido)
)ENGINE = InnoDB;

CREATE TABLE relaciona (
    apelidoInternauta1 VARCHAR(15) NOT NULL,
    apelidoInternauta2 VARCHAR(15) NOT NULL,

    CONSTRAINT relaciona_UK UNIQUE KEY (apelidoInternauta1, apelidoInternauta2),
    CONSTRAINT relaciona_INTERNAUTA_FK1 FOREIGN KEY (apelidoInternauta1) REFERENCES INTERNAUTA (apelido),
    CONSTRAINT relaciona_INTERNAUTA_FK2 FOREIGN KEY (apelidoInternauta2) REFERENCES INTERNAUTA (apelido)
    
)ENGINE = InnoDB;

CREATE TABLE possui (
    apelidoInternauta VARCHAR(15) NOT NULL,
    idInteresse INT NOT NULL,

    CONSTRAINT possui_UK UNIQUE KEY (apelidoInternauta, idInteresse),
    CONSTRAINT possui_INTERNAUTA FOREIGN KEY (apelidoInternauta) REFERENCES INTERNAUTA (apelido),
    CONSTRAINT possui_INTERESSE FOREIGN KEY (idInteresse) REFERENCES INTERESSE (idInteresse)
)ENGINE = InnoDB;
 