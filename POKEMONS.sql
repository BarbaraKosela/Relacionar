	DROP TABLE categorias;
	DROP TABLE fraquezas;
	DROP TABLE pokemons;
	
	CREATE TABLE pokemons(
	id INT IDENTITY,
	nome VARCHAR(100),
    id_categoria INT,
    id_fraqueza1 INT,
    id_fraqueza2 INT,
	PRIMARY KEY (id)
	);

	
	CREATE TABLE categorias(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_pokemon INT,
	categoria VARCHAR(150),
	FOREIGN KEY (id_pokemon) REFERENCES pokemons(id),
	);

	CREATE TABLE fraquezas(
	id INT IDENTITY(1,1) PRIMARY KEY,
    id_pokemon INT,
	fraqueza1 VARCHAR(100),
	fraqueza2 VARCHAR(100),
	FOREIGN KEY (id_pokemon) REFERENCES pokemons (id),
	
	);

    INSERT INTO pokemons (nome) VALUES
		(' Sylveon'),
		(' Phione '),
		('Boldore'),
		('Carbink'),
		('Zorua'),
		('Golbat'),
		('Gastly'),
		('Primarina'),
		('Cottonee'),
		('Swadloon');

	INSERT INTO categorias (id_pokemon, categoria) VALUES
	    ((SELECT id FROM pokemons WHERE nome  =  'Sylveon'),'Intertwining'),
	    ((SELECT id FROM pokemons WHERE nome =  'Phione '), 'Sea Drifter'),
	    ((SELECT id FROM pokemons WHERE nome =  'Boldore'),  'Ore'),
	    ((SELECT id FROM pokemons WHERE nome =  'Carbink'), 'Jewel'),
	    ((SELECT id FROM pokemons WHERE nome = 'Zorua'),'Tricky Fox'),
	    ((SELECT id FROM pokemons WHERE nome =  'Golbat'),'Bat'),
	    ((SELECT id FROM pokemons WHERE nome =  'Gastly'),'Gas'),
	    ((SELECT id FROM pokemons WHERE nome =  'Primarina'),'Soloist'),
	    ((SELECT id FROM pokemons WHERE nome =  'Cottonee'), 'Cotton Puff'),
	    ((SELECT id FROM pokemons WHERE nome = 'Swadloon'),' Leaf-Wrapped')
	
	INSERT INTO fraquezas (id_pokemon,  fraqueza1,  fraqueza2) VALUES
	    ((SELECT id FROM pokemons WHERE nome  =  'Sylveon '), 'Steel', 'Poison'),
	    ((SELECT id FROM pokemons WHERE nome =  'Phione'), 'Eletric' , 'Grass'),
	    ((SELECT id FROM pokemons WHERE nome =  'Boldore'),  'Grass', 'Water'),
	    ((SELECT id FROM pokemons WHERE nome =  'Carbink'), 'Grass', 'Water'),
	    ((SELECT id FROM pokemons WHERE nome = 'Zorua'), 'Fighting', 'Fairy'),
	    ((SELECT id FROM pokemons WHERE nome = 'Golbat'), 'Eletric', 'Rock'),
	    ((SELECT id FROM pokemons WHERE nome = 'Gastly'),' Ghost', 'Dark'),
	    ((SELECT id FROM pokemons WHERE nome =  'Primarina'), 'Grass', 'Eletric'),
	    ((SELECT id FROM pokemons WHERE nome = 'Cottonee'), 'Steel', 'Poison'),
	    ((SELECT id FROM pokemons WHERE nome = 'Swadloon'),'Flying', 'Fire');
		
		SELECT * FROM pokemons;
		SELECT * FROM categorias;
		SELECT * FROM fraquezas; 