drop table estado, municipio; --Exclusão das tabelas anteriores.

-- Criação das tabelas Estado e Municipio.
create table estado (
	idEstado int primary key auto_increment,
    nomeEstado varchar(50) not null
);


create table municipio(
	idMunicipio int primary key auto_increment,
    NomeMunicipio varchar(50) not null,
    fk_idEstado int,
    foreign key (fk_idEstado) references estado(idEstado)
);

--Inserção de dados nas tabelas municipio e estado.
insert into estado (NomeEstado) values ("São Paulo");
insert into estado (NomeEstado) values ("Rio de Janeiro");
insert into estado (NomeEstado) values ("Espirito Santo");


insert into municipio (NomeMunicipio, fk_idEstado) values ("Hortolândia",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Sumaré",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Campinas",1);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Rio de Janeiro",2);
insert into municipio (NomeMunicipio, fk_idEstado) values ("Petrópolis",2);
insert into municipio (NomeMunicipio) values ("Ouro Preto");

-- Select com nomeação da tabela municipio como objeto
SELECT
m.idMunicipio,
m.nomeMunicipio,
m.fk_idEstado
FROM municipio as m

-- Inner join para fazer a busca dos dados que coencide entre as duas tabelas
inner join estado as e  on e.idEstado = m.fk_idEstado

-- Sintaxe padrão usando inner join 
SELECT
m.idMunicipio,
m.nomeMunicipio,
m.fk_idEstado,
e.idEstado,
e.nomeEstado
FROM municipio as m
inner join estado as e  on e.idEstado = m.fk_idEstado


-- Usando Left para buscar valores da tabela esquerda que coincidem com a tabela da direita.
SELECT
*
from municipio
LEFT JOIN estado on idEstado = fk_idEstado;

-- Usando Right para buscar valores da tabela direita que coincidem com a tabela da esquerda.
SELECT
*
from municipio
RIGHT JOIN estado on idEstado = fk_idEstado;


