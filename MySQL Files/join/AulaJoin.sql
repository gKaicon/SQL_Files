create database aulajoin;

show databases;

use aulajoin;

create table tabelaA(
id int not null auto_increment primary key,
nome varchar(15) not null
);

create table tabelaB(
id int not null auto_increment primary key,
nome varchar(15) not null
);

select * from tabelaA;
select * from tabelaB;

insert into tabelaA (id, nome) values (null, 'Casa'),
(null, 'Dado'),
(null, 'Robo'),
(null, 'Jose');

insert into tabelaB (id, nome) values (null, 'Robo'),
(null, 'Macaco'),
(null, 'Maria'),
(null, 'Casa');

SELECT * FROM TabelaA FULL JOIN TABELAB;
