#	Vizualização de tabelas
show tables;

select * from empregados;
select * from dependente;
select * from departamento;

Delimiter $

create database lista3;
use lista3;

#	Criação de tabelas
create table Departamento(
cod int not null auto_increment,
nome varchar(70),
descricao varchar(70),
primary key(cod)
);
create table Empregados(
cod int not null auto_increment,
nome varchar(70) not null,
cpf varchar(14) not null,
idade int(2) not null,
cod_depto int not null,
primary key(cod),
foreign key (cod_depto) references Departamento(cod)
);
create table Dependente(
cod int not null auto_increment,
cod_emp int not null,
nome varchar(70),
primary key(cod),
foreign key (cod_emp) references Empregados(cod)
);

#	Inserção nas tabelas
insert into departamento(cod, nome, descricao) values
	(null, 'Vendas', 'Realiza Venda dos produtos da empresa.'),
    (null, 'Suporte', 'Presta atendimento técnico aos clientes.'),
    (null, 'Financeiro', 'Administra as contas e o balanço financeiro da empresa.'),
    (null, 'Administrativo', null),
    (null, 'Marketing', 'Cuida da imagem da empresa no mercado.');
insert into empregados(cod, nome, cpf, idade, cod_depto) values 
	(null, 'Fernando', '127.896.177-88', 24, 5),
	(null, 'Augusto', '135.658.498-76', 35, 2),
	(null, 'João', '856.254.558-67', 28, 5);
insert into dependente(cod, cod_emp, nome) values
	(null, 1 , 'Marcelo Augusto Ferreira'),
    (null, 1 , 'Fernando Aurélio Batista'),
    (null, 3 , 'Marcela Barboda'),
    (null, 2 , 'João Pessanha da Costa');
$
delimiter ;
#	Consultas 

#1) Listar todos os empregados com mais de 24 anos.
		select * from empregados where idade > 24;
#2) Listar os nomes dos dependentes de funcionários com menos de 30 anos.
select d.nome from Empregados as emp, Dependente as d 
	where emp.idade < 30 and d.cod_emp = emp.cod;
#3) Listar todos os empregados de departamentos que possuam a letra "o" em seu nome e possuam menos de 30 anos.
		select e.* from Empregados as e,  departamento as d 
        where e.idade < 30 and d.nome like '%O%';
#4) Listar o cpf de todos os empregados que possuem mais de um dependente e fazem parte do departamento de Marketing.
	select e.cpf from empregados e, dependente d, departamento de
		where e.cod = d.cod_emp and e.cod_depto = de.cod and de.nome = 'Marketing' having count(d.cod_emp)>1;      
#5) Excluir todos os dependentes do empregado de código 1.
	delete from dependentes where cod_emp like 1;
#6) Excluir os departamentos que não possuem descrição.
	delete from departamento where descricao like null;
#7) Excluir todos os dependentes dos funcionários que fazem parte dos departamentos "Suporte" ou "Marketing".
	DELETE D
	FROM DEPENDENTE D, EMPREGADOS E, DEPARTAMENTO DEPTO
	WHERE E.COD = D.COD_EMP AND
	E.COD_DEPTO = DEPTO.COD AND 
	DEPTO.NOME = 'Marketing' OR DEPTO.NOME = 'Suporte' ;
#8) Alterar a idade de todos os funcionários adicionando 1.
	update empregados
	set idade = idade + 1;

	update empregados
	set idade = idade + 1
	where cod not like null;

#9) Alterar o nome e a descrição dos departamentos que não possuem funcionários para "NULL". 
#Executar agora a exclusão dos departamentos que possuem nome = NULL.

	UPDATE departamento d SET d.nome = null, d.descricao = null 
    WHERE d.nome NOT IN (SELECT * FROM (SELECT d.nome FROM departamento d, empregados e 
											WHERE d.cod = e.cod_depto AND e.cod_depto IS NOT NULL) AS TESTE);
	delete from departamento where nome like null;

#10) Inserir um departamento.

	insert into departamento(cod, nome, descricao) values(null, '', '');

#11) Inserir um funcionário que pertença ao departamento.



#12) Inserir um dependente para o funcionário.

select cod, nome, cpf, idade, cod_depto as Departamento from empregados;
#select (campos) from (Tabela)

select * from empregados where cod_depto = 5;
#select (campos) from (Tabela) where(onde) condição

select e.nome, e.cod_depto, d.cod, d.nome from empregados e, departamento d where e.cod_depto = d.cod;
# select (campos) from (Tabela) (apelido da tabela), (Tabela2) (apelido da tabela2) 
# where(restrição) condição;

select * from departamento order by nome desc;
#order by (campo) asc(ascendente) ou desc(descendente)


#1) Listar todos os empregados com mais de 24 anos.
	select * from empregados where idade > 24;