CREATE TABLE Estado (
    sigla_estado varchar(2) PRIMARY KEY,
    nome_estado varchar(250)
);

CREATE TABLE municipio (
    nome_municipio varchar(250),
    fk_Estado_sigla_estado varchar(2),
    FOREIGN KEY (fk_Estado_sigla_estado) REFERENCES Estado (sigla_estado)
);

INSERT INTO Estado (sigla_estado, nome_estado) VALUES ("SP", "São Paulo");
INSERT INTO Estado (sigla_estado, nome_estado) VALUES ("RJ", "Rio de Janeiro");

INSERT INTO municipio (nome_municipio, fk_Estado_sigla_estado) values ("Hortolandia","SP");
INSERT INTO municipio (nome_municipio, fk_Estado_sigla_estado) values ("Cabo Frio","RJ");