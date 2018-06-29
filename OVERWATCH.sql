	DROP TABLE heroes;
	CREATE TABLE heroes(
	
	id INT IDENTITY(1,1),
	nome VARCHAR(100) NOT NULL,
	dificuldade TINYINT NOT NULL,
	funcao VARCHAR(10) NOT NULL,
	idade CHAR(2) NOT NULL,
	nome_verdadeiro VARCHAR(100) NOT NULL,
	ocupacao VARCHAR(100) NOT NULL,
	base VARCHAR(50) NOT NULL,
	PRIMARY KEY(id)
	);

	DROP TABLE abilities;
	CREATE TABLE abilities(
	id INT IDENTITY(1,1) PRIMARY KEY,
	id_heroi INT,
	nome VARCHAR(100) NOT NULL,
	descricao TEXT DEFAULT 'N/A',
	FOREIGN KEY (id_heroi) REFERENCES herois(id)
	
	);
	
	SELECT id 'ID',nome 'Nome', dificuldade 'Dificuldade', funcao 'Função do herói' FROM heroes;

	
	
	INSERT INTO heroes (nome, dificuldade, funcao, idade, nome_verdadeiro,ocupacao, base) VALUES 
	('D.VA', 2, 'TANQUE', 19, 'Hana Song','Gamer profissional (anteriormente), piloto de Mecha', 'Busan, Coréia do Sul'),
	('ORISA', 2, 'TANQUE',  1, 'Orisa','Guardiã Robô', 'Numbani'),
	('REINHARDT', 1, 'TANQUE' ,  61, 'Reinhardt Wilhelm','Aventureiro', 'Estugarda, Alemanha'),
	('ROADHOG', 1, 'TANQUE',  48, 'Mako Rutledge','Executor (anteriormente), Guarda-costas', 'Junkertown, Austrália'),
	('WINSTON', 2, 'TANQUE', 29, 'Winston','Cientista, Aventureiro', 'Colônia Lunar do Horizonte (anteriormente)'),
	('ZARYA', 3, 'TANQUE', 28, 'Aleksandra Zaryanova','Soldado', 'Fronte de Krasnoyarsk, Rússia'),
	('BASTION', 1, 'DANO', 30, 'Autômato de Cerco E54 dos Laboratórios SST, “Bastion”','Autômato de batalha', 'Desconhecida' ),
	('DOOMFIST', 3, 'DANO', 45, 'Akande Ogundimu','Mercenário', 'Oyo, Nigéria'),
	('GENJI', 3, 'DANO', 35, 'Genji Shimada','Aventureiro', 'Monastério de Shambali, Nepal'),
	('HANZO', 3, 'DANO', 38, 'Genji Shimada','Mercenário, Assassino', 'Hanamura, Japão'),
	('JUNKRAT', 2, 'DANO', 25, 'Jamison Fawkes','Anarquista, Ladrão, Demolidor, Mercenário, Sucateiro', 'Junkertown, Austrália'),
	('MCCREE', 2, 'DANO', 37, 'Jesse McCree','Caçador de recompensas, Mercenário, Sucateiro', 'Santa Fé, Novo México, EUA'),
	('MEI', 3, 'DANO', 31, 'Mei-Ling Zhou','Climatologista, Aventureira', 'Xi’an, China'),
	('PHARAH', 2, 'DANO', 32, 'Fareeha Amari','Chefe da segurança', 'Giza, Egito'),
	('REAPER', 1, 'DANO', 0, 'Desconhecida','Mercenário', 'Desconhecida'),
	('SOLDADO: 76', 1, 'DANO', 0, 'Desconhecida','Vigilante', 'Desconhecida'),
	('SOMBRA', 3, 'DANO', 30, '░░░░░░','Hacker', 'Dorado, México'),
	('SYMMETRA', 2, 'DANO', 28, 'Satya Vaswani','Arquitécnica', 'Utopaea, Índia'),
	('TORBJÖRN', 2, 'DANO', 57, 'Torbjörn Lindholm','Designer de armas', 'Gotemburgo, Suécia'),
	('TRACER', 2, 'DANO', 26, 'Lena Oxton','Aventureira', 'Londres, Inglaterra'),
	('WIDOWMAKER', 2, 'DANO', 33, 'Amélie Lacroix','Assassina', 'Annecy, França'),
	('ANA', 1, 'SUPORTE', 60, 'Ana Amari','Caçadora de recompensa', 'Cairo, Egito'),
	('BRIGITTE', 1, 'SUPORTE', 23, 'Brigitte Lindholm','Engenheira Mecânica, Aventureira', 'Gotemburgo, Suécia'),
	('LÚCIO', 2, 'SUPORTE', 26, 'Lúcio Correia dos Santos','DJ; Lutador da Liberdade', 'Rio de Janeiro, Brasil'),
	('MERCY', 1, 'SUPORTE', 37, 'Angela Ziegler','Médico de campo, Socorrista', 'Zurique, Suíça'),
	('MOIRA', 2, 'SUPORTE', 48, 'Moira O´Deorain','Geneticista', 'Dublin, Irlanda; Oásis, Iraque'),
	('ZENYATTA', 3, 'SUPORTE', 20, 'Tekhartha Zenyatta','Guru andarilho, Aventureiro', 'Monastério de Shambali, Nepal');

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'TRACER'), 'PISTOLAS ELETROMAGNÉTICAS', NULL),
	((SELECT id FROM heroes WHERE nome = 'TRACER'), 'TELEPORTAR', NULL),
	((SELECT id FROM heroes WHERE nome = 'TRACER'), 'RECORDAÇÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'TRACER'), 'BOMBA ELETROMAGNÉTICA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'BASTION'), 'CONFIGURAÇÃO: RECONHECIMENTO', NULL),
	((SELECT id FROM heroes WHERE nome = 'BASTION'), 'CONFIGURAÇÃO: SENTINELA', NULL),
	((SELECT id FROM heroes WHERE nome = 'BASTION'), 'RECONFIGURAR', NULL),
	((SELECT id FROM heroes WHERE nome = 'BASTION'), 'AUTO REPARO', NULL),
	((SELECT id FROM heroes WHERE nome = 'BASTION'), 'CONFIGURAÇÃO: TANQUE', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'REAPER'), 'ESPINGARDAS INFERNAIS', NULL),
	((SELECT id FROM heroes WHERE nome = 'REAPER'), 'FORMA FANTASMA', NULL),
	((SELECT id FROM heroes WHERE nome = 'REAPER'), 'PASSOS DAS SOMBRAS',NULL),
	((SELECT id FROM heroes WHERE nome = 'REAPER'), 'DESABROCHAR DA MORTE', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'GENJI'), 'SHURIKEN', NULL),
	((SELECT id FROM heroes WHERE nome = 'GENJI'), 'DESVIAR',NULL),
	((SELECT id FROM heroes WHERE nome = 'GENJI'), 'GOLPE VELOZ', NULL),
	((SELECT id FROM heroes WHERE nome = 'GENJI'), 'LÂMINA DO DRAGÃO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'WINSTON'), 'CANHÃO DE TESLA',NULL),
	((SELECT id FROM heroes WHERE nome = 'WINSTON'), 'SALTO A JATO', NULL),
	((SELECT id FROM heroes WHERE nome = 'WINSTON'), 'PROJETOR DE BARREIRA', NULL),
	((SELECT id FROM heroes WHERE nome = 'WINSTON'), 'FÚRIA PRIMATA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'ZENYATTA'), 'ORBE DA DESTRUIÇÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZENYATTA'), 'ORBE DA HARMONIA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZENYATTA'), 'ORBE DA DISCÓRDIA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZENYATTA'), 'TRANSCENDÊNCIA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'CANHÕES DE FUSÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'PISTOLA DE LUZ', NULL),
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'PROPULSORES', NULL),
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'MICRO MÍSSEIS', NULL),
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'AUTODESTRUIR', NULL),
	((SELECT id FROM heroes WHERE nome = 'D.VA'), 'CHAMAR MECHA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'ORISA'), 'METRALHADORA DE FUSÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ORISA'), 'FORTIFICAR', NULL),
	((SELECT id FROM heroes WHERE nome = 'ORISA'), 'PARADOS!', NULL),
	((SELECT id FROM heroes WHERE nome = 'ORISA'), 'BARREIRA PROTETORA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ORISA'), 'AMPLIFICADOR', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'REINHARDT'), 'MARTELO PROPULSOR', NULL),
	((SELECT id FROM heroes WHERE nome = 'REINHARDT'), 'CAMPO DE BARREIRA', NULL),
	((SELECT id FROM heroes WHERE nome = 'REINHARDT'), 'INVESTIDA', NULL),
	((SELECT id FROM heroes WHERE nome = 'REINHARDT'), 'TIRO FLAMEJANTE', NULL),
	((SELECT id FROM heroes WHERE nome = 'REINHARDT'), 'ABALO TERRESTRE', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'ROADHOG'), 'ARMA DE SUCATA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ROADHOG'), 'PEGANDO FÔLEGO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ROADHOG'), 'CORRENTE DE GANCHO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ROADHOG'), 'CAIR MATANDO', NULL);
	

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'ZARYA'), 'CANHÃO DE PARTÍCULAS', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZARYA'), 'BARREIRA DE PARTÍCULAS', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZARYA'), 'BARREIRA PROJETADA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ZARYA'), 'SURTO DE GRÁVITONS', NULL);


	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'CANHÃO DE MÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'ABALO SÍSMICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'GANCHO ASCENDENTE', NULL),
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'SOCO FOGUETE', NULL),
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'IMPACTO METEORO', NULL),
	((SELECT id FROM heroes WHERE nome = 'DOOMFIST'), 'A MELHOR DEFESA...', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'HANZO'), 'ARCO DA TEMPESTADE', NULL),
	((SELECT id FROM heroes WHERE nome = 'HANZO'), 'FLECHA SÔNICA', NULL),
	((SELECT id FROM heroes WHERE nome = 'HANZO'), 'FLECHAS DA TEMPESTADE', NULL),
	((SELECT id FROM heroes WHERE nome = 'HANZO'), 'SALTO', NULL),
	((SELECT id FROM heroes WHERE nome = 'HANZO'), 'GOLPE DO DRAGÃO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'JUNKRAT'), 'LANÇADOR DE GRANADAS', NULL),
	((SELECT id FROM heroes WHERE nome = 'JUNKRAT'), 'MINA DE CONCUSSÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'JUNKRAT'), 'ARMADILHA DE AÇO', NULL),
	((SELECT id FROM heroes WHERE nome = 'JUNKRAT'), 'CAOS TOTAL', NULL),
	((SELECT id FROM heroes WHERE nome = 'JUNKRAT'), 'PNEU DA MORTE', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'MCCREE'), 'PACIFICADOR', NULL),
	((SELECT id FROM heroes WHERE nome = 'MCCREE'), 'ROLAMENTO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MCCREE'), 'CLARÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MCCREE'), 'TIRO CERTEIRO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'MEI'), 'ANIQUILADOR ENDOTÉRMICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MEI'), 'CONGELAMENTO CRIOGÊNICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MEI'), 'MURALHA DE GELO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MEI'), 'NEVASCA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'PHARAH'), 'LANÇADOR DE FOGUETES', NULL),
	((SELECT id FROM heroes WHERE nome = 'PHARAH'), 'SALTO FOGUETE', NULL),
	((SELECT id FROM heroes WHERE nome = 'PHARAH'), 'EXPLOSÃO CONCUSSIVA', NULL),
	((SELECT id FROM heroes WHERE nome = 'PHARAH'), 'BOMBARDEIO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'SOLDADO: 76'), 'RIFLE DE PULSO PESADO', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOLDADO: 76'), 'FOGUETES HÉLIX', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOLDADO: 76'), 'CAMPO BIÓTICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOLDADO: 76'), 'VISOR TÁTICO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'SOMBRA'), 'PISTOLA AUTOMÁTICA', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOMBRA'), 'HACKEAR', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOMBRA'), 'FURTIVIDADE', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOMBRA'), 'TRANSLOCADOR', NULL),
	((SELECT id FROM heroes WHERE nome = 'SOMBRA'), 'PEM', NULL);


	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'SYMMETRA'), 'PROJETOR DE FÓTONS', NULL),
	((SELECT id FROM heroes WHERE nome = 'SYMMETRA'), 'TORRE DE SENTINELA', NULL),
	((SELECT id FROM heroes WHERE nome = 'SYMMETRA'), 'TELETRANSPORTADOR', NULL),
	((SELECT id FROM heroes WHERE nome = 'SYMMETRA'), 'BARREIRA DE FÓTONS', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'TORBJÖRN'), 'PISTOLA DE REBITE', NULL),
	((SELECT id FROM heroes WHERE nome = 'TORBJÖRN'), 'MARTELO DE FORJA', NULL),
	((SELECT id FROM heroes WHERE nome = 'TORBJÖRN'), 'CONSTRUIR TORRE', NULL),
	((SELECT id FROM heroes WHERE nome = 'TORBJÖRN'), 'IMPLEMENTO DE ARMADURA', NULL),
	((SELECT id FROM heroes WHERE nome = 'TORBJÖRN'), 'NÚCLEO FUNDIDO', NULL);


	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'WIDOWMAKER'), 'BEIJO DA VIÚVA', NULL),
	((SELECT id FROM heroes WHERE nome = 'WIDOWMAKER'), 'ARPÉU', NULL),
	((SELECT id FROM heroes WHERE nome = 'WIDOWMAKER'), 'MINA VENENOSA', NULL),
	((SELECT id FROM heroes WHERE nome = 'WIDOWMAKER'), 'VISÃO INFRAVERMELHO', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'ANA'), 'RIFLE BIÓTICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ANA'), 'DARDO SONÍFERO', NULL),
	((SELECT id FROM heroes WHERE nome = 'ANA'), 'GRANADA BIÓTICA', NULL),
	((SELECT id FROM heroes WHERE nome = 'ANA'), 'ESTIMULANTE', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'MANGUAL A JATO', NULL),
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'KIT DE REPAROS', NULL),
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'DISPARO AÇOITADOR', NULL),
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'BARREIRA DE ESCUDO', NULL),
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'REAGRUPAR', NULL),
	((SELECT id FROM heroes WHERE nome = 'BRIGITTE'), 'GOLPE DE ESCUDO', NULL);


	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'LÚCIO'), 'AMPLIFICADOR SÔNICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'LÚCIO'), 'TRANSIÇÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'LÚCIO'), 'SOLTA O SOM', NULL),
	((SELECT id FROM heroes WHERE nome = 'LÚCIO'), 'BARREIRA DE SOM', NULL);
	
	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'BASTÃO DE CADUCEU', NULL),
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'DESINTEGRADOR DE CADUCEU', NULL),
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'ANJO DA GUARDA', NULL),
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'RESSURREIÇÃO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'DESCENSO ANGELICAL', NULL),
	((SELECT id FROM heroes WHERE nome = 'MERCY'), 'VALQUÍRIA', NULL);

	INSERT INTO abilities (id_heroi, nome, descricao) VALUES
	((SELECT id FROM heroes WHERE nome = 'MOIRA'), 'PUNHO BIÓTICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MOIRA'), 'ORBE BIÓTICO', NULL),
	((SELECT id FROM heroes WHERE nome = 'MOIRA'), 'DESVANECER', NULL),
	((SELECT id FROM heroes WHERE nome = 'MOIRA'), 'COALESCÊNCIA', NULL);

	

	
