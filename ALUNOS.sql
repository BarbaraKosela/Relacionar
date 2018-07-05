    DROP TABLE caracteristicas;
	DROP TABLE alunos;
	CREATE TABLE alunos(
	
	id INT IDENTITY(1,1),
	nome VARCHAR(200),
	idade INT,
	PRIMARY KEY(id)
	);

	
	CREATE TABLE caracteristicas(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_alunos INT,
	nome VARCHAR(150) NOT NULL,
	
	FOREIGN KEY (id_alunos) REFERENCES alunos(id)
	
	);

	INSERT INTO alunos VALUES ('Alice', 18);
	INSERT INTO alunos VALUES ('Sophia', 4);
	INSERT INTO alunos VALUES ('Miguel', 9);
	INSERT INTO alunos VALUES ('Heitor', 23);
	INSERT INTO alunos VALUES ('Valentina', 15);
	INSERT INTO alunos VALUES ('Joaquim', 49);

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Egoísta'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Indelicado(a)'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Proativo(a)'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Egoísta');

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Alice'), 'Organizando(a)'),
	((SELECT id FROM alunos WHERE nome = 'Alice'), 'Altruísta');

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Pontual'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Observadora'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Desobediente'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Sensível'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Egoísta');

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Miguel'), 'Criativo(a)'),
	((SELECT id FROM alunos WHERE nome = 'Miguel'), 'Intolerante');

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Valentina'), 'Pessimista');

	INSERT INTO caracteristicas(id_alunos, nome) VALUES 
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Flexível'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Paciente'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Empático(a)'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Altruísta');


	-- i. Selecione o nome do aluno e as características;
	SELECT alunos.nome 'Nome do aluno', caracteristicas.nome 'Características do aluno' FROM alunos JOIN caracteristicas ON (alunos.id = caracteristicas.id_alunos);
	-- ii. Selecione a quantidade de alunos que que são altruístas;
	SELECT COUNT(caracteristicas.nome) 'Número de alunos altruístas' FROM alunos JOIN caracteristicas ON (alunos.id = caracteristicas.id_alunos) WHERE caracteristicas.nome = 'Altruísta';
	-- iii. Selecione a quantidade de alunos para cada categoria, agrupando pela categoria;
	SELECT caracteristicas.nome 'A característica', COUNT(alunos.id) 'Quantidade de características' FROM caracteristicas JOIN alunos ON (caracteristicas.id_alunos = alunos.id) GROUP BY caracteristicas.nome;