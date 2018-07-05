	DROP TABLE emails;
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
	valor VARCHAR(300) NOT NULL,
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


	-- i. Selecione o nome e os e-mails;
	SELECT clientes.nome 'Nome do cliente', emails.valor 'Email' FROM clientes JOIN emails ON (clientes.id = emails.id_cliente);

	-- ii. Selecione o nome e os e-mails ordenando pelo nome do cliente e pelo e-mail;
	SELECT clientes.nome 'Nome do cliente', emails.valor 'Email' FROM clientes JOIN emails ON (clientes.id = emails.id_cliente) ORDER BY clientes.nome;
	

	-- iii. Apresente o nome cliente, e-mail com o maior e-mail de cada cliente.
    SELECT clientes.nome, emails.valor FROM emails JOIN clientes ON (clientes.id = emails.id_cliente) WHERE LEN(valor) = (SELECT MAX(LEN(valor)) FROM emails) ;

	-- CELULARES:
	-- iv. Selecione o nome e os celulares;
	SELECT clientes.nome 'Nome do cliente', celulares.valor 'Telefone dos clientes' FROM clientes JOIN celulares ON (clientes.id = celulares.id_cliente);

	-- v. Selecione o nome e os celulares quanto o status for ativo.
	SELECT clientes.nome 'Nome do cliente', celulares.valor 'Telefone dos clientes' FROM clientes JOIN celulares ON (clientes.id = celulares.id_cliente) WHERE celulares.ativo = 1;

	-- CONTAS A PAGAR
	-- vi. Alterar o valor pago para R$ 100,00, data de pagamento como dia de hoje e status para pago quando o cliente for Salvador;
	UPDATE contas_a_pagar set contas_a_pagar.valor_pago = 100, contas_a_pagar.data_vencimento =  '2018.07.05', 
	contas_a_pagar.status_pessoa = 'pago' FROM contas_a_pagar inner JOIN clientes ON (clientes.id = contas_a_pagar.id_cliente) 
	WHERE clientes.nome = 'Salvador';
	SELECT clientes.nome 'Nome do cliente', contas_a_pagar.valor_pago 'Valor pago', contas_a_pagar.status_pessoa 'Status', contas_a_pagar.data_vencimento 'Data do vencimento' 
	FROM clientes JOIN contas_a_pagar ON (clientes.id = contas_a_pagar.id_cliente); 

	-- Alterar o valor pago para 700,00 , data de pagamento como dia de ontem e status para pago quando o cliente for Salvador e o valor da conta for R$ 700,00;
	UPDATE contas_a_pagar set contas_a_pagar.valor_pago = 700, contas_a_pagar.data_vencimento =  '2018.07.04', 
	contas_a_pagar.status_pessoa = 'PAGO' FROM contas_a_pagar inner JOIN clientes ON (clientes.id = contas_a_pagar.id_cliente) 
	WHERE clientes.nome = 'Salvador' AND contas_a_pagar.valor = 700;
	SELECT clientes.nome 'Nome do cliente', contas_a_pagar.valor_pago 'Valor pago', contas_a_pagar.status_pessoa 'Status', contas_a_pagar.data_vencimento 'Data do vencimento', contas_a_pagar.valor 'Valor'
	FROM clientes JOIN contas_a_pagar ON (clientes.id = contas_a_pagar.id_cliente); 

	-- viii. Selecione o nome do cliente, valor , data de vencimento, data de vencimento e valor pago;
	SELECT clientes.nome 'Nome do cliente', contas_a_pagar.valor 'Valor', contas_a_pagar.data_vencimento 'Data do vencimento', contas_a_pagar.valor_pago 'Valor pago'
	FROM clientes JOIN contas_a_pagar ON (clientes.id = contas_a_pagar.id_cliente); 

	-- ix. Selecione o nome do cliente, valor, e o mês de vencimento;
	SELECT clientes.nome 'Nome do cliente', contas_a_pagar.valor 'Valor', MONTH(contas_a_pagar.data_vencimento) 'Mês do vencimento' FROM clientes JOIN contas_a_pagar ON (clientes.id = contas_a_pagar.id_cliente);

	-- x. Selecione o valor total das contas a pagar com o nome do cliente ordenando pelo nome docliente. Dica: deve agrupar.
	SELECT SUM(contas_a_pagar.valor) 'Valor total das contas a pagar', clientes.nome 'Nome do cliente' FROM clientes JOIN contas_a_pagar ON (clientes.id = contas_a_pagar.id_cliente) GROUP BY clientes.nome ORDER BY clientes.nome 

	-- CONTAS A RECEBER
	-- xi. Alterar o valor do pagamento para R$ 1000 quando o sexo do cliente for Feminino;
	UPDATE contas_a_receber set contas_a_receber.valor_recebido = 1000 FROM contas_a_receber inner JOIN clientes ON (clientes.id = contas_a_receber.id_cliente) 
	WHERE clientes.sexo = 'F';
	SELECT clientes.nome 'Nome', contas_a_receber.valor_recebido 'Valor recebido', clientes.sexo 'Sexo' FROM clientes JOIN contas_a_receber ON (clientes.id = contas_a_receber.id_cliente); 

	-- xii. Alterar a data do pagamento para amanhã quando o nome do cliente começar com A ou S;
	UPDATE contas_a_receber set contas_a_receber.data_pagamento = '2018-07-06' FROM contas_a_receber inner JOIN clientes ON (clientes.id = contas_a_receber.id_cliente) 
	WHERE clientes.nome LIKE 'A%' OR clientes.nome LIKE 'S%';
	SELECT clientes.nome 'Nome', contas_a_receber.data_pagamento 'Data do pagamento' FROM clientes JOIN contas_a_receber ON (clientes.id = contas_a_receber.id_cliente); 

	-- xiii. Selecione o nome e o total das contas a receber;
	SELECT SUM(contas_a_receber.valor_a_receber) 'Total do valor a receber', clientes.nome 'Nome' FROM clientes JOIN contas_a_receber ON (clientes.id = contas_a_receber.id_cliente) GROUP BY clientes.nome ORDER BY clientes.nome; 

	-- xiv. Selecione o nome e a quantidade de contas a receber de cada cliente.
	SELECT COUNT(contas_a_receber.valor_a_receber) 'Quantidade de valor a receber', clientes.nome FROM clientes JOIN contas_a_receber ON (clientes.id = contas_a_receber.id_cliente) GROUP BY clientes.nome ORDER BY clientes.nome;
