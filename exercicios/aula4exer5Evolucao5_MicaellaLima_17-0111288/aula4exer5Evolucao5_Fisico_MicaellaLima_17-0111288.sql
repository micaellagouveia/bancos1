-- --------  << Clínica Médica >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 19/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Base de Dados (nome) ...: aula4exer5Evolucao5
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
    IF NOT EXISTS aula4exer5Evolucao5;

USE aula4exer5Evolucao5;


-- TABELAS
CREATE TABLE MEDICO (
    crm           DECIMAL(10)   NOT NULL,
    estado        CHAR(2)       NOT NULL,
    nomeCompleto  VARCHAR(50)   NOT NULL,

    CONSTRAINT MEDICO_PK PRIMARY KEY (crm, estado)
) ENGINE = InnoDB;


CREATE TABLE ESPECIALIDADE (
    idEspecialidade    INT          NOT NULL  AUTO_INCREMENT,
    nomeEspecialidade  VARCHAR(50)  NOT NULL,

    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE PACIENTE (
    idPaciente      INT         NOT NULL    AUTO_INCREMENT,
    nomeCompleto    VARCHAR(50) NOT NULL,
    dtNascimento    DATE        NOT NULL,
    sexo            CHAR(1)     NOT NULL,
    rua             VARCHAR(40) NOT NULL,
    numero          CHAR(5)     NOT NULL,
    bairro          VARCHAR(50) NOT NULL,
    complemento     VARCHAR(100),
    cidade          VARCHAR(30) NOT NULL,
    estado          CHAR(2)     NOT NULL,
    cep             DECIMAL(8)  NOT NULL,

    CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE telefone (
    idPaciente  INT         NOT NULL,
    telefone    DECIMAL(11) NOT NULL,

    CONSTRAINT telefone_UK          UNIQUE KEY (idPaciente, telefone),
    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente)
) ENGINE = InnoDB;


CREATE TABLE CONSULTA (
    idConsulta  INT         NOT NULL    AUTO_INCREMENT,
    dataHora    DATETIME    NOT NULL,
    crm         DECIMAL(10) NOT NULL,
    estado      CHAR(2)     NOT NULL,
    idPaciente  INT         NOT NULL,

    CONSTRAINT CONSULTA_PK          PRIMARY KEY (idConsulta),
    CONSTRAINT CONSULTA_MEDICO_FK   FOREIGN KEY (crm, estado) REFERENCES MEDICO(crm, estado),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (idPaciente)  REFERENCES PACIENTE(idPaciente)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE RECEITA (
    idReceita    INT            NOT NULL    AUTO_INCREMENT,
    recomendacao VARCHAR(100),
    posologia    VARCHAR(100),
    idConsulta   INT            NOT NULL,
    dataEmissao  DATE           NOT NULL,

    CONSTRAINT RECEITA_PK          PRIMARY KEY (idReceita),
    CONSTRAINT RECEITA_CONSULTA_FK FOREIGN KEY (idConsulta) REFERENCES CONSULTA(idConsulta)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE MEDICAMENTO (
    idMedicamento  INT          NOT NULL    AUTO_INCREMENT,
    principioAtivo VARCHAR(30)  NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
) ENGINE = InnoDB AUTO_INCREMENT = 1;


CREATE TABLE possui (
    crm             DECIMAL(10) NOT NULL,
    estado          CHAR(2)     NOT NULL,
    idEspecialidade INT         NOT NULL,

    CONSTRAINT possui_MEDICO_FK        FOREIGN KEY (crm, estado)     REFERENCES MEDICO(crm, estado),
    CONSTRAINT possui_ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade)
) ENGINE = InnoDB;


CREATE TABLE contem (
    idReceita     INT NOT NULL,
    idMedicamento INT NOT NULL,

    CONSTRAINT contem_RECEITA_FK     FOREIGN KEY (idReceita)     REFERENCES RECEITA(idReceita),
    CONSTRAINT contem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento) REFERENCES MEDICAMENTO(idMedicamento)
) ENGINE = InnoDB;
