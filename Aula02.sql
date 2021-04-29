INSERT INTO pessoa (nomePessoa, idade) VALUES ("Higor", 23);
INSERT INTO pessoa (nomePessoa, idade) VALUES ("Jonas", 34);
INSERT INTO pessoa (nomePessoa, idade) VALUES ("Claudio", 44);
INSERT INTO pessoa (nomePessoa, idade) VALUES ("Paulo", 21);	

SELECT * FROM pessoa;
SELECT * FROM pessoa WHERE idade < 20;
SELECT * FROM pessoa WHERE nomePessoa LIKE "j%";

not null 
/*Criar chave estrangeira.*/
foreign key (Campo) references Estado (idcampo);
foreign Campo INSERT into