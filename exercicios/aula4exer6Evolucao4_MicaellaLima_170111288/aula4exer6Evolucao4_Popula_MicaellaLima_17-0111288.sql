-- --------      aula4exer6Evolucao4      ------------
--
--                    SCRIPT DE POPULAR (DDL)
--
-- Data Criacao ........... 21/03/2021
-- Autor(es) .............. Washington Bispo e Micaella Lorraine Gouveia de Lima
-- Banco de Dados ......... MySQL
-- Banco de Dados(nome) ... aula4exer6Evolucao4
--
--
-- PROJETO = 01 Base de Dados
--         = 09 Tabelas
-- -----------------------------------------------------------------
USE aula4exer6Evolucao4;

INSERT INTO CATEGORIA (tipoCategoria)
VALUES 
    ('AUTOMÓVEL'),
	('MOTOCICLETA'),
    ('TRICICLO'),
	('CAMINHÃO'),
    ('BICICLETA ELÉTRICA'),
    ('ÔNIBUS');
 
INSERT INTO MODELO (nomeModelo)
VALUES
    ('Gol'),
	('Fox'),
	('CG50'),
    ('Palio'),
    ('Civic'),
    ('Corsa');
 
INSERT INTO PROPRIETARIO ( cpf, nome, sexo, dataNascimento, bairro, cidade, estado)
VALUES 
    ('1234567890', 'Daniel Jesus', 'M', DATE('1990-12-30'), 'Gama', 'Brasília', 'DF'),
	('1232321311', 'Daniela Franco', 'F', DATE('1994-10-13'), 'Aguas Claras', 'Brasília', 'DF'),
    ('1123654346', 'Tamiris Raulino', 'F', DATE('1994-02-16'), 'Ceilândia', 'Brasília', 'DF'),
    ('1224325628', 'Sergio Santos', 'M', DATE('1947-07-12'), 'Guará II', 'Brasília', 'DF'),
    ('1523173454', 'Jacinto Pinto de Jesus', 'M', DATE('1957-06-25'), 'Taguatinga', 'Brasília', 'DF'),
	('1234567892', 'João', 'M', DATE('1988-8-20'), 'Arniqueiras', 'Brasília', 'DF');
 
INSERT INTO TIPO ( valor, descricao)
VALUES 
    ( 130, 'Furou Sinal' ),
	( 293, 'Travessia Proibida' ),
    ( 190, 'Dirigir alcoolizado'),
    ( 157, 'Dirigir sem atenção'),
    ( 578, 'Mão fora do veículo'),
	( 195, 'Não Usou Cinto' );
 
INSERT INTO LOCAL (latitude, longitude, velocidadePermitida)
VALUES
    ( 54.12540, 311.64920, 80 ),
	( 37.19280, 191.34463, 50 ),
    ( 20.12555, 261.12345, 50 ),
    ( 29.19280, 321.32523, 60 ),
    ( 85.19280, 121.42422, 60 ),
	( 20.00249, 502.19232, 60 );
 
INSERT INTO AGENTE (nome, dataContratacao)
VALUES
	( 'Joaquim', DATE('2010-08-30') ),
	( 'Cristian', DATE('2012-09-30') ),
    ( 'Derfel', DATE('2001-08-27') ),
    ( 'Jessica', DATE('2018-11-30') ),
    ( 'Amanda', DATE('2012-09-05') ),
	( 'Yan', DATE('2015-08-10') ); 
 
 
INSERT INTO VEICULO ( placa, idCategoria, idModelo, cpf, chassi, cor, anoFabricacao)
VALUES 
    ('ths1234', 1,1, '1234567890',  '6SFzVFNgAMX5A9383', 'Azul', DATE('2001-01-01')),
	('saf1111', 1, 2, '1234567890', '1eH05dU6zKVx18370', 'Branco', DATE('2015-12-23')),
    ('aso1321', 1, 3, '1123654346', '7RUvx2cZR3Yep8677', 'Branco', DATE('2012-03-12')),
    ('apa1532', 1, 4, '1224325628', '332AkbuA738eR9535', 'Prata', DATE('2015-12-25')),
    ('aog3123', 1, 5, '1123654346', '3z4AAVahrDAJ24345', 'Branco', DATE('2013-08-23')),
	('suf1236', 1, 6,'1123654346', '1GtZ5ww037k9N6204', 'Vermelho',  DATE('2019-01-13'));
 
 
INSERT INTO INFRACAO (placa, idLocal, matricula, idTipo, dataHora, velocidadeMarcada)
VALUES 
	('aso1321', 1, 1, 1, '2021-08-25T00:03:31+00:00', 60 ),
	('suf1236', 2, 1, 2, '2020-09-20T00:03:31+00:00', 60 ),
    ('aso1321', 2, 2, 2, '2020-07-02T00:03:31+00:00', 280 ),
    ('saf1111', 2, 4, 2, '2019-12-11T00:03:31+00:00', 150 ),
    ('ths1234', 2, 3, 2, '2020-04-14T00:03:31+00:00', 70 ),
	('suf1236', 3, 2, 3, '2020-03-18T00:03:31+00:00', 120 );
 
INSERT INTO telefone (cpf,telefone)
VALUES 
    ('1234567890', '1231232312'), 
    ('1224325628', '8054395843'),
    ('1234567890', '3123814312'), 
    ('1523173454', '3123882183'), 
    ('1523173454', '9321832773'), 
    ('1234567892', '9231232312');