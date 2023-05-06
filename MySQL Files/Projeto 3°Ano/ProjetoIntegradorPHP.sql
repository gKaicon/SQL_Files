use ProjetoIntegradorPHP;
show tables;

select * from itenscompra;
Select * from ID_ItensCompra_NomeProduto;

select * from produto;
select * from ID_NomeProduto_nomeFornecedor;

select * from Venda;
select * from Funcionario_Cliente_Venda;

select * from Compra;
select * from Funcionario_Forncedor_Compra;


Delimiter $$
create table Cliente(
id_Cliente int not null auto_increment,
nome varchar(70) not null,
idade int not null,
endereco varchar (50)not null,
telefone varchar(21)not null,
primary key(id_Cliente));
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
precoCusto decimal(10,2) not null,
precoVenda decimal(10,2),
unidade int not null ,
primary key(id_Produto),
foreign key(id_Fornecedor) references Fornecedor(id_fornecedor));
create table Compra(
id_Compra int not null  auto_increment,
id_Fornecedor int not null,
id_Funcionario int not null,
dataCompra varchar(21),
valorTotal decimal(10,2),
primary key(id_Compra),
foreign key(id_Funcionario) references Funcionario(id_Funcionario),
foreign key(id_Fornecedor) references Fornecedor(id_fornecedor));
create table Venda(
id_Venda int not null  auto_increment,
id_Cliente int not null,
id_Funcionario int not null,
dataVenda varchar(21),
valorTotal decimal(10,2),
primary key(id_Venda),
foreign key(id_Funcionario) references Funcionario(id_Funcionario),
foreign key(id_Cliente) references Cliente(id_Cliente));
create table ItensCompra(
id_ItensCompra int not null auto_increment,
id_Compra int not null,
id_Produto int not null,
quantidade int not null,
precoDeCompra decimal(10,2),
subtotal decimal(10,2),
primary key(id_ItensCompra),
foreign key(id_Compra) references Compra (id_Compra),
foreign key(id_Produto) references Produto(id_Produto));
create table ItensVenda(
id_ItensVenda int not null auto_increment,
id_Venda int not null,
id_Produto int not null,
quantidade int not null,
precoDeVenda decimal(10,2),
subtotal decimal(10,2),
primary key(id_ItensVenda),
foreign key(id_Venda) references Venda (id_Venda),
foreign key(id_Produto) references Produto(id_Produto));
create table AuditoriaCompras(
id int not null auto_increment,
idCompra int,
idFornecedor int,
idFuncionario int,
datU varchar(70),
userU varchar(70),
primary key(id)
);
$$

#VIEW 1
delimiter $
create view ID_ItensCompra_NomeProduto as 
select id_ItensCompra, id_Compra, i.id_produto, p.nome, quantidade as Qntd, Subtotal, PrecoDeCompra from ItensCompra i 
join produto p 
on i.id_Produto = p.id_Produto;
$
#VIEW 2
delimiter $
create view ID_NomeProduto_nomeFornecedor as 
select p.id_produto, f.id_fornecedor, f.nome as fornecedor, p.nome, p.precoCusto, p.precoVenda, p.unidade as Qntd from produto p 
join fornecedor f
on f.id_fornecedor= p.id_fornecedor;
$
#VIEW 3
delimiter $
create view Funcionario_Cliente_Venda as
select v.id_venda, v.id_Cliente, c.nome as Cliente, v.id_funcionario, fu.nome as Funcionario, v.dataVenda, v.valorTotal from Venda v
join cliente c
on v.id_Cliente = c.id_Cliente
join funcionario fu
on v.id_Funcionario = fu.id_Funcionario;
$
#VIEW 4
delimiter $
create view Funcionario_Forncedor_Compra as
select c.id_compra, f.id_Fornecedor, f.nome as fornecedor, c.id_funcionario, fu.nome as Funcionario, c.dataCompra, c.valorTotal from Compra c
join Fornecedor f
on f.id_Fornecedor = c.id_Fornecedor
join funcionario fu
on c.id_Funcionario = fu.id_Funcionario;
$
delimiter ;

show triggers;
#Trigger 1
delimiter $$
Create trigger Update_PrecoVenda_Produto before insert
on Produto
for each row
begin
set new.PrecoVenda = new.PrecoCusto + (new.PrecoCusto * 0.50);
END;
$$
delimiter ;
select * from produto;
insert into produto(id_fornecedor, nome, precoCusto, unidade) values(1, "Rapadura Sabor de Minas", 15.90, 60);

#Trigger 2
delimiter $
create trigger AUDITORIA_COMPRAS after INSERT on Compra
for each row
begin
insert into AuditoriaCompras(id, idCompra, idFornecedor, idFuncionario, datU, userU) values (null, new.id_Compra, new.id_fornecedor, 
new.id_funcionario, now(), current_user());
end;
$
delimiter ;

insert into Compra(id_Compra, id_Fornecedor, id_Funcionario, dataCompra, valorTotal) values
(null, 5, 10, '20 01 2010 ', 0 );

select * from Compra;
Select * from AuditoriaCompras;

#Trigger 3
delimiter $
Create trigger Update_Venda before insert on itensvenda for each row
Begin
DECLARE valor FLOAT;
set valor = (SELECT precoVenda from PRODUTO where PRODUTO.ID_PRODUTO = NEW.ID_PRODUTO);
IF (new.precodevenda like 0.00 or new.precodevenda is null) then
set new.precoDeVenda = valor;
END IF;
end;
$
delimiter ;
drop trigger Update_Venda;
insert into itensvenda(id_Venda, id_Produto, quantidade) values (21, 1, 6);
select * from itensvenda;
select * from produto;

#Trigger 4
Delimiter $
Create Trigger Update_Subtotal_ItensVenda before insert on itensvenda
for each row 
begin
set new.Subtotal = new.precoDeVenda * new.quantidade;
end
$
delimiter ;
Drop trigger Update_Subtotal_ItensVenda;
insert into itensvenda(id_Venda, id_Produto, quantidade) values (21, 1, 6);
select * from itensvenda;

#Trigger 5
delimiter $
Create trigger Update_Compra before insert on itensCompra for each row
Begin
DECLARE valor FLOAT;
set valor = (SELECT precoVenda from PRODUTO where PRODUTO.ID_PRODUTO = NEW.ID_PRODUTO);
IF (new.precodecompra like 0.00 or new.precodeCompra is null) then
set new.precoDeCompra = valor;
END IF;
end;
$
delimiter ;
drop trigger Update_Compra;
insert into itenscompra(id_Compra, id_Produto, quantidade) values (21, 1, 6);
select * from itensCompra;
select * from produto;

#Trigger 6
Delimiter $
Create Trigger Update_Subtotal_ItensCompra before insert on itensCompra
for each row 
begin
set new.Subtotal = new.precoDeCompra * new.quantidade;
end
$
delimiter ;
Drop trigger Update_Subtotal_ItensCompra;
insert into itensvenda(id_Venda, id_Produto, quantidade) values (21, 1, 6);
select * from itensCompra;

SET SQL_SAFE_UPDATES=0;

#Procedure 1
create procedure VerProduto_e_Fornecedor(ver int) 
select concat('O produto de nome ','"',p.nome,'"',' é forncedido pelo fornecedor:', f.nome, 'de id: ', p.id_Fornecedor) 
as VerProduto_e_Fornecedor from Produto p 
join Fornecedor f 
on f.id_Fornecedor = p.id_fornecedor
where VER = p.id_Produto;
$
Delimiter ;
Drop procedure VerProduto_e_Fornecedor;
call VerProduto_e_Fornecedor(13);
#Abaixo uma VIEW que faz o mesmo acima, e será usada para provar que está certo
select * from ID_NomeProduto_nomeFornecedor where id_Produto like 13;

#Procedure 2
Delimiter $$
create procedure CadCliente (nome varchar(70), idade int, endereco varchar(50), telefone varchar(21))
Begin
Insert into Cliente (nome, idade, endereco, telefone) values (nome, idade, endereco, telefone);
end;
$$
Delimiter ;
Drop procedure CadCliente;
call CadCliente('Gabriel Hilário', 21 ,'Rua Antônio Pereira','33999876993');
select * from cliente where nome like 'Gabriel%';



#Procedure 3
Delimiter $$
Create procedure atualizaValorTotalCompra(id int)
begin
update Compra c join Itenscompra i on c.id_compra = i.id_Compra
set c.valorTotal = (select sum(i.subtotal) from ItensCompra i where i.id_compra like id)
where id = c.id_Compra;
end;
$$
Delimiter ;
drop procedure atualizaValorTotalCompra;
	#Mostrar o valorTotal da compra de id 3 igual a 0
Select * from Compra where id_Compra = 3;
	#Mostrar os produtos da compra de id 3
Select * from ItensCompra where id_compra = 3;
	#Chamada da procedure para realização do Update
Call atualizaValorTotalCompra(3);
	#Mostrar o valorTotal da compra de id 3 após a soma
Select * from Compra where id_Compra = 3;






#Procedure 4
Delimiter $$
create procedure VerValorPago_ao_Fornecedor (VER int) 
select concat('A Compra foi realizada pelo funcionario ', f.nome,' de id: ', c.id_funcionario, ', e o valor da compra de id: ', 
c.id_compra, ' foi de R$ ', c.valorTotal, ', realizado pelo fornecedor ',fo.nome ,' de id: ', c.id_fornecedor) 
as VerValorPago_ao_Fornecedor from Compra c join Fornecedor fo 
on fo.id_Fornecedor = c.id_Fornecedor
join Funcionario f 
on c.id_funcionario = f.id_funcionario 
where VER = c.id_Compra;
$$
delimiter ;
drop procedure VerValorPago_ao_Fornecedor;
call VerValorPago_ao_Fornecedor(1);


#Pedido certo
Select i.id_ItensVenda, i.id_Venda, i.id_Produto as IDProduto_Em_ItensVenda, p.id_Produto as IDProduto_Em_Produto, p.nome as NomeProd, 
p.precoVenda as precoVenda_em_Prod, i.quantidade, i.precoDeVenda as precoVenda_em_Itens, i.subtotal from itensvenda i  
join Produto p on i.id_Produto = p.id_Produto;

Select i.id_itensVenda, i.id_venda, i.id_Produto as IDProduto_Em_ItensVenda, p.id_Produto as IDProduto_Em_Produto, p.nome as NomeProd from itensvenda i  
join Produto p on i.id_Produto = p.id_Produto where i.id_venda = 2;



