-- --------     << DETRAN >>     ------------
-- 
-- SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 16/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: aula4exer6Evolucao2
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao2;
USE aula4exer6Evolucao2;

CREATE TABLE MODELO (
  codModelo   INT         NOT NULL AUTO_INCREMENT,
  descModelo  VARCHAR(50) NOT NULL,

  CONSTRAINT modelo_PK PRIMARY KEY (codModelo)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE CATEGORIA (
  codCategoria  INT         NOT NULL AUTO_INCREMENT,
  descModelo    VARCHAR(50) NOT NULL,

  CONSTRAINT categoria_PK PRIMARY KEY (codCategoria)
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

  CONSTRAINT proprietario_PK PRIMARY KEY (cpf)
);

CREATE TABLE telefone (
  cpfProprietario  BIGINT  NOT NULL,
  telefone         BIGINT,

  CONSTRAINT telefone_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE VEICULO (
  placa             VARCHAR(7)   NOT NULL,
  chassi            VARCHAR(30)  NOT NULL,
  cor               VARCHAR(20)  NOT NULL,
  anoFabricacao     DATE         NOT NULL,
  cpfProprietario   BIGINT       NOT NULL,
  codModelo         INT          NOT NULL,
  codCategoria      INT          NOT NULL,

  CONSTRAINT veiculo_PK PRIMARY KEY (placa),
  CONSTRAINT veiculo_proprietario_FK FOREIGN KEY (cpfProprietario) REFERENCES PROPRIETARIO (cpf),
  CONSTRAINT veiculo_modelo_FK FOREIGN KEY (codModelo) REFERENCES MODELO (codModelo),
  CONSTRAINT veiculo_categoria_FK FOREIGN KEY (codCategoria) REFERENCES CATEGORIA (codCategoria)
);

CREATE TABLE AGENTE (
  matricula     INT           NOT NULL,
  nome          VARCHAR(100)  NOT NULL,
  dtContratacao DATE          NOT NULL,

  CONSTRAINT agente_PK PRIMARY KEY (matricula)
);

CREATE TABLE LOCAL (
  codLocal              INT             NOT NULL AUTO_INCREMENT,
  velocidadePermitida   INT             NOT NULL,
  latitude              DECIMAL(10, 8)  NOT NULL,
  longitude             DECIMAL(10, 8)  NOT NULL,

  CONSTRAINT local_PK PRIMARY KEY (codLocal)
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TIPOINFRACAO (
  idTipoInfracao  INT                 NOT NULL    AUTO_INCREMENT,
  descInfracao    VARCHAR(100)        NOT NULL,
  valor           DECIMAL(6, 2)       NOT NULL,

  CONSTRAINT tipoInfracao_PK PRIMARY KEY (idTipoInfracao)
)  ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
  idInfracao       INT           NOT NULL   AUTO_INCREMENT,
  dataHora         DATE          NOT NULL,
  velocidade       DECIMAL       NOT NULL,
  placaVeiculo     VARCHAR(7)    NOT NULL,
  matAgente        INT           NOT NULL,
  codLocal         INT           NOT NULL,
  idTipoInfracao   INT           NOT NULL,

  CONSTRAINT infracao_PK PRIMARY KEY (idInfracao),
  CONSTRAINT infracao_veiculo_FK FOREIGN KEY (placaVeiculo) REFERENCES VEICULO (placa),
  CONSTRAINT infracao_agente_FK FOREIGN KEY (matAgente) REFERENCES AGENTE (matricula),
  CONSTRAINT infrcao_local_FK FOREIGN KEY (codLocal) REFERENCES LOCAL (codLocal),
  CONSTRAINT infracao_tipoInfracao_FK FOREIGN KEY (idTipoInfracao) REFERENCES TIPOINFRACAO (idTipoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;