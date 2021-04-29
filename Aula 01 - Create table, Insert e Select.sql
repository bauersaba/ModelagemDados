/*

-- criar tabela no banco de dados
CREATE table Pessoa (
    idPessoa int,
    nomePessoa varchar(250),
    idade int 
);

-- Adicionar dados na tabela pessoa
INSERT INTO pessoa (idPessoa, nomePessoa, idade) VALUES (1, 'Silvia', 25);
INSERT INTO pessoa (idPessoa, nomePessoa, idade) VALUES (1, 'Maria', 25);

-- Selecionar os dados da tabela
-- SELECT idPessoa, nomePessoa, idade FROM Pessoa;
-- SELECT * FROM Pessoa;

-- Deletar a tabela
-- drop table pessoa;

-- Foi adicionado a chave primaria na tabela

CREATE table Pessoa (
    idPessoa int PRIMARY KEY,
    nomePessoa varchar(250),
    idade int 
);

-- Só é possível Adicionar pessoas com id que tenham valores diferentes.
INSERT INTO pessoa (idPessoa, nomePessoa, idade) VALUES (2, 'Silvia', 25);
INSERT INTO pessoa (idPessoa, nomePessoa, idade) VALUES (3, 'Maria', 25);


-- Deletar a tabela
drop table pessoa;


-- Foi adicionado a chave primaria com auto_increment na tabela

CREATE table Pessoa (
    idPessoa int PRIMARY KEY AUTO_INCREMENT,
    nomePessoa varchar(250),
    idade int 
);

*/



-- Não precisa adicionar o valor do Id. O auto increment foi adicionado.
-- INSERT INTO pessoa (nomePessoa, idade) VALUES ('Silvia', 25);
-- INSERT INTO pessoa (nomePessoa, idade) VALUES ('Maria', 25);

SELECT * FROM Pessoa;