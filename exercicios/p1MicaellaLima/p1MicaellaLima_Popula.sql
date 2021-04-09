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

USE MicaellaLima;

INSERT INTO INTERNAUTA VALUES (
  'micaellaGouv',
  'Micaella Gouveia',
  'F',
  '1998-12-22'
);

INSERT INTO INTERNAUTA VALUES (
  'joaoBatista123',
  'Joao Batista',
  'M',
  '2001-10-13'
);

INSERT INTO INTERNAUTA VALUES (
  'anaBraga14',
  'Ana Braga',
  'F',
  '2002-10-22'
);

INSERT INTO INTERNAUTA VALUES (
  'luisafonso123',
  'Luis Afonso',
  'M',
  '2001-10-13'
);

INSERT INTO email VALUES (
  'micaellaGouv',
  'micaella@email.com'
);

INSERT INTO email VALUES (
  'micaellaGouv',
  'micaella123@email.com'
);

INSERT INTO email VALUES (
  'joaoBatista123',
  'joao@email.com'
);

INSERT INTO email VALUES (
  'anaBraga14',
  'ana123@email.com'
);

INSERT INTO email VALUES (
  'luisafonso123',
  'luis@email.com'
);

INSERT INTO INTERESSE VALUES (
  NULL,
  'P',
  'Artes'
);

INSERT INTO INTERESSE VALUES (
  NULL,
  'P',
  'Esportes'
);

INSERT INTO relaciona VALUES (
  'micaellaGouv',
  'joaoBatista123'
);

INSERT INTO relaciona VALUES (
  'luisafonso123',
  'anaBraga14'
);

INSERT INTO possui VALUES (
  'luisafonso123',
  1
);

INSERT INTO possui VALUES (
  'micaellaGouv',
  2
);

INSERT INTO possui VALUES (
  'anaBraga14',
  1
);

INSERT INTO possui VALUES (
  'joaoBatista123',
  1
);