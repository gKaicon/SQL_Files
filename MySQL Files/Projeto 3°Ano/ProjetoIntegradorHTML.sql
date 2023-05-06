use ProjetoIntegradorPHP;
SET SQL_SAFE_UPDATES=0; #desativar
show tables;
# drop - apaga // truncate - limpa

truncate table ItensVenda; drop table ItensVenda; Select * from ItensVenda;
truncate table ItensCompra; drop table ItensCompra; Select * from ItensCompra;
truncate table Venda; drop table Venda; Select * from Venda;
truncate table Compra; drop table Compra; Select * from Compra;
truncate table Funcionario; drop table Funcionario; Select * from Funcionario;
truncate table Cliente; drop table Cliente; Select * from Cliente;
truncate table Produto; drop table Produto; Select * from Produto;
truncate table Fornecedor; drop table Fornecedor; Select * from Fornecedor;

create table Cliente(
id_Cliente int not null auto_increment,
nome varchar(70) not null,
idade int not null,
endereco varchar (50)not null,
telefone varchar(21)not null,
primary key(id_Cliente));
insert into Cliente(nome, idade, endereco, telefone) values('KAli',21,'Rua x','33 98878-8998');

create table Funcionario(
id_Funcionario int not null auto_increment,
nome varchar(70) not null,
idade int not null,
endereco varchar (50)not null,
telefone varchar(21)not null,
primary key(id_Funcionario));

create table fornecedor(
id_Fornecedor int not null auto_increment,
nome varchar(70) not null,
endereco varchar (50)not null,
telefone varchar(21)not null,
primary key(id_Fornecedor) );

create table Produto(
id_Produto int not null auto_increment,
id_Fornecedor int not null,
nome varchar(70) not null, 
precoCusto double not null,
precoVenda double,
unidade int not null ,
primary key(id_Produto),
foreign key(id_Fornecedor) references Fornecedor(id_fornecedor));

create table Compra(
id_Compra int not null  auto_increment,
id_Fornecedor int not null,
id_Funcionario int not null,
dataCompra date,
valorTotal double,
primary key(id_Compra),
foreign key(id_Funcionario) references Funcionario(id_Funcionario),
foreign key(id_Fornecedor) references Fornecedor(id_fornecedor));

create table Venda(
id_Venda int not null  auto_increment,
id_Cliente int not null,
id_Funcionario int not null,
dataVenda date,
valorTotal double,
primary key(id_Venda),
foreign key(id_Funcionario) references Funcionario(id_Funcionario),
foreign key(id_Cliente) references Cliente(id_Cliente));

create table ItensCompra(
id_ItensCompra int not null auto_increment,
id_Compra int not null,
id_Produto int not null,
quantidade int not null,
precoCompra double,
subtotal double,
primary key(id_ItensCompra),
foreign key(id_Compra) references Compra (id_Compra),
foreign key(id_Produto) references Produto(id_Produto));

create table ItensVenda(
id_ItensVenda int not null auto_increment,
id_Venda int not null,
id_Produto int not null,
quantidade int not null,
precoVenda double,
subtotal double,
primary key(id_ItensVenda),
foreign key(id_Venda) references Venda (id_Venda),
foreign key(id_Produto) references Produto(id_Produto));

