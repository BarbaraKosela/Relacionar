    DROP TABLE categorias;
	DROP TABLE fraquezas;
	DROP TABLE pokemons;
	
	CREATE TABLE pokemons(
	
	id INT IDENTITY(1,1),
	nome VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
	);

	
	CREATE TABLE categorias(
	id INT IDENTITY(1,1),
	id_categoria INT,
	nome VARCHAR(150),
	FOREIGN KEY (id_categoria) REFERENCES pokemons(id),
	);

	CREATE TABLE fraquezas(
	id INT IDENTITY(1,1),
	id_fraqueza1 INT,
	id_fraqueza2 INT,
	FOREIGN KEY (id_fraqueza1) REFERENCES fraquezas(id),
	FOREIGN KEY (id_fraqueza2) REFERENCES fraquezas(id),
	nome VARCHAR(150),
	PRIMARY KEY (id)
	);

