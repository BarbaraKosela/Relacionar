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
	((SELECT id FROM alunos WHERE nome = 'Alice'), 'Organizando(a)'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Pontual'),
	((SELECT id FROM alunos WHERE nome = 'Miguel'), 'Criativo(a)'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Proativo(a)'),
	((SELECT id FROM alunos WHERE nome = 'Alice'), 'Altruista'),
	((SELECT id FROM alunos WHERE nome = 'Valentina'), 'Pessimista'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Flexível'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Observadora'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Paciente'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Indelicado(a)'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Desobediente'),
	((SELECT id FROM alunos WHERE nome = 'Miguel'), 'Intolerante'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Empático(a)'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Egoísta'),
	((SELECT id FROM alunos WHERE nome = 'Heitor'), 'Egoísta'),
	((SELECT id FROM alunos WHERE nome = 'Joaquim'), 'Altruísta'),
	((SELECT id FROM alunos WHERE nome = 'Sophia'), 'Sensível');

	SELECT * FROM caracteristicas;
	SELECT * FROM alunos;
