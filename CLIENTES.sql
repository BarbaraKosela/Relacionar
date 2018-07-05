﻿	DROP TABLE emails;
	DROP TABLE contas_a_pagar;
	DROP TABLE contas_a_receber;
	DROP TABLE celulares;
	DROP TABLE clientes;
	
	CREATE TABLE clientes(
	id INT IDENTITY(1,1),
	id_cliente INT,
	nome VARCHAR(100) NOT NULL,
	sexo CHAR(1) NOT NULL,
	PRIMARY KEY(id)
	);

	CREATE TABLE celulares(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL, 
	valor TEXT NOT NULL,
	ativo BIT DEFAULT (1),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
	);

	CREATE TABLE emails(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor TEXT NOT NULL,
	ativo BIT DEFAULT (1),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
	);

	CREATE TABLE contas_a_pagar(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor REAL NOT NULL,
	data_vencimento DATE NOT NULL,
	valor_pago REAL DEFAULT (0),
	status_pessoa TEXT DEFAULT 'PAGAR',
	ativo BIT DEFAULT (1),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
	);

	CREATE TABLE contas_a_receber(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	id_cliente INT NOT NULL,
	valor_a_receber REAL,
	data_pagamento DATE,
	valor_recebido REAL DEFAULT (0),
	data_recebimento DATE,
	status_pessoa TEXT DEFAULT 'RECEBER',
	ativo BIT DEFAULT (1),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id)
	);


	INSERT INTO clientes (nome, sexo) VALUES
	('Germana', 'F'),
	('Salvador', 'M'),
	('Úrsula', 'F'),
	('Aluísio', 'M');


	INSERT INTO celulares(id_cliente, valor) VALUES
	(1, '(79) 99973-5114'),
	(2,'(27) 98390-6475'),
	(1, '(55) 98587-4266'),
	(4,'(14) 98387-5333'),
	(3,'(92) 98983-2809'),
	(4,'(55) 98616-2303');


	INSERT INTO emails(id_cliente, valor)VALUES
	(2, 'a68341ef3b@emailna.life'),
	(1, 'ger@bol.com'),
	(3, 'germana@gmail.com'),
	(1, 'gabrieldiegofernandodarocha_@uoul.com'),
	(2, 'bernardodiegoalves-77@vianetfone.com.br'),
	(3, 'salvador@hotmail.com'),
	(1, 'zpgkmkem@boximail.com'),
	(2, 'iancauearaujo_@10clic.com.br');

	INSERT INTO contas_a_receber(id_cliente, data_pagamento, valor_a_receber)VALUES
	((SELECT id FROM clientes WHERE nome = 'Germana'), '2018-06-15', 500),
	((SELECT id FROM clientes WHERE nome = 'Germana'), '2018-07-17', 65),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-06-29', 320.50),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-11-25', 232.1),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-12-12', 12.17),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-12-23', 6.25),
	((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-06-07', 450),
	((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-10-14', 8001),
	((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-09-13', 104.23),
	((SELECT id FROM clientes WHERE nome = 'Aluísio'), '2018-08-27', 1300),
	((SELECT id FROM clientes WHERE nome = 'Aluísio'), '2018-10-10', 777),
	((SELECT id FROM clientes WHERE nome = 'Aluísio'), '2018-10-06', 98.83);

	INSERT INTO contas_a_pagar(id_cliente, data_vencimento, valor) VALUES
	((SELECT id FROM clientes WHERE nome = 'Germana'), '2018-10-09', 45.87),
	((SELECT id FROM clientes WHERE nome = 'Germana'), '2018-01-04', 39.50),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-11-24', 700),
	((SELECT id FROM clientes WHERE nome = 'Salvador'), '2018-07-06', 456),
	((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-12-08', 78.97),
	((SELECT id FROM clientes WHERE nome = 'Úrsula'), '2018-09-07', 987.65),
	((SELECT id FROM clientes WHERE nome = 'Aluísio'), '2018-11-30', 123.45);