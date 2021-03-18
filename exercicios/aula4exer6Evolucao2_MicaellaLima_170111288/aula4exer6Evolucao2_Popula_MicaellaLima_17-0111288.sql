-- --------     << DETRAN >>     ------------
-- 
-- SCRIPT DE POPULAR (DML)
-- 
-- Data Criacao ...........: 16/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: aula4exer6Evolucao2
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer6Evolucao2;

INSERT INTO MODELO VALUES (
	1,
	'FIAT  PUNTO'
);

INSERT INTO MODELO VALUES (
	2,
	'Honda PCX'
);

INSERT INTO MODELO VALUES (
	3,
	'GOL MI'
);

INSERT INTO CATEGORIA VALUES (
	01,
	'AUTOMOVEL'
);

INSERT INTO CATEGORIA VALUES (
	02,
	'MOTOCICLETA'
);

INSERT INTO CATEGORIA VALUES (
	03,
	'CAMINHAO'
);

INSERT INTO PROPRIETARIO VALUES (
	'91177612046',
	'Carlos Alberto',
	'Masculino',
	'1999-11-30',
	'DF',
	'Brasilia',
	'Taguatinga',
	'Casa 4A'
);

INSERT INTO PROPRIETARIO VALUES (
	'43948508003',
	'Ana Maria Braga',
	'Feminino',
	'1999-09-30',
	'DF',
	'Brasilia',
	'Asa Sul',
	'Casa 023'
);

INSERT INTO PROPRIETARIO VALUES (
	'52419338081',
	'Laura Fernandes',
	'Feminino',
	'1989-10-30',
	'PE',
	'Recife',
	'Caruaru',
	'Ao lado do Horto Florestal'
);

INSERT INTO telefone VALUES (
  "91177612046",
  "61991234567"
);

INSERT INTO telefone VALUES (
  "43948508003",
  "61997234588"
);

INSERT INTO telefone VALUES (
  "52419338081",
  "61991278545"
);

INSERT INTO VEICULO VALUES (
  'MNF2224',
  '2T2BK1BA3CC',
  'Preto',
	'2019-01-01',
  '91177612046',
	1,
	1
);

INSERT INTO VEICULO VALUES (
  'IAP6484',
  'HTVBK7BA3HC',
	'Azul',
	'2017-01-01',
	'43948508003',
	2,
	2
);

INSERT INTO VEICULO VALUES (
	'JUK9504',
  '2G2BK14A3HC',
  'Roxo',
	'2014-01-01',
	'52419338081',
	3,
	3
);


INSERT INTO AGENTE VALUES (
	123456789,
	'Fernando Alves',
	'2015-06-30'
);

INSERT INTO AGENTE VALUES (
	987654321,
	'Gustavo Silva',
	'2002-06-30'
);

INSERT INTO AGENTE VALUES (
	145236897,
	'Helena Braga',
	'1987-06-30'
);


INSERT INTO LOCAL VALUES (
	1,
  80,
	40.71727401,
	74.00898606
);

INSERT INTO LOCAL VALUES (
	2,
  80,
	33.18726403,
	84.80898606
);

INSERT INTO LOCAL VALUES (
	3,
  60,
	-83.97747004,
	43.06848906
);

INSERT INTO TIPOINFRACAO VALUES (
	1,
  'Dirigir veículo com CNH cassada',
	1467.35
);

INSERT INTO TIPOINFRACAO VALUES (
	2,
  'Dirigir sob influência de álcool',
	2934.70
);

INSERT INTO TIPOINFRACAO VALUES (
	3,
  'Disputar corrida',
	2934.70
);


INSERT INTO INFRACAO VALUES (
	1,
  '2019-09-28',
  89,
	'MNF2224',
	123456789,
  1,
	3
);

INSERT INTO INFRACAO VALUES (
	2,
  '2019-09-29',
  89,
	'IAP6484',
	987654321,
  2,
	1
);

INSERT INTO INFRACAO VALUES (
	3,
  '2019-09-30',
  89,
	'JUK9504',
  145236897,
	3,
	2
);