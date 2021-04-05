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

USE chatRevisaoP1;

INSERT INTO CANDIDATO VALUES (
  13,
  '2014-01-01',
  123456789123
);

INSERT INTO CANDIDATO VALUES (
  50,
  '2014-01-01',
  123456789321
);

INSERT INTO CANDIDATO VALUES (
  23,
  '2018-01-01',
  123456789123
);

INSERT INTO ELEITOR VALUES (
  098765432123,
  '2000-01-31',
  'José da Silva'
);

INSERT INTO ELEITOR VALUES (
  098765432321,
  '2001-02-20',
  'Ana Maria Souza'
);

INSERT INTO ELEITOR VALUES (
  098765432222,
  '2000-01-20',
  'Maria Clara Silva'
);

INSERT INTO email VALUES (
098765432123,
'jose@email.com'
);

INSERT INTO email VALUES (
098765432321,
'ana@email.com'
);

INSERT INTO email VALUES (
098765432222,
'maria@email.com'
);

INSERT INTO VOTO VALUES (
  '2014-01-01',
  098765432123
);

INSERT INTO VOTO VALUES (
  '2014-01-01',
  098765432321
);

INSERT INTO VOTO VALUES (
  '2014-01-01',
  098765432222
);

INSERT INTO EFETIVACAO VALUES (
  '2014-01-01',
  13,
  '2014-01-01',
  098765432222
);

INSERT INTO EFETIVACAO VALUES (
  '2014-01-01',
  13,
  '2014-01-01',
  098765432321
);

INSERT INTO JUSTIFICATIVA VALUES (
  'Nao estava na cidade no dia',
  '2014-01-01',
  098765432123
);


INSERT INTO VOTO VALUES (
  '2018-01-01',
  098765432123
);

INSERT INTO VOTO VALUES (
  '2018-01-01',
  098765432321
);

INSERT INTO VOTO VALUES (
  '2018-01-01',
  098765432222
);

INSERT INTO JUSTIFICATIVA VALUES (
  'Nao estava na cidade no dia',
  '2018-01-01',
  098765432123
);

INSERT INTO JUSTIFICATIVA VALUES (
  'Nao estava na cidade no dia',
  '2018-01-01',
  098765432321
);

INSERT INTO EFETIVACAO VALUES (
  '2018-01-01',
  23,
  '2018-01-01',
  098765432222
);