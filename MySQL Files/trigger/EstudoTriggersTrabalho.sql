create database GabrielKaicon;
use GabrielKaicon;
create table Produto(
id_Produto int not null auto_increment,
nome varchar(70),
valor decimal(10,2),
primary key(id_Produto)
);
insert into Produto(nome, valor) values('Manual PHP', 550.99), ('Manual JAVA', 350.99), ('Livro SQL', 100.00);

create database backup;
use backup;
create table bkpProduto(
id int not null auto_increment,
id_Produto int,
nome varchar(70),
valor decimal(10,2),
newNome varchar(70),
newValor decimal(10,2),
dataU varchar(70),
userU varchar(70),
primary key(id)
);

show triggers;

delimiter $
create trigger AUDITORIA_PROD before update on Produto
for each row
begin
insert into backup.bkpProduto values (null, old.id_produto, old.nome, old.valor, new.nome, new.valor, now(), current_user());
end;
$
delimiter ;

SELECT * FROM GabrielKaicon.PRODUTO;

UPDATE PRODUTO SET VALOR = 110.00 WHERE ID_PRODUTO =3;

SELECT * FROM GabrielKaicon.PRODUTO;
SELECT * FROM backup.bkpProduto;


