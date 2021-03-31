-- --------     << Clínica Médica >>     ------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 19/03/2021
-- Autor(es) ..............: Micaella Lorraine Gouveia de Lima
-- Banco de Dados .........: MySQL 8.0.23
-- Banco de Dados(nome) ...: aula4exer5Evolucao5
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- -----------------------------------------------------------------

USE aula4exer5Evolucao5;

INSERT INTO MEDICO VALUES (
	97531,
  'DF',
	'Thiago Ferreira'
);

INSERT INTO MEDICO VALUES (
	95511,
  'DF',
	'Dalila Souza'
);

INSERT INTO MEDICO VALUES (
	97552,
  'DF',
	'Lorena Felipe Silva'
);

INSERT INTO MEDICO VALUES (
	95478,
  'DF',
	'João Batista Soares'
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Oftamologia'
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Ortopedia'
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Pediatria'
);

INSERT INTO ESPECIALIDADE VALUES (
    NULL,
    'Ginecologia'
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Gustavo Carlos Ferreira',
    '1956-01-31',
    'M',
    'Rua 23',
    '9342',
    'Aguas Claras',
    NULL,
    'Brasilia',
    'DF',
    91605156
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Carla Soares',
    '1976-01-31',
    'F',
    'Rua 200',
    '9',
    'Aguas Claras',
    NULL,
    'Brasilia',
    'DF',
    91605156
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Sarah Mendes',
    '1996-01-31',
    'F',
    'Rua 2',
    '945',
    'Aguas Claras',
    NULL,
    'Brasilia',
    'DF',
    91605156
);

INSERT INTO PACIENTE VALUES (
    NULL,
    'Humberto Souza',
    '1977-01-20',
    'M',
    'Rua 07',
    '789',
    'Aguas Claras',
    NULL,
    'Brasilia',
    'DF',
    91605156
);

INSERT INTO telefone VALUES(
    1,
    '61987456541'
);

INSERT INTO telefone VALUES(
    2,
    '61987456789'
);

INSERT INTO telefone VALUES(
    2,
    '61987456241'
);

INSERT INTO telefone VALUES(
    3,
    '61987432041'
);

INSERT INTO CONSULTA VALUES(
  NULL,
  '2020-03-21 13:50:00',
  95478,
  'DF',
  1
);

INSERT INTO CONSULTA VALUES(
  NULL,
  '2020-03-21 14:30:00',
  95478,
  'DF',
  3
);

INSERT INTO CONSULTA VALUES(
  NULL,
  '2020-03-21 14:30:00',
  97531,
  'DF',
  2
);

INSERT INTO CONSULTA VALUES(
  NULL,
  '2020-05-21 14:30:00',
  97531,
  'DF',
  4
);

INSERT INTO RECEITA VALUES (
  NULL,
  NULL,
  'de 3 em 3 horas por 7 dias',
  1,
  '2020-03-21'
);

INSERT INTO RECEITA VALUES (
  NULL,
  'Ingerir após ingerir alimento',
  'de 6 em 6 horas por 14 dias',
  3,
  '2020-03-21'
);

INSERT INTO RECEITA VALUES (
  NULL,
  NULL,
  'de 12 em 12 horas por 7 dias',
  2,
  '2020-03-21'
);

INSERT INTO RECEITA VALUES (
  NULL,
  NULL,
  'de 3 em 3 horas por 7 dias',
  4,
  '2020-05-21'
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Thiocaine"
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    "Aldacxetine"
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    'Micromin'
);

INSERT INTO MEDICAMENTO VALUES (
    NULL,
    'Afluposide'
);

INSERT INTO possui VALUES(
    97531,
    'DF',
    1
);

INSERT INTO possui VALUES(
    97531,
    'DF',
    3
);

INSERT INTO possui VALUES(
    97531,
    'DF',
    4
);

INSERT INTO possui VALUES(
    95511,
    'DF',
    3
);

INSERT INTO contem VALUES(
    1,
    3
);

INSERT INTO contem VALUES(
    2,
    4
);

INSERT INTO contem VALUES(
    3,
    2
);

INSERT INTO contem VALUES(
    4,
    1
);