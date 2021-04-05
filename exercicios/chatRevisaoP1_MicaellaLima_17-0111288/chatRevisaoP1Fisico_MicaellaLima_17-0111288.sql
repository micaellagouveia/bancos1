-- --------     << ELEICOES >>     ------------
-- 
-- SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 04/04/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: chatRevisaoP1
-- 
-- PROJETO => 01 Base de Dados
--         => 06 Tabelas
-- -----------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS chatRevisaoP1;
USE chatRevisaoP1;


CREATE TABLE CANDIDATO (
    numCandidato INT(2)         NOT NULL,
    anoEleitoral DATE          NOT NULL,
    tituloEleitor BIGINT    NOT NULL,

    CONSTRAINT CANDIDATO_PK PRIMARY KEY (numCandidato, anoEleitoral)
)ENGINE = InnoDB;

CREATE TABLE ELEITOR (
    tituloEleitor BIGINT NOT NULL,
    dataNasc DATE NOT NULL, 
    nomeCompleto VARCHAR(50) NOT NULL,

    CONSTRAINT ELEITOR_PK PRIMARY KEY (tituloEleitor)
)ENGINE = InnoDB;

CREATE TABLE email (
    tituloEleitor BIGINT NOT NULL,
    email VARCHAR(20),

    CONSTRAINT email_FK FOREIGN KEY (tituloEleitor) REFERENCES ELEITOR (tituloEleitor),
    CONSTRAINT email_UK UNIQUE KEY(tituloEleitor, email)
)ENGINE = InnoDB;

CREATE TABLE VOTO (
    dataEleicao DATE          NOT NULL,
    tituloEleitor BIGINT       NOT NULL,
    CONSTRAINT VOTO_PK PRIMARY KEY (dataEleicao, tituloEleitor),
    CONSTRAINT VOTO_FK FOREIGN KEY (tituloEleitor) REFERENCES ELEITOR (tituloEleitor)
)ENGINE = InnoDB;

CREATE TABLE JUSTIFICATIVA (
    descricaoJustificativa VARCHAR(300)         NOT NULL,
    dataEleicao DATE          NOT NULL,
    tituloEleitor BIGINT       NOT NULL,
    
    CONSTRAINT JUSTIFICATIVA_PK PRIMARY KEY (dataEleicao, tituloEleitor),
    CONSTRAINT JUSTIFICATIVA_VOTO_FK FOREIGN KEY (dataEleicao, tituloEleitor) REFERENCES VOTO(dataEleicao, tituloEleitor)
)ENGINE = InnoDB;

CREATE TABLE EFETIVACAO (
    dataEleicao DATE          NOT NULL,
    numCandidato INT         NOT NULL,
    anoEleitoral DATE          NOT NULL,
    tituloEleitor BIGINT       NOT NULL,

    CONSTRAINT EFETIVACAO_PK PRIMARY KEY (dataEleicao, tituloEleitor),
    CONSTRAINT EFETIVACAO_VOTO_FK FOREIGN KEY (dataEleicao, tituloEleitor) REFERENCES VOTO (dataEleicao, tituloEleitor),
    CONSTRAINT EFETIVACAO_CANDIDATO_FK FOREIGN KEY (numCandidato, anoEleitoral) REFERENCES CANDIDATO (numCandidato, anoEleitoral)
)ENGINE = InnoDB;

