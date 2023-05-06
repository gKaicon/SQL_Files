Create database Kaicon;
use Kaicon;

create table cursos(
IDCURSO INT AUTO_INCREMENT,
NOME VARCHAR(30) NOT NULL,
HORAS INT(3) NOT NULL,
VALOR FLOAT(10,2) NOT NULL,
PRIMARY KEY(IDCURSO));

SELECT * FROM CURSOS;

Delimiter $$
create procedure CadCurso (NOME varchar(30), HORAS int(3), VALOR float(10,2)) 
Begin
insert into cursos values (null, NOME, HORAS, VALOR);
end;
$$

Delimiter ;

Delimiter $$
call cadCurso('Python', 12, 250.00);
call cadCurso('CSS', 35 , 300.00);
call cadCurso('PHP', 25, 200.00);
call cadCurso('JavaScript', 15, 300.00);
call cadCurso('Portugol', 1, 20.00);
call cadCurso('Excel', 20, 400.00);
call cadCurso('Informática Básica', 15, 100.00);
call cadCurso('C#', 15, 200.00);
call cadCurso('JAVA', 25, 550.000);
call cadCurso('Banco de Dados SQL', 50, 650.00);
$$

#Procedure de Consulta de Curso
Delimiter $$
Create procedure ConsultaCurso(VER Int) select concat('O curso é sobre ', nome , ', com carga horária de ', horas , ' horas', ', no valor de R$', valor) 
as ConsultaCurso from Cursos where VER not like '-1';
$$
Delimiter ;
Drop procedure ConsultaCurso;
#Digite qualquer número
call COnsultaCurso('-2');

Create database Kaicon;
use Kaicon;
#CRIE UMA TABELA COM O NOME FUNCIONÁRIO E OS SEGUINTES CAMPOS: NOME, SOBRENOME, QUANTIDADE_FILHOS, SALARIO.

create table funcionario(
IDFUNCIONARIO INT AUTO_INCREMENT,
NOME VARCHAR(30) NOT NULL,
SOBRENOME VARCHAR(30) NOT NULL,
QTD_FILHOS INT(3) NOT NULL,
SALARIO decimal(12,2) NOT NULL,
PRIMARY KEY(IDFUNCIONARIO));

Delimiter $
create procedure CadFuncionario (NOME varchar(30), SOBRENOME varchar(30), QTD_FILHOS int(3), SALARIO decimal(10,2)) 
MAIN: Begin
	insert into funcionario(idfuncionario, nome, sobrenome, qtd_filhos, salario) values (null, NOME, SOBRENOME, QTD_FILHOS, SALARIO);
		if(nome = null) then
		select 'Preencha o campo nome' as Resposta1;
		leave main;
		end if;

		if(Sobrenome = null) then
		select 'Preencha o campo sobrenome' as Resposta2;
		leave main;
		end if;
		if(QTD_FILHOS = null) then
		select 'Preencha o campo de Qunatidade de filhos' as Resposta3;
		leave main;
		end if;

		if(SALARIO = null) then
		select 'Preencha o campo salário' as Resposta4;
		leave main;
		end if;
		if(nome = '') then
		select 'Preencha o campo nome' as Resposta1;
		leave main;
		end if;

		if(Sobrenome = '') then
		select 'Preencha o campo sobrenome' as Resposta2;
		leave main;
		end if;
		if(QTD_FILHOS = '') then
		select 'Preencha o campo de Qunatidade de filhos' as Resposta3;
		leave main;
		end if;

		if(SALARIO = '') then
		select 'Preencha o campo salário' as Resposta4;
		leave main;
		end if;

		if(SALARIO < 1045.00) then
		select 'Preencha o campo salário adequadamente, você deve ganhar no mínimo R$ 1.045,00' as Resposta4;
		leave main;
		end if;

		if(Length (nome) < 5) then
		select 'Letras insuficientes, preencha novamente o campo nome' as Resposta5;
		leave main;
		end if;
		if(Length (sobrenome) < 4) then
		select 'Letras insuficientes, preencha novamente o campo sobrenome' as Resposta6;
		leave main;
		end if;

		if(QTD_FILHOS < 0)then
		select 'Quantidade incorreta de filhos' as Resposta7;
		leave main;
		end if;
end $

Delimiter ;
Drop procedure CadFuncionario;

Call cadFuncionario('Gabriel', 'Hilario', 0 , 2500.98);
Call cadFuncionario('Gabriel', 'Hilario', 0 , 1898.98);
select * from Funcionario;

