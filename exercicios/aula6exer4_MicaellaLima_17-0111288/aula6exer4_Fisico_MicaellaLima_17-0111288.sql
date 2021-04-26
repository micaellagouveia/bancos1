-- --------      aula6exer4      ------------
--
--                    SCRIPT DE CRIACAO (DDL)
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

CREATE DATABASE IF NOT EXISTS aula6exer4;
USE aula6exer4;

CREATE TABLE DEPARTAMENTO (
    numeroDepartamento INT NOT NULL,
    nome VARCHAR(50) NOT NULL,

    CONSTRAINT DEPARTAMENTO_PK PRIMARY KEY (numeroDepartamento)
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    matriculaEmpregado INT NOT NULL,
    nomeCompleto VARCHAR(50) NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    sexo ENUM('F','M') NOT NULL,
    dtNasc DATE NOT NULL,
    rua VARCHAR(20) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(20) NOT NULL,
    numeroDepartamento INT NOT NULL,

    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matriculaEmpregado),
    CONSTRAINT EMPREGADO_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento) 
      REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE RESTRICT ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE PROJETO (
    numeroProjeto INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    localizacao VARCHAR(50) NOT NULL,
    numeroDepartamento INT NOT NULL,

    CONSTRAINT PROJETO_PK PRIMARY KEY (numeroProjeto),
    CONSTRAINT PROJETO_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento)
      REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE RESTRICT ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE DEPENDENTE (
    idDependente INT NOT NULL AUTO_INCREMENT,
    nomeCompleto VARCHAR(50) NOT NULL,
    sexo ENUM('F','M') NOT NULL,
    dtNasc DATE NOT NULL,
    parentesco VARCHAR(20) NOT NULL,
    matriculaEmpregado INT NOT NULL,

    CONSTRAINT DEPENDENTE PRIMARY KEY (idDependente),
    CONSTRAINT DEPENDENTE_EMPREGADO FOREIGN KEY (matriculaEmpregado)
      REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE RESTRICT ON UPDATE NO ACTION
)ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE localizacao (
    numeroDepartamento INT NOT NULL,
    localizacao VARCHAR(20) NOT NULL,

    CONSTRAINT localizacao_UK UNIQUE KEY (numeroDepartamento, localizacao),
    CONSTRAINT localizacao_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento)
      REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE RESTRICT ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE supervisiona (
    matriculaSupervisor INT NOT NULL,
    matriculaSupervisionado INT NOT NULL,

    CONSTRAINT supervisiona_EMPREGADO_FK1 FOREIGN KEY (matriculaSupervisionado)
      REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT supervisiona_EMPREGADO_FK2 FOREIGN KEY (matriculaSupervisor)
      REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE RESTRICT ON UPDATE NO ACTION

)ENGINE = InnoDB;

CREATE TABLE trabalha (
    matriculaEmpregado INT NOT NULL,
    numeroProjeto INT NOT NULL,
    horasSemanais INT NOT NULL,

    CONSTRAINT trabalha_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
      REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT trabalha_PROJETO_FK FOREIGN KEY (numeroProjeto)
      REFERENCES PROJETO (numeroProjeto) ON DELETE RESTRICT ON UPDATE NO ACTION
)ENGINE = InnoDB;

CREATE TABLE gerencia (
    matriculaEmpregado INT NOT NULL,
    numeroDepartamento INT NOT NULL,
    dtInicio DATE NOT NULL,

    CONSTRAINT gerencia_EMPREGADO_FK FOREIGN KEY (matriculaEmpregado)
      REFERENCES EMPREGADO (matriculaEmpregado) ON DELETE RESTRICT ON UPDATE NO ACTION,
    CONSTRAINT gerencia_DEPARTAMENTO_FK FOREIGN KEY (numeroDepartamento)
      REFERENCES DEPARTAMENTO (numeroDepartamento) ON DELETE RESTRICT ON UPDATE NO ACTION

)ENGINE = InnoDB;
 
