-- --------     << Clínica Médica >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 14/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: bdClinica
-- 
-- Data Ultima Alteracao ..: 14/03/2021
--   => Criação das tabelas
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

CREATE DATABASE bdClinica;
USE bdClinica;

CREATE TABLE MEDICO (
  crm          INT             NOT NULL,
  estadoCrm    VARCHAR(2)      NOT NULL,
  nomeCompleto VARCHAR(100)    NOT NULL,

  CONSTRAINT MEDICO_PK PRIMARY KEY (crm, estadoCrm)
);


CREATE TABLE ESPECIALIDADE (
  idEspecialidade INT         NOT NULL AUTO_INCREMENT,
  nome            VARCHAR(50) NOT NULL,

  CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PACIENTE (
  idPaciente      INT             NOT NULL    AUTO_INCREMENT,
  nomeCompleto    VARCHAR(100)    NOT NULL,
  dataNascimento  DATE            NOT NULL,
  sexo            VARCHAR(10)     NOT NULL,
  cep             BIGINT          NOT NULL,
  estado          VARCHAR(2)      NOT NULL,
  cidade          VARCHAR(50)     NOT NULL,
  bairro          VARCHAR(50)     NOT NULL,
  rua             VARCHAR(50)     NOT NULL,
  numero          INT             NOT NULL,
  complemento     VARCHAR(50),

  CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE telefone (
  idPaciente  INT    NOT NULL,
  telefone    BIGINT NOT NULL,

  CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE (idPaciente)
);

CREATE TABLE ATENDIMENTO (
  idAtendimento   INT         NOT NULL AUTO_INCREMENT,
  dataHora        DATE        NOT NULL,
  crmMedico       INT         NOT NULL,
  estadoCrmMedico VARCHAR(2)  NOT NULL,
  idPaciente      INT         NOT NULL,
  
  CONSTRAINT ATENDIMENTO_PK PRIMARY KEY (idAtendimento),
  CONSTRAINT ATENDIMENTO_MEDICO_FK FOREIGN KEY (crmMedico, estadoCrmMedico) REFERENCES MEDICO(crm, estadoCrm),
  CONSTRAINT ATENDIMENTO_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente)
) ENGINE=InnoDB AUTO_INCREMENT=1;

CREATE TABLE PRESCRICAO (
  idPrescricao  INT   NOT NULL AUTO_INCREMENT,
  dataEmissao   DATE  NOT NULL,
  idAtendimento INT   NOT NULL,

  CONSTRAINT PRESCRICAO_PK PRIMARY KEY (idPrescricao),
  CONSTRAINT PRESCRICAO_ATENDIMENTO_FK FOREIGN KEY (idAtendimento) REFERENCES ATENDIMENTO (idAtendimento)
) ENGINE=InnoDB AUTO_INCREMENT= 1;

CREATE TABLE MEDICAMENTO (
  ium             INT          NOT NULL,
  nomeGenerico    VARCHAR(100) NOT NULL,
  principioAtivo  VARCHAR(100) NOT NULL,
  posologia       VARCHAR(100) NOT NULL,

  CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (ium);
)

CREATE TABLE tem (
  crmMedico       INT         NOT NULL,
  estadoCrmMedico VARCHAR(2)  NOT NULL,
  idEspecialidade INT         NOT NULL,

  CONSTRAINT tem_MEDICO_FK FOREIGN KEY (crmMedico, estadoCrmMedico) REFERENCES MEDICO (crm, estadoCrm),
  CONSTRAINT tem_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE (idEspecialidade)
);

CREATE TABLE possui (
  idPrescricao    INT  NOT NULL,
  iumMedicamento  INT  NOT NULL,

  CONSTRAINT possui_PRESCRICAO_FK FOREIGN KEY (idPrescricao) REFERENCES PRESCRICAO (idPrescricao),
  CONSTRAINT possui_MEDICAMENTO_FK FOREIGN KEY (iumMedicamento) REFERENCES MEDICAMENTO (ium)
);

