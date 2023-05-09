/*
	 /* =========================================================
		Script para Crição das TABELAS, referente aos exercícios da 
		modelagem de funcionário do livro Navate.		
	*/
		
		
  
begin;	
	CREATE TABLE funcionario (
		Pnome VARCHAR(15) NOT NULL,
		Minicial char,
		Unome VARCHAR(50),
		Cpf CHAR(11) NOT NULL,
		Datanasc DATE,
		Endereco VARCHAR(50),
		Sexo CHAR CHECK (Sexo = 'M' OR Sexo = 'F'),
		Salario DECIMAL(18,4) CHECK (SALARIO >=0),
		Cpf_supervisor CHAR(11),
		Dnr INTEGER,
		PRIMARY KEY(Cpf),
		FOREIGN KEY (Cpf_supervisor) REFERENCES funcionario(Cpf)		
	);
	
	CREATE TABLE departamento (
		Dnome VARCHAR(15) UNIQUE NOT NULL,
		Dnumero INTEGER NOT NULL,
		Cpf_gerente CHAR(11), -- pode inserir um departamento sem gerente e posteriormente adicionar o gerente.
		Data_inicio_gerente DATE,
		PRIMARY KEY (Dnumero),
		FOREIGN KEY (Cpf_gerente) REFERENCES funcionario(Cpf)
	);
	
	ALTER TABLE funcionario ADD FOREIGN KEY (Dnr) REFERENCES departamento(Dnumero);
	
	CREATE TABLE localizacao_dep (
		Dnumero INT NOT NULL,
		Dlocal VARCHAR(15) NOT NULL,
		PRIMARY KEY (Dnumero, Dlocal),
		FOREIGN KEY (Dnumero) REFERENCES departamento(Dnumero)
	);

	CREATE TABLE projeto (
		Projnome VARCHAR(15) NOT NULL,
		Projnumero INTEGER NOT NULL,
		Projlocal VARCHAR(15),
		Dnum INTEGER NOT NULL,
		PRIMARY KEY(Projnumero),
		UNIQUE(Projnome),
		FOREIGN KEY(Dnum) REFERENCES departamento(Dnumero)
	);

	CREATE TABLE trabalha_em (
		Fcpf CHAR(11) NOT NULL,
		Pnr INT NOT NULL,
		Horas DECIMAL(3,1),
		PRIMARY KEY(Fcpf, Pnr),
		FOREIGN KEY (Fcpf) REFERENCES funcionario(Cpf),
		FOREIGN KEY (Pnr) REFERENCES projeto(Projnumero)
	);

	CREATE TABLE dependente (
		Fcpf CHAR(11) NOT NULL,
		Nome_dependente VARCHAR(15) NOT NULL,
		Sexo CHAR,
		Datanasc DATE,
		Parentesco VARCHAR(8),
		PRIMARY KEY(Fcpf, Nome_dependente),
		FOREIGN KEY (Fcpf) REFERENCES funcionario(Cpf) ON DELETE CASCADE
	);

	
	--Script de População das TABELAS::

	/* ====== TABELA DEPARTAMENTO ========= */
	
	INSERT INTO departamento(Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
	VALUES ('Matriz', 1, NULL, '1981-06-19');
	
	INSERT INTO departamento(Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
	VALUES ('Administração', 4, NULL, '1995-01-01');
	
	INSERT INTO departamento(Dnome, Dnumero, Cpf_gerente, Data_inicio_gerente)
	VALUES ('Pesquisa', 5, NULL, '1988-05-22');

	
 	
	/* ====== TABELA FUNCIONARIO ========= */	
	
	--funcionario 8
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Jorge', 'E', 'Brito', '88866555576', '1937-11-10', 'Rua do Horto, 35, São Paulo, SP', 'M', 55000, NULL, 1);
	
	--funcionario 2
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Fernando', 'T', 'Wong', '33344555587', '1955-12-08', 'Rua da Lapa, 34, Sao Paulo, SP', 'M', 40000, '88866555576',5);	
	
	--funcionario 1
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Joao', 'B', 'Silva', '12345678966', '1965-09-01', 'Rua das Flores, 751, Sao Paulo, SP', 'M', 30000, '33344555587', 5);
	
	--funcionario 4
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Jennifer', 'S', 'Souza', '98765432168', '1941-06-20', 'Av. Arthur de Lima, 54, Santo André, SP', 'F', 43000, '88866555576', 4);	
	
	--funcionario 3
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Alice', 'J', 'Zelava', '99988777767', '1968-01-19', 'Rua Souza Lima, 35, Curitiba, PR', 'F', 25000, '98765432168',4);	
	
	--funcionario 5
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Ronaldo', 'K', 'Lima', '66688444476', '1962-09-15', 'Rua Rebouças, 65, Piracacicaba, SP', 'M', 38000, '33344555587', 5);
	
	--funcionario 6
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'Joice', 'A', 'Leite', '45345345376', '1972-07-31', 'Av. Lucas Obes, 74, São Paulo, SP', 'F', 25000, '33344555587', 5);
	
	--funcionario 7
	INSERT INTO funcionario (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
	VALUES( 'André', 'V', 'Pereira', '98798798733', '1969-03-29', 'Rua Timbira, 35, São Paulo, SP', 'M', 25000, '98765432168', 4);

	

	/* ====== TABELA DEPARTAMENTO ATUALIZANDO OS GERENTES========= */
	
	UPDATE departamento SET Cpf_gerente = '88866555576' WHERE Dnumero = 1;

 	UPDATE departamento SET Cpf_gerente = '98765432168' WHERE Dnumero = 4;
 	
 	UPDATE departamento SET Cpf_gerente = '33344555587' WHERE Dnumero = 5;
	
	/* ====== TABELA LOCALIZACAO_DEP ========= */
	
	INSERT INTO localizacao_dep(Dnumero, Dlocal) VALUES (1, 'São Paulo');
	INSERT INTO localizacao_dep(Dnumero, Dlocal) VALUES (4, 'Mauá');
	INSERT INTO localizacao_dep(Dnumero, Dlocal) VALUES (5, 'Santo André');
	INSERT INTO localizacao_dep(Dnumero, Dlocal) VALUES (5, 'Itu');
	INSERT INTO localizacao_dep(Dnumero, Dlocal) VALUES (5, 'São Paulo');


	/* ====== TABELA PROJETO ========= */
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('ProdutoX', 1, 'Santo André', 5);
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('ProdutoY', 2, 'Itú', 5);
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('ProdutoZ', 3, 'São Paulo', 5);
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('Informatização', 10, 'Mauá', 4);
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('Reorganização', 20, 'São Paulo', 1);
	
	INSERT INTO projeto (Projnome, Projnumero, Projlocal, Dnum)
	VALUES ('Novosbeneficíos', 30, 'Mauá', 4);
	

	
	/* ====== TABELA TRABALHA_EM ========= */
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('12345678966', 1, 32.5);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('12345678966', 2, 7.5);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('66688444476', 3, 40);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('45345345376', 1, 20);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('45345345376', 2, 20);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('33344555587', 2, 10);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('33344555587', 3, 10);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('33344555587', 10, 10);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('33344555587', 20, 10);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('99988777767', 30, 30);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('99988777767', 10, 10);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('98798798733', 10, 35);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('98798798733', 30, 5);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('98765432168', 30, 20);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('98765432168', 20, 15);
	
	INSERT INTO trabalha_em(Fcpf, Pnr, Horas)
	VALUES ('88866555576', 20, NULL);
	
	
	
	/* ====== TABELA DEPENDENTE ========= */
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '33344555587', 'Alicia', 'F', '1966-04-05', 'Filha');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '33344555587', 'Tiago', 'M', '1983-10-23', 'Filho');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '33344555587', 'Janaína', 'F', '1958-05-03', 'Esposa');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '98765432168', 'Antônio', 'M', '1942-02-28', 'Marido');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '12345678966', 'Michael', 'M', '1988-02-04', 'Filho');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '12345678966', 'Alícia', 'F', '1988-12-30', 'Filha');
	
	INSERT INTO dependente(Fcpf, Nome_dependente, Sexo, Datanasc, Parentesco)
	VALUES ( '12345678966', 'Elizabth', 'F', '19767-05-05', 'Esposa');

commit;
select max(datanasc) as Mais_novo from funcionario;
select min(datanasc) as Mais_velho from funcionario;
SELECT Pnome, Cpf FROM FUNCIONARIO
WHERE sexo = 'M';

SELECT * FROM PROJETO
WHERE Projnumero = 30 AND Dnum = 4;

select * from funcionario
where pnome like '___a%';

Select * from FUNCIONARIO
WHERE Pnome like 'F%';

Select * from FUNCIONARIO
WHERE Pnome like '%A';

Select * from FUNCIONARIO
WHERE Pnome like '%a';

Select * from FUNCIONARIO
WHERE cpf is null; /*(is not null)*/

Select * from FUNCIONARIO
WHERE cpf is not null;

Select * from FUNCIONARIO
WHERE cpf_supervisor is null;

select * from funcionario;

Select * from FUNCIONARIO
WHERE salario >= 25000 and salario <= 30000;

Select * from FUNCIONARIO
WHERE salario between 25000 and 30000;

INSERT INTO FUNCIONARIO (Pnome, Unome, cpf, Dnr) values ('Roberto',
'Gomes', '09332595685', 5);

INSERT INTO FUNCIONARIO VALUES ('Ricardo', 'K', 'Marini', '6532298658', '1962-12-30', 'Rua Itapira – 44, SP', 'M', 37000, '09332595685', 4);
*/


