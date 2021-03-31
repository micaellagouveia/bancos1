-- --------     << DETRAN >>     ------------
-- 
-- SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 22/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: aula4exer6Evolucao3
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;
USE aula4exer6Evolucao3;

CREATE TABLE MODELO (
  codModelo   INT         NOT NULL AUTO_INCREMENT,
  descModelo  VARCHAR(50) NOT NULL,

  CONSTRAINT MODELO_PK PRIMARY KEY (codModelo)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CATEGORIA (
  codCategoria  INT         NOT NULL AUTO_INCREMENT,
  descModelo    VARCHAR(50) NOT NULL,

  CONSTRAINT CATEGORIA_PK PRIMARY KEY (codCategoria)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE PROPRIETARIO (
  cpf           BIGINT        NOT NULL,
  nome          VARCHAR(100)  NOT NULL,
  sexo          VARCHAR(10)   NOT NULL,
  dtNasc        DATE          NOT NULL,
  estado        VARCHAR(2)    NOT NULL,
  cidade        VARCHAR(50)   NOT NULL,
  bairro        VARCHAR(50)   NOT NULL,
  complemento   VARCHAR(50),

  CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE telefone (
  cpfProprietario  BIGINT  NOT NULL,
  telefone         BIGINT,

  CONSTRAINT telefone_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpf)
) ENGINE = InnoDB;

CREATE TABLE VEICULO (
  placa             VARCHAR(7)   NOT NULL,
  chassi            VARCHAR(30)  NOT NULL,
  cor               VARCHAR(20)  NOT NULL,
  anoFabricacao     DATE         NOT NULL,
  cpfProprietario   BIGINT       NOT NULL,
  codModelo         INT          NOT NULL,
  codCategoria      INT          NOT NULL,

  CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
  CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpf),
  CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codModelo) REFERENCES MODELO (codModelo),
  CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codCategoria) REFERENCES CATEGORIA (codCategoria)
) ENGINE = InnoDB;

CREATE TABLE AGENTE (
  matricula     INT           NOT NULL,
  nome          VARCHAR(100)  NOT NULL,
  dtContratacao DATE          NOT NULL,

  CONSTRAINT AGENTE_PK PRIMARY KEY (matricula)
) ENGINE = InnoDB;

CREATE TABLE LOCAL (
  codLocal              INT             NOT NULL AUTO_INCREMENT,
  velocidadePermitida   INT             NOT NULL,
  latitude              DECIMAL(10, 8)  NOT NULL,
  longitude             DECIMAL(10, 8)  NOT NULL,

  CONSTRAINT LOCAL_PK PRIMARY KEY (codLocal)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TIPOINFRACAO (
  idTipoInfracao  INT                 NOT NULL    AUTO_INCREMENT,
  descInfracao    VARCHAR(100)        NOT NULL,
  valor           DECIMAL(6, 2)       NOT NULL,

  CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (idTipoInfracao)
)  ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
  idInfracao       INT           NOT NULL   AUTO_INCREMENT,
  dataHora         DATE          NOT NULL,
  velocidade       DECIMAL       NOT NULL,
  placaVeiculo     VARCHAR(7)    NOT NULL,
  matAgente        INT           NOT NULL,
  codLocal         INT           NOT NULL,
  idTipoInfracao   INT           NOT NULL,

  CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
  CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placaVeiculo) REFERENCES VEICULO (placa),
  CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matAgente) REFERENCES AGENTE (matricula),
  CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codLocal) REFERENCES LOCAL (codLocal),
  CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipoInfracao) REFERENCES TIPOINFRACAO (idTipoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;