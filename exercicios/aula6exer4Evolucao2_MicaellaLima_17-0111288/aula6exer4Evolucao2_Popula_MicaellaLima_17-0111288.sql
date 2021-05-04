-- --------      aula6exer4Evolucao2      ------------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ........... 27/04/2021
-- Autor(es) .............. Micaella Lorraine Gouveia de Lima
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula6exer4Evolucao2
--
--
-- PROJETO = 01 Base de Dados
--         = 08 Tabelas
--         = 2 Usuários
-- -----------------------------------------------------------------
USE aula6exer4Evolucao2;

INSERT INTO DEPARTAMENTO VALUES 
	(1, 'Tecnologia da Informacao'),
	(2, 'Administrativo'),
	(3, 'Producao'),
  (4, 'Gestao de Pessoas');

INSERT INTO EMPREGADO VALUES 
	(1, 'João Felix', '5000.50', 'M', '1990-01-01', 'Champs Elysees', '10', 'Leblon', 1),
	(2, 'Fernando Severino', '2000.50', 'M',  '1991-01-01', 'Las Vegas Strip', '105', 'Sao Conrado', 2),
	(3, 'Gustavo Daniel', '20000.50', 'M', '1961-01-01', 'Las Angeles Roads', '705', 'Ephoc', 3),
	(4, 'Maria Ferdinans', '25000.50', 'F', '1997-01-01', 'Khao San', '7', 'Higienopolis', 4),
  (5, 'Ana Clara', '15000.50', 'F', '2000-01-01', 'Khao San', '15', 'Higienopolis', 4);


INSERT INTO gerencia VALUES
	(1, 1, '2016-01-01'),
	(2, 2, '2019-01-01'),
	(3, 3, '2018-01-01'),
  (4, 4, '2019-01-01');

INSERT INTO supervisiona VALUES
	(1, 2),
	(1, 3),
	(1, 4),
  (1, 5);

INSERT INTO DEPENDENTE VALUES 
	(NULL, 'Gabriel Felix', 'M', '1995-01-01', 'Primo', 1),
	(NULL, 'Erick Severino', 'M', '1985-01-01', 'Pai', 2),
	(NULL, 'Fernanda Daniel', 'F', '2000-01-01', 'Filha', 3),
  (NULL, 'Carla Daniel', 'F', '1971-01-01', 'Mae', 3);

INSERT INTO localizacao VALUES 
	(1, 'Predio Empire Build'),
	(2, 'Predio Arab States'),
	(3, 'Predio Vegas'),
  (4, 'Predio Vegas');


INSERT INTO PROJETO VALUES 
	(10, 'Grand Ethiopian', 'Predio Class', 1),
	(20, 'LAPSSET Corridor', 'Predio Class', 2),
	(30, 'New Suez Canal', 'Predio Prime', 3),
  (40, 'New Suez Canal', 'Predio Port', 4);


INSERT INTO trabalha VALUES 
	(1, 10, 40),
	(2, 20, 15),
	(3, 30, 20),
  (4, 40, 20);