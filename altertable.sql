Create table aluno(
	idAluno int primary key auto_increment,
	nomeAluno varchar (50)
);

alter table aluno add idadeAluno int;

ALTER TABLE aluno drop column idadeAluno;

alter table aluno modify column nomeAluno varchar (80) not null;

alter table aluno change column nomeAluno nome_aluno varchar (30);


CREATE table professor(
	cpf int primary key,
	nomeProfessor varchar (50),
	idade int 

);
create table aluno(
	idAluno int primary key auto_increment,
	nomeAluno varchar (50) not null,
	idade int not null
);

alter table aluno add fk_professor_cpf int;

alter table aluno add foreign key (fk_professor_cpf) references professor(cpf);