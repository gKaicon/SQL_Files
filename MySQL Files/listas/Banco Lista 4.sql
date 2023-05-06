 delimiter $
 create database if not exists lista4;
 use lista4;

 create table Cliente(
	 idCliente int not null auto_increment,
	 nome varchar(35) not null,
	 endereco varchar(35) not null,
	 cidade varchar(35) not null,
	 cep int(8) default null,
	 uf varchar(2) not null,
	 cnpj varchar(16),
	 ie int(4) default null,
	 primary key(idCliente)  
 );
insert into cliente(idCliente, nome, endereco, cidade, cep, uf, cnpj, ie) values 
	(720,'Ana','Rua 17, n°19','Niterói',24358310,'RJ','12113231/0001-34', 2134),
    (870,'Flávio','Av. Pres. Vargas n°10','São Paulo', 2276391,'SP','22534126/9387-9', 4631),
    (110,'Jorge','Rua Calapo 13','Curitiba',30078500,'PR','14512764/9834-9', null),
    (222,'Lúcia','Rua Itabira 123 Loja 9','Belo Horizonte', 22124391,'MG','28315213/9348-8', 2985),
    (830,'Maurício','Av. Paulista 1236 sl 2345','São Paulo', 3012683,'SP','32816985/7465-6',9343),
    (130,'Edmar','Rua da Prata sn','Salvador',30079300 ,'BA','23463284/234-9', 7121),
    (410,'Rodolfo','Largo da lapa 27 sobrado','Rio de Janiero',30078900, 'RJ','12835128/2346-9', 7431),
    (20,'Beth','Av. Climério','São Paulo', 25679300,'SP','32485126/7326-8', 9280),
    (157,'Paulo','Tv.Moraes c/3','Londrina', null, 'PR','32848223/324-2', 1923),
    (180,'Lívio','Av. Beira Mar n.1256','Florianopólis', 30077500, 'SC','12736571/2347-4', null),
    (260,'Susana','Rua Lopes Mendes 12','Niterói', 30046500, 'RJ','21763571/232-9', 2530),
    (290,'Renato','Rua Meireles 123 bl.2 sl. 345','São Paulo', 30225900, 'SP','13276571/1231-4', 1820),
    (390,'Sebastião','Rua da Igreja 10','Uberaba', 30438700, 'MG','32176547/213-3', 9071),
    (234,'José','Quadra 3 bl.3 sl. 1003','Brasília', 22841650, 'DF','21763576/1232-3', 2931);
 
 create table Vendedores(
	 idVendedor int not null auto_increment,
	 nome varchar(35) not null,
	 salariofx decimal(10,2) not null,
	 faixaComissao varchar(1),
	 primary key(idVendedor)
 );
 insert into Vendedores(idVendedor, nome, salariofx, faixaComissao) values
	 (209, 'José', 1800.00,'C'),
	 (111, 'Carlos', 2490.00,'A'),
	 (011, 'João', 2780.00,'C'),
	 (240, 'Antônio', 9500.00,'C'),
	 (720, 'Felipe', 4600.00,'A'),
	 (213, 'Jonas', 2300.00,'A'),
	 (101, 'João H.', 2650.00,'C'),
	 (310, 'Josías',870,'B'),
	 (250, 'Maurício',2930.00,'B');
 
 create table Produto(
	 idProduto int not null auto_increment,
	 unidade varchar(4) not null, 
	 descricao varchar(30), 
	 valorUni decimal(10,2),
	 primary key(idProduto)
 );
 insert into Produto(idProduto, unidade, descricao, valorUni) values
	 (25,'KG','Queijo',0.97),
	 (31,'BAR','Chocolate',0.87),
	 (78,'L','Vinho',2),
	 (22,'M','Linho',.11),
	 (30,'SAC','Açúcar',0.3),
	 (53,'M','Linha',1.8),
	 (13,'G','Ouro',6.18),
	 (45,'M','Madeira',0.25),
	 (87,'M','Cano',1.97),
	 (77,'M','Papel',1.05);
 
 create table Pedido(
	 idPedido int not null auto_increment,
	 prazoEntrega int(2) not null,
	 idCliente int not null,
	 idVendedor int not null,
	 primary key(idPedido),
	 foreign key (idCliente) references Cliente(idCliente),
	 foreign key (idVendedor) references Vendedores(idVendedor)
 );
  insert into Pedido(idPedido, prazoEntrega, idCliente, idVendedor)values
	 (121,20,410,209),
	 (97,20,720,101),
	 (101,15,720,101),
	 (137,20,720,720),
	 (148,20,720,101),
	 (189,15,870,213),
	 (104,30,110,101),
	 (203,30,830,250),
	 (98,20,410,209),
	 (143,30,20,111),
	 (105,15,180,240),
	 (111,20,260,240),
	 (103,20,260,11),
	 (91,20,260,11),
	 (138,20,260,11),
	 (108,15,290,310),
	 (119,30,390,250),
	 (127,10,410,11);
	 
 create table ItemPedido(
	 idPedido int not null,
	 idProduto int not null,
	 qntd int not null,
	 foreign key(idPedido)references Pedido(idPedido),
	 foreign key(idProduto)references Produto(idProduto)
 );
 insert into ItemPedido(idPedido, idProduto,qntd)values
	 (121,25,10),
	 (121,31,35),
	 (97,77,20),
	 (101,31,9),
	 (101,78,18),
	 (101,13,5),
	 (98,77,5),
	 (148,45,8),
	 (148,31,7),
	 (148,77,3),
	 (148,25,10),
	 (148,78,30),
	 (104,53,32),
	 (203,31,6),
	 (189,78,45),
	 (143,31,20),
	 (143,78,10),
	 (105,78,10),
	 (111,25,10),
	 (111,78,70),
	 (103,53,37),
	 (91,77,40),
	 (138,22,10),
	 (138,77,35),
	 (138,53,18),
	 (108,13,17),
	 (119,77,40),
	 (119,13,6),
	 (119,22,10),
	 (119,53,43),
	 (137,13,8);
$
delimiter ;

select * from cliente;
select * from vendedores;
select * from produto;
select * from pedido;
select * from itempedido;

#1.Listar todos os produtos com as respectivas descrições, unidades e valores unitários, obtendo o seguinte resultado 
# (SELECT simples sem WHERE, mas com especificação de todos os campos):
	select descricao as Descrição, unidade, valorUni as 'Valor Unitário' from produto;

#2. Listar da tabela CLIENTE o CNPJ, o nome do cliente e seu endereço, obtendo o seguinte resultado (idem com especificação de parte dos campos):
	select CNPJ, nome as 'Nome do Cliente', endereco as Endereço from Cliente;

#3. Listar todo o conteúdo de vendedor, obtendo o seguinte resultado (SELECT sem a especificação de campos - dica: coringa *):
	select * from Vendedores;

#4. Problema: Listar o numero do pedido, o código do produto e a quantidade dos itens do pedido com a quantidade igual a 35 da tabela item de pedido, 
# obtendo o seguinte resultado (dica: SELECT com WHERE):
	select idPedido as 'Número do Pedido', idProduto as 'Código do Produto', qntd from itemPedido where qntd = 35;

#5. Quais são os clientes que moram em Niterói?
	select nome as 'Nome do Cliente' from Cliente where cidade like 'Niterói';

#6. Listar os produtos que tenham unidade igual a ‘M’ e valor unitário igual a R$ 1,05 da tabela produto, obtendo o seguinte resultado (operadores lógicos):
	select descricao as 'Descrição do Produto' from Produto where valorUni = 1.05 and unidade like 'M';

#7. Listar o código e a descrição dos produtos que tenham o valor unitário na faixa de R$ 0,32 até R$ 2,00, obtendo o seguinte resultado (operador between):
	select idProduto as 'Código do Produto', descricao as Descrição from produto where (ValorUni between 0.32 and 2.00);

#8. Listar todos os produtos que tenham o seu nome começando por Q, obtendo o seguinte resultado (operador LIKE, com os coringas _ - um caractere - e % - vários caracteres):
	select idProduto as 'Código do Produto', descricao as Descrição from produto where descricao like 'Q%';
    
#9. Listar os vendedores que não começam por ‘Jo’, , obtendo o seguinte resultado (operador LIKE, com os coringas _ - um caractere - e % - vários caracteres):
	select idVendedor as 'Código do Vendedor', nome as 'Nome do Vendedor' from Vendedores where nome not like 'Jo%';

#10. Mostrar os clientes que não tenham inscrição estadual, obtendo o seguinte resultado (IS NULL):
	select * from cliente where ie is null;
    
#11. Mostrar em ordem alfabética a lista de vendedores e seus respectivos salários fixos, obtendo o seguinte resultado (ORDER BY [ASC/DESC]):
	select nome as 'Nome do Vendedor', salariofx as 'Salário Fixo' from vendedores order by nome asc;
    
#12. Listar os nomes, cidades e estados de todos os clientes, ordenados por estado e cidade de forma descendente, obtendo o seguinte resultado 
# (operador ORDER BY com mais de um campo especificado):
	select nome as 'Nome do Cliente', Cidade, UF from Cliente order by uf desc, cidade desc;
    
#13. Mostrar a descrição e o valor unitário de todos os produtos que tenham a unidade ‘KG’, em ordem de valor unitário ascendente, obtendo o seguinte resultado (ORDER BY):
#entrada correta de acordo com o enunciado
    select descricao as Descrição, valorUni as 'Valor Unitário' from Produto where unidade like 'KG' order by valorUni asc;
#entrada correta de acordo com a resposta
    select descricao as Descrição, valorUni as 'Valor Unitário' from Produto where unidade like 'M' order by valorUni asc;
    
#14. Mostrar o novo salário fixo dos vendedores, de faixa de comissão ‘C’, calculado com base no reajuste de 75% acrescido de R$ 120,00 de bonificação. 
# Ordenar pelo nome do vendedor, obtendo o seguinte resultado (coluna calculada):
	Update Vendedores
	set salarioFX = (salarioFX + (salarioFX * 0.75) + 120)
	where faixaComissao like 'C';
	Select nome as 'Nome do Vendedor', salariofx as 'Salário Fixo' from Vendedores where faixaComissao like 'C' order by nome asc;
    
#15. Mostrar o menor e o maior salários da tabela vendedores, obtendo o seguinte resultado (funções MAX() e MIN()):
	select MAX(salariofx) as 'Maior salário', MIN(salariofx) as 'Menor salário' from vendedores;
    
#16. Mostrar a quantidade total pedida para o produto ‘VINHO’ de código ‘78’ na tabela item de pedido, obtendo o seguinte resultado (função SUM() com cláusula WHERE):
	select SUM(i.qntd) from itemPedido i, produto p where p.idProduto = i.idProduto and p.descricao like 'Vinho' and i.idProduto = 78;
    
    select * from Produto;
    select * from itemPedido;
    
#17. Qual a média dos salários fixos dos vendedores (função AVG())?
	select AVG(salariofx) as 'Média de salários' from vendedores;

#18. Quantos vendedores ganham acima de R$ 2.500,00 de salário fixo (função COUNT() com cláusula WHERE)? 
	select count(*) as 'N° de vendedores com salário acima de 2500' from Vendedores where salariofx >= 2500;
    