CREATE TABLE FUNCIONARIO (
	Cpf VARCHAR(14) PRIMARY KEY NOT NULL,
	Pnome VARCHAR(35) NOT NULL,
	InicialNomeMeio char,
	Datanasc DATE,
	Endereco VARCHAR(30),
	Sexo CHAR,
	Salario DECIMAL(18,4) CHECK (SALARIO >=0),
	Cpf_supervisor VARCHAR(14) NOT NULL,
	DEPARTAMENTO_FK INT,
	FOREIGN KEY (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf)
);

CREATE TABLE DEPARTAMENTO (
	Dnumero int PRIMARY KEY UNIQUE NOT NULL,
	Dnome VARCHAR(35) NOT NULL,
	Cpf_gerente VARCHAR(14) NOT NULL,
	Data_inicio_gerente DATE,
	FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf)
);

ALTER TABLE FUNCIONARIO
	ADD CONSTRAINT DEPARTAMENTO_FK FOREIGN KEY(DEPARTAMENTO_FK) REFERENCES DEPARTAMENTO(Dnumero);
	
CREATE TABLE LOCALIZACAO_DEP (
	Dnumero INT NOT NULL,
	Dlocal VARCHAR(15) NOT NULL,
	PRIMARY KEY(Dnumero, Dlocal),
	FOREIGN KEY (Dnumero) REFERENCES DEPARTAMENTO(Dnumero)
);

CREATE TABLE PROJETO (
	Projnome VARCHAR(15) UNIQUE NOT NULL,
	Projnumero INT PRIMARY KEY NOT NULL,
	Projlocal VARCHAR(15),
	Dnum INT NOT NULL,
	FOREIGN KEY(Dnum) REFERENCES DEPARTAMENTO(Dnumero)
);

CREATE TABLE TRABALHA_EM (
	Fcpf CHAR(14) NOT NULL,
	Pnr INT NOT NULL,
	Horas DECIMAL(3,1) NOT NULL,
	PRIMARY KEY(Fcpf, Pnr),
	FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf),
	FOREIGN KEY (Pnr) REFERENCES PROJETO(Projnumero)
);

CREATE TABLE DEPENDENTES (
	Fcpf CHAR(14) NOT NULL,
	Nome_dependente VARCHAR(15) NOT NULL,
	Sexo CHAR,
	Datanasc DATE,
	Parentesco VARCHAR(8),
	PRIMARY KEY(Fcpf, Nome_dependente),
	FOREIGN KEY (Fcpf) REFERENCES FUNCIONARIO(Cpf)
);

CREATE TABLE ALUNO (
	MATRICULA INT PRIMARY KEY NOT NULL
);

ALTER TABLE ALUNO 
	ADD COLUMN NOME VARCHAR(30) NOT NULL,
	ADD COLUMN TIPO VARCHAR(10) NOT NULL,
	ADD CONSTRAINT TIPO CHECK (TIPO IN('REG', 'DES'));
	
	

