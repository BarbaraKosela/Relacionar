	DROP TABLE carros;
	DROP TABLE pessoas;
	
	CREATE TABLE pessoas(
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(200),
	cpf CHAR(11)
	);

	CREATE TABLE carros(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_pessoa INT ,
	marca VARCHAR(150) NOT NULL,
	modelo VARCHAR(150) NOT NULL,
	ano_lancamento INT NOT NULL, 
	ano_fabricacao INT NOT NULL,
	motor VARCHAR(100),
	cor VARCHAR(100),
	preco DECIMAL (8,2)
	FOREIGN KEY (id_pessoa) REFERENCES pessoas(id)
	);

	INSERT INTO pessoas (nome, cpf) VALUES
	('Abraão Nobre', '95232829483'),
	('Severino Braga', '87677033300'),
	('Samuel Faria', '98927203429'),
	('Florêncio Robalo', '36263517425');

	INSERT INTO carros (id_pessoa, marca, modelo, ano_lancamento, ano_fabricacao, motor, cor, preco) VALUES
	((SELECT id FROM pessoas WHERE nome = 'Abraão Nobre'), 'Volkswagen', 'Gol', 2010, 2009, '8v Power Flex', 'Vermelho', 18.000),
	((SELECT id FROM pessoas WHERE nome = 'Severino Braga'), 'Fiat', 'Bravo', 2000, 1999, 'SX 1.6 16V', 'Cinza', 9.000),
	((SELECT id FROM pessoas WHERE nome = 'Samuel Faria'), 'Renault', 'Clio', 1997, 1996, '1.0 8v', 'Verde', 5.500),
	((SELECT id FROM pessoas WHERE nome = 'Florêncio Robalo'), 'Volkswagen', 'Golf', 1994, 1994, '1.0 8v', 'Verde', 5.500);

	 SELECT pessoas.nome 'Nome', carros.modelo 'Modelo', carros.marca 'Marca', 
	 carros.ano_fabricacao 'Ano de fabricação', carros.ano_lancamento 'Ano de lançamento', 
	 carros.cor 'Cor', carros.preco 'Preço', carros.motor 'Motor' FROM pessoas 
	 JOIN carros ON (pessoas.id = carros.id_pessoa)


	