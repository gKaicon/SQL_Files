DELIMITER $
create database if not exists aulaDML;
use aulaDML;
create table Pessoa(
	cpf varchar (14) primary key,
	nome varchar(35),
	sexo varchar(3),
	idade int(3)
);
insert into Pessoa(cpf, nome, sexo, idade) values
('111.222.333-44','Paulo Abreu','M',30),
('34785616177','Ana','F',null),
('15715749181','Karla','O',24),
('17885631511','Du','M',15),
('08332595685','Káicon','M',18);
CREATE TABLE Piloto(
	CPF VARCHAR(11)   NOT NULL,
	Cart_Trab VARCHAR(13)   NOT NULL,
	FOREIGN KEY (CPF) REFERENCES  Pessoa (CPF)
);
insert into Piloto(cpf, cart_trab)values('08332595685','Monitor');
$
DELIMITER ;

select * from pessoa;

SELECT nome, sexo, idade FROM Pessoa
GROUP BY idade
HAVING idade >= 18;

Select CPF, NOME, SEXO, IDADE From PESSOA
where sexo like 'M' or sexo like 'F';

Select CPF, NOME, SEXO, IDADE
From PESSOA
Where sexo in ('M','F');

Select CPF, NOME, SEXO, Idade
From PESSOA
Where idade >= 10 and idade <= 20;

Select CPF, NOME, SEXO, Idade
From PESSOA
Where idade between 10 and 20;

Select CPF as 'Meu CPF'
From PESSOA
Where cpf like '08332595685';

Select CPF as MeuCPF
From PESSOA
Where cpf like '08332595685';

Select CPF as Meu_CPF
From PESSOA
Where cpf like '08332595685';

Select * From PESSOA as P, Piloto Pil
Where P.cpf = Pil.cpf and P.cpf like '08332595685' and pil.cart_trab like 'Aviador';

Select * From PESSOA as P, Piloto Pil
Where P.cpf = Pil.cpf and P.cpf like '08332595685';

select * from pessoa;

SELECT COUNT(*) as 'Qtd de cadastros'FROM PESSOA;
SELECT COUNT(NOME) FROM PESSOA;
select count(idade) from Pessoa;
SELECT SUM(idade) FROM PESSOA;
SELECT AVG(idade) FROM PESSOA;
SELECT MAX(idade) FROM PESSOA;
SELECT MIN(idade) as 'Menor Idade' FROM PESSOA;
SELECT sexo, idade FROM Pessoa
GROUP BY cpf;

select count(sexo) from Pessoa;
select count(distinct sexo) from Pessoa;

select * from Pessoa p, Piloto pi where p.cpf = pi.cpf;