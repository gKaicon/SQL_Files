

delimiter $
create trigger RegistroUpdateTable
before update on Cliente
for each row
begin
insert into bkpCliente.bkpClienteTable values (null, old.id_Cliente, old.nome, old.idade, old.telefone, old.endereco, new.id_Cliente, new.nome, new.idade, new.telefone, new.endereco, new.valor, now(), current_user());
end; 
$
delimiter ;


show triggers;


create table Cliente(
id_Cliente int not null auto_increment,
nome varchar(70) not null,
idade int not null,
endereco varchar (50)not null,
telefone varchar(12)not null,
primary key(id_Cliente));

create table bkpClienteTable(
id int not null auto_increment,
id_Cliente int not null,
nome varchar(70) not null,
idade int not null,
endereco varchar (50)not null,
telefone varchar(12)not null,
primary key(id_Cliente));


delimiter $
create trigger Backup_Cliente
before insert on Cliente
for each row
begin
insert into bkpCliente.bkpClienteTable(id, id_Cliente, nome, idade, endereco, telefone) values (null, new.id_Cliente, new.nome, new.idade, new.endereco, new.telefone);
end; 
$
delimiter ;

drop trigger Backup_Cliente;

use DataCliente;
use bkpCliente;
select * from bkpClienteTable;

show triggers in DataCliente;

show tables in DataCliente;
show tables in bkpCliente;

show databases;

Insert into Cliente (id_Cliente, nome, idade, endereco, telefone) values (null, 'Maria Flor da Silva', 30,'Rua A', '889876542');
select * from Cliente;

Insert into Cliente (id_Cliente, nome, idade, endereco, telefone) values (null, 'Maria Flor da Silva', 30,'Rua A', '889876542'), (null, 'Maria Flor da Silva', 30,'Rua A', '889876542'), (null, 'Ana Júlia de Souza', 32, 'Rua Ismael da Silva Júnior', '31978765431'),(null, 'Maria Helena', 30, 'Rua Doutor Sebastião de Lima', '31988765211'),	(null, 'Ana Laura da Silva', 27, 'Rua Marcelo Bernardini', '31988765435'),	(null, 'Maria Isis dos Santos', 42, 'Rua Sargento Iguatemi Azevedo', '31988732432'),	(null, 'Ana Lívia Soares', 30, 'Rua Padre Herreiro', '31988765987'),(null, 'Maria Júlia da Silva', 45, 'Rua José Matias de Araújo', '31988765421'),	(null, 'Ana Luiza de Souza', 20, 'Praça João Bosco Penido Burnier', '31998765432'),	(null, 'Maria Laura de Souza', 30, 'Rua Guiné',	'3198870967'),	(null, 'Ana Sofia de Souza', 50, 'Rua Antonio Jose Parra Primeiro', '31988765687'),	(null, 'Maria Luiza Soares', 30, 'Rua Reinaldo Pereira', '319887632187'),	(null, 'Ana Vitória Soares', 30, 'Rua Paulo Adorno', '31988766547'),	(null, 'Maria Sophia Soares', 47, 'Rua Mestre',	'31988761432'),	(null, 'Maria Alice da Silva', 40, 'Praça Monsenhor Escrivá', '31988765079'),	(null, 'Maria Valentina da Silva', 45, 'Rua Brás Cardoso',	'31988765763'),	(null, 'Maria Cecília de Souza', 32, 'Rua Chacorore', '319887656321'),	(null, 'Maria Vitória Santos', 47, 'Avenida Vinte e Quatro de Fevereiro', '31988764635'),	(null, 'Pilar de Almeida Santos', 30, 'Rua Teixeira e Sousa', '31988765984'),	(null, 'Açucena Soares', 30, 'Rua Aldo Manucio', '31988765687'),	(null, 'Augusta da Silva', 30, 'Rua Justino Rodrigues da Conceição', '31987649876'),	(null, 'Coralina da Silva', 47, 'Praça Kant', '319876532543'),	    (null, 'Hortensia da Silva', 37, 'Beco das Flores', '31988765432'),	(null, 'Martina da Silva', 47, 'Travessa Valongo',	'31988765687'),	(null, 'Adele Aguiar da Silva', 46, 'Rua Carvalho de Freitas', '31988765687'),	(null, 'Ayla da Silva Santos', 47, 'Rua João Cariani', '31988765321'),	(null, 'Dora da Silva Pereira', 43, 'Avenida Águia de Haia', '31988762437'),	(null, 'Iolanda da Silva Monteiro', 47, 'Rua Renato Pereira', '31987765687'),	(null, 'Matilda da Silva Araujo', 56, 'Rua Natalina Roque Estefani', '31988769877'),	(null, 'Ramona de Souza', 21, 'Rua Hiran Pinto da Silva',	'3198873287'),	(null, 'Agnes  Soares Oliveira', 33, 'Rua Sargento Feliz Marqueti', '31982543211'),	(null, 'Benedita Soares Dos Santos', 37, 'Rua Belchior de Melo', '319987765622'),	(null, 'Eleonara Dara Silva', 19, 'Rua Heliodoro de Paiva', '31977874687'),	(null, 'Julieta de Souza', 47, 'Rua Cinco de Outubro', '31988756321'),	(null, 'Melinda Aguiar Silva', 32, 'Travessa Luí­s Ellmerich', '31988760967'),	(null, 'Serena Soares', 47, 'Rua Olavo Leite', '31987995687'),	(null, 'Alegra Aguiar', 67, 'Rua George Raiger', '31988765546')	,	(null, 'Betina da Silva', 47, 'Rua Olímpio Brás de Sousa', '319887650782')	,	(null, 'Esperança da Silva', 47, 'Praça Bauxita', '31988745687'),	(null, 'Lia Lins', 30, 'Rua Iná', '31988777685'),	(null, 'Mia Kaliman', 43, 'Rua Professora Aparecida Relvas', '31988765548'),	(null, 'Tarsila Almeida', 32, 'Rua Hermilo Alves', '31988743287'),	(null, 'Allana da Silva', 43, 'Rua Real Grandeza',	'31988465687'),	(null, 'Branca Barroso',32, 'Rua Sitiantes', '31978765687'),	(null, 'Linda Carla', 42, 'Rua Margarida Zingg', '31980965687'),	(null, 'Micaela da Silva', 34, 'Rua Pirai do Norte', '31988765097'),	(null, 'Teodora', 65, 'Rua Beira Rio Particular', '31997764687'),	(null, 'Amélia Aguiar', 43, 'Estrada da Biacica', '31998765687'),	(null, 'Caetana Aguiar', 39, 'Rua Manilha', '31999765687'),	(null, 'Felipa da Silva', 38, 'Rua Caçador Narciso', '31987765687')	,	(null, 'Naomi Tomigawa', 43, 'Rua Alexandre Davidenko', '31988798767')    
    ;
    
SET SQL_SAFE_UPDATES=0;
update Cliente
set idade = 78 where nome like 'Maria Flor da Silva';
