CREATE TABLE Obra (
    dimensoes FLOAT,
    data_aquisicao DATE,
    titulo VARCHAR(250),
    codigo_obra INTEGER PRIMARY KEY,
    fk_Artista_codigo_artista INTEGER
);

CREATE TABLE Artista (
    nacionalidade VARCHAR(250),
    nome VARCHAR(250),
    codigo_artista INTEGER PRIMARY KEY,
	FOREIGN KEY (fk_Artista_codigo_artista) REFERENCES Artista (codigo_artista)
);
