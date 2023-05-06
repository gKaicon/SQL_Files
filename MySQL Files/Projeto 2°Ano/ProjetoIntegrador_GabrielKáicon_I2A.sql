use ProjetoIntegrador;

SET SQL_SAFE_UPDATES=0; #desativar

# drop das tabelas - apaga a tabela
# truncate das tabelas - limpa a tabela toda
# select de Todas as Tabelas

show tables;

truncate table ItensVenda;
drop table ItensVenda;
Select * from ItensVenda;

truncate table ItensCompra;
drop table ItensCompra;
Select * from ItensCompra;

truncate table Venda;
drop table Venda;
Select * from Venda;

truncate table Compra;
drop table Compra;
Select * from Compra;

truncate table Funcionario;
drop table Funcionario;
Select * from Funcionario;

truncate table Cliente;
drop table Cliente;
Select * from Cliente;

truncate table Produto;
drop table Produto;
Select * from Produto;

truncate table Fornecedor;
drop table Fornecedor;
Select * from Fornecedor;

delimiter $$
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


#inserts das tabelas
Insert into Cliente (id_Cliente, nome, idade, endereco, telefone) values
	(null, 'Maria Flor da Silva', 30,'Rua A', '889876542'), 
	(null, 'Maria Flor da Silva', 30,'Rua A', '889876542'),
    (null, 'Ana Júlia de Souza', 32, 'Rua Ismael da Silva Júnior', '31978765431'),
	(null, 'Maria Helena', 30, 'Rua Doutor Sebastião de Lima', '31988765211'),
	(null, 'Ana Laura da Silva', 27, 'Rua Marcelo Bernardini', '31988765435'),
	(null, 'Maria Isis dos Santos', 42, 'Rua Sargento Iguatemi Azevedo', '31988732432'),
	(null, 'Ana Lívia Soares', 30, 'Rua Padre Herreiro', '31988765987'),
	(null, 'Maria Júlia da Silva', 45, 'Rua José Matias de Araújo', '31988765421'),
	(null, 'Ana Luiza de Souza', 20, 'Praça João Bosco Penido Burnier', '31998765432'),
	(null, 'Maria Laura de Souza', 30, 'Rua Guiné',	'3198870967'),    
	(null, 'Ana Sofia de Souza', 50, 'Rua Antonio Jose Parra Primeiro', '31988765687'),
	(null, 'Maria Luiza Soares', 30, 'Rua Reinaldo Pereira', '319887632187'),
	(null, 'Ana Vitória Soares', 30, 'Rua Paulo Adorno', '31988766547'),
	(null, 'Maria Sophia Soares', 47, 'Rua Mestre',	'31988761432'),
	(null, 'Maria Alice da Silva', 40, 'Praça Monsenhor Escrivá', '31988765079'),
	(null, 'Maria Valentina da Silva', 45, 'Rua Brás Cardoso',	'31988765763'),
	(null, 'Maria Cecília de Souza', 32, 'Rua Chacorore', '319887656321'),
	(null, 'Maria Vitória Santos', 47, 'Avenida Vinte e Quatro de Fevereiro', '31988764635'),
	(null, 'Pilar de Almeida Santos', 30, 'Rua Teixeira e Sousa', '31988765984'),
	(null, 'Açucena Soares', 30, 'Rua Aldo Manucio', '31988765687'),
	(null, 'Augusta da Silva', 30, 'Rua Justino Rodrigues da Conceição', '31987649876'),
	(null, 'Coralina da Silva', 47, 'Praça Kant', '319876532543'),	
    (null, 'Hortensia da Silva', 37, 'Beco das Flores', '31988765432'),
	(null, 'Martina da Silva', 47, 'Travessa Valongo',	'31988765687'),
	(null, 'Adele Aguiar da Silva', 46, 'Rua Carvalho de Freitas', '31988765687'),
	(null, 'Ayla da Silva Santos', 47, 'Rua João Cariani', '31988765321'),
	(null, 'Dora da Silva Pereira', 43, 'Avenida Águia de Haia', '31988762437'),
	(null, 'Iolanda da Silva Monteiro', 47, 'Rua Renato Pereira', '31987765687'),
	(null, 'Matilda da Silva Araujo', 56, 'Rua Natalina Roque Estefani', '31988769877'),
	(null, 'Ramona de Souza', 21, 'Rua Hiran Pinto da Silva',	'3198873287'),
	(null, 'Agnes  Soares Oliveira', 33, 'Rua Sargento Feliz Marqueti', '31982543211'),
	(null, 'Benedita Soares Dos Santos', 37, 'Rua Belchior de Melo', '319987765622'),
	(null, 'Eleonara Dara Silva', 19, 'Rua Heliodoro de Paiva', '31977874687'),
	(null, 'Julieta de Souza', 47, 'Rua Cinco de Outubro', '31988756321'),
	(null, 'Melinda Aguiar Silva', 32, 'Travessa Luí­s Ellmerich', '31988760967'),
	(null, 'Serena Soares', 47, 'Rua Olavo Leite', '31987995687'),
	(null, 'Alegra Aguiar', 67, 'Rua George Raiger', '31988765546')	,
	(null, 'Betina da Silva', 47, 'Rua Olímpio Brás de Sousa', '319887650782')	,
	(null, 'Esperança da Silva', 47, 'Praça Bauxita', '31988745687'),
	(null, 'Lia Lins', 30, 'Rua Iná', '31988777685'),
	(null, 'Mia Kaliman', 43, 'Rua Professora Aparecida Relvas', '31988765548'),
	(null, 'Tarsila Almeida', 32, 'Rua Hermilo Alves', '31988743287'),
	(null, 'Allana da Silva', 43, 'Rua Real Grandeza',	'31988465687'),
	(null, 'Branca Barroso',32, 'Rua Sitiantes', '31978765687'),
	(null, 'Linda Carla', 42, 'Rua Margarida Zingg', '31980965687'),
	(null, 'Micaela da Silva', 34, 'Rua Pirai do Norte', '31988765097'),
	(null, 'Teodora', 65, 'Rua Beira Rio Particular', '31997764687'),
	(null, 'Amélia Aguiar', 43, 'Estrada da Biacica', '31998765687'),
	(null, 'Caetana Aguiar', 39, 'Rua Manilha', '31999765687'),
	(null, 'Felipa da Silva', 38, 'Rua Caçador Narciso', '31987765687')	,
	(null, 'Naomi Tomigawa', 43, 'Rua Alexandre Davidenko', '31988798767');

insert into Funcionario (id_Funcionario, nome, idade,endereco, telefone) values
	(null, ' Fernando Henrique Mafra ', 19 , ' Rua Germano Vítor dos Santos ', '33998781234'),
	(null, ' Wesley Pereira', 20,' Rua Glucínio ', '33978983241'),
	(null, ' Luiz Pereira Santos',25 ,' Rua Nelson Ferreira ', '33978987890'),
	(null, ' Raphael Gonçalves Dias',27, ' Rua Clodomiro Pinheiro ', ' 33978995432'),
	(null, ' Charlles Xavier Kaylle', 28,' Travessa Jaime Eustáquio Pacheco ', ' 33987984325'),
	(null, ' Flavio Puff de Souza',27 ,' Rua Padre Ângelo Gioielli ', ' 33987974343'),
	(null, ' José Roberto da Cruz Santos', 27,' Rua Casa da Boavista ', '33979885454 '),
	(null, ' Marcos Moura da Silva',26 ,' Rua Dominique Lagru ', ' 33989773232'),
	(null, ' Bruno Henrique Pereira', 25,' Rua Nova Olinda do Norte ', '33978992234 '),
	(null, ' Bruno Eduardo Medeiros', 24,' Viaduto Guadalajara ', '33998794432 '),
	(null, ' Fabiano Moreira Vieira', 23,' Rua David Fabricius ', '33978948543'),
	(null, ' Yves da Rocha Carvalho',21 , 'Rua Doutor Americano', '339879854323 '),
	(null, ' Elias de Souza Neto', 21 ,' Viela Eurides da Silva Carvalho ', ' 33987974235'),
	(null, ' Estevão Bragança Filho', 31,' Praça Monteiro Lobato ', ' 33978987856'),
	(null, ' Matheus Pereira Aleixo', 32,' Rua Paolo Porpora ', ' 33978977834'),
	(null, ' Mateus Bicalho Santos', 21,' Rua Rubens Mascarenhas ', '33979870980 '),
	(null, ' Dayvidson Reis do Santos',19 ,' Travessa Bom Jesus do Norte ', ' 33987970956'),
	(null, ' Deivison Rodrigues de Almeida',14, ' Travessa Quatro de Setembro ', ' 33978978745'),
	(null, ' Erique Marcos Dos Santos', 16,' Rua Paulo Bastide ', ' 33978980995'),
	(null, ' Erick Paula Gonçalves', 17,' Rua Angélicas ', '33987980962'),
	(null, ' Weslei Silva Pereira',18 ,' Rua Emí­lio Retrosi ', ' 33978972113'),
	(null, ' Bruno Gomes Filho',33 ,' Praça Antônio Pereira Martins ', ' 33978982143'),
	(null, ' Igor de Oliveira Soares', 22,' Rua Acioli Monteiro ', '33987978721'),
	(null, ' Victor Barreto Santos', 21 ,' Rua Manuel Teles Vitancos ', '33987890987'),
	(null, ' Clésio Adriano de Souza', 34,' Rua Antônio Mariani ', '339 78971234'),
	(null, ' Kalvin Belson Carvalho', 19,' Rua Tiburno' , ' 33978987645'),
	(null, ' Andre dos Santos Coelho',32 ,' Avenida João Barreto de Menezes ', ' 33987972456'),
	(null, ' Jeison dos Santos Coelho', 36,' Praça João Paulo Meira ', ' 33987872143'),
	(null, ' Luciano Alves Almeida', 34,' Rua Valdomiro Urbani ', ' 33978981243'),
	(null, ' Julia Aparecida Medeiros Pinto',38 ,' Rua Otací­lio Gomes ', ' 33987972154'),
	(null, ' Laiane Braga Santos', 39,'Travessa Tres Pingos Dagua', ' 339878943'),
	(null, ' Lara Rabello de Souza',21 ,' Rua Galatea ', '3398789343 '),
	(null, ' Laís Cristina Vieira',19 ,' Rua Chaguaramas ', ' 33978983423'),
	(null, ' Vanessa Souza Almeida', 18,' Rua Cravo do Campo ', ' 33998792334'),
	(null, ' Mariana Kelly',34 ,' Praça Madre Maria Josefina Villac ', ' 33999872331'),
	(null, ' Mikelle Mariano', 22,' Rua Soldado José Reymão ', ' 33998760989'),
	(null, ' Kelly dos Santos Silva',23, ' Rua Banana-Branca ', ' 33998676543'),
	(null, ' Mikaela Victoria', 24, 'Rua das Flores ',' 339899763421'),
	(null, ' Mara Vivian ', 26,' Rua Itacaranha ', ' 33998793245'),
	(null, ' Josiele Batista Cruz',23 ,' Rua Hercí­lio Luz ', ' 33987965434'),
	(null, ' Ariane Chaves Bento', 21,' Rua Comendador Assad Abdalla ', ' 33998762354'),
	(null, ' Ariana Victoria Santos',25, ' Rua Ouro Verde ', ' 339987674323'),
	(null, ' Erica da SIlva',25 ,' Rua Xororó ', '33989766576 '),
	(null, ' Ana Beatriz Teixeira',22 ,' Rua John Redford ', '33988972345'),
	(null, ' Maria Eduarda dos Anjos', 21,' Avenida Nazaré ', ' 339897684578'),
	(null, ' Ana Cecília Lopes',20, ' Avenida Adelino Jorge Montenegro', '33998768765 '),
	(null, ' Maria Fernanda Aguilar',32 ,' Rua Rynaldo Borgianni ', ' 339869756'),
	(null, ' Ana Clara Monteiro Santos',19 ,' Rua Arvore da Cera ', ' 33998760976');

Insert into Fornecedor (id_Fornecedor, nome, endereco, telefone) values
	(null, 'Maria Irene da Silva', 'Avenida 1º de Junho', '31987565432'),
	(null, 'Marcelo José da Costa', 'Praça Ocupação', '11986549302'),
	(null, 'Gabriel Káicon Ferreira', 'Rua da Independência','21986547389'),
	(null, 'Joslaine Cristina Costa', 'Rua Rosária Ana Barbosa', '11986546574'),
	(null, 'Neuza Maria Da Silva', 'Travessa Rio Tarauacá', '11986548374'),
	(null, 'Claudio Cruz dos Santos', 'Rua José Branco', '37976540192'),
	(null, 'João Pedro Almeida', 'Rua Virgí­lio Manente', '43976546534'),
	(null, 'João Eduardo Carvalho', 'Rua Sardoá', '35986540987'),
	(null, 'João Emanuell Figueiredo Batista', 'Avenida Carini', '34996548709'),
	(null, 'João Gabriel da Costa', 'Rua Luís Morales', '34986540896'),
	(null, 'João Carlos Almeida da Silva', 'Praça Estrela do Norte', '34986549876'),
	(null, 'João Paulo da Silva', 'Rua Alvaro Martins Sevilha', '34986549876'),
	(null, 'João Victor Almeida da Silva', 'Rua Ribeirão Pires', '11996548756'),
	(null, 'João Borges Carvalho da Silva', 'Rua César Aretusi', '11986547645'),
	(null, 'João Marcos da Silva', 'Rua Frauenfeld', '219965465443'),
	(null, 'João Batista ', 'Rua Carlos Reis', '12986546534'),
	(null, 'João Bosco Carvalho', 'Rua Tomás de Santa Maria', '21976546436'),
	(null, 'João Evangelista dos Santos', 'Travessa do Fado','27986543546'),
	(null, 'João Antônio Almeida da Silva', 'Rua Cesare Badiali'	, '51996545463'),
	(null, 'João Gonçalves Almeida', 'Rua Jales Rodrigues Silva', '51986543456'),
	(null, 'João Marcelo Carvalho', 'Rua Henrique Jorge Guedes','21996546543'),
	(null, 'João Márcio Carvalho', 'Rua Charles Naufal'	,'24996545432'),
	(null, 'José Carlos Almeida', 'Rua Sinfonia Escocesa', '24986543241'),
	(null, 'José Eustáquio Almeida', 'Avenida Wando Henrique Cardim','24986543214'),
	(null, 'José Pedro Almeida', 'Praça Benjamim', '33976546789'),
	(null, 'José Paulo da Silva', 'Sargento Benevides Valente Montes', '33976549876'),
	(null, 'José Batista dos Santos', 'Rua Guilherme Studart', '51976549876'),
	(null, 'José Maria da Silva', 'Rua Francisco Cordeiro Lavaredas', '42976548796'),
	(null, 'José Bicalho Carvalho dos Santos','Rua X' , '42986548796'),
	(null, 'José Victor Carvalho da Silva', 'Rua Henrique Gomes de Brito', '45986549807'),
	(null, 'Gabriel Campos Almeida', 'Rua Marques Ribeiro', '45996540798'),
	(null, 'Alberto dos Reis Alves', 'Praça Amélia Terezinha', '75986549687'),
	(null, 'José Antônio Carellos', 'Rua Lua', '75976548576'),
	(null, 'José Geraldo Pinho', 'Travessa Fantasia Cromática', '33986547465'),
	(null, 'Geraldo da Silva Oliveira', 'Praça Virgí­lio Lúcio', '33986546354'),
	(null, 'Carlos Eduardo Carvalho', 'Rua Verão Vermelho', '75996545243'),
	(null, 'Pedro Henrique Moreira', 'Rua Anael', '75986541432'),
	(null, 'Paulo Henrique Almeida Silva', 'Avenida Doutor Mário Rodrigues', '33986544321'),
	(null, 'Pedro Gabriel Almeida', 'Rua Doutor Ibsen da Costa Manso', '33986545432'),
	(null, 'Paulo dos Santos Silva', 'Rua Maria Auxiliadora', '33986546544'),
	(null, 'Carlos Eduardo Vieira' , 'Rua Linda Lucotti', '33986546543'),
	(null, 'Douglas Gabriel Almeida', 'Rua João da Silva Moraes', '89986547654'),
	(null, 'Felipe Gabriel Carvalho', 'Rua Júlio Ribeiro Neto', '89986548765'),
	(null, 'Jackson Carvalho', 'Travessa Ângelo Berardi', '89986549876'),
	(null, 'Calebe Rios Oliveira', 'Rua Crio', '61986547890'),
	(null, 'Pablo Pereira', 'Via Marãni', '61986546789'),
	(null, 'Magno Lessa Almeida', 'Rua Margaridas Amarelas', '33986545678'),
	(null, 'Italo Pereira', 'Rua Oscarina Maria de Jesus', '35986546554'),
	(null, 'Dayler Carvalho', 'Via de Pedestre Cerebia'	, '37986545465'),
	(null, 'Rosinei Ferreira Figueiredo', 'Rua Durval de Almeida Santana', '8998654234'),
	(null, 'Dênis Almeida Carvalho', 'Rua Hemisfério', '6196543421');

insert into Produto (id_Produto, id_Fornecedor, nome, precoCusto, precoVenda, unidade) values
(null, 4,'Feijão' ,7.85, 0, 4),
(null, 4,'Arroz' ,17.9, 0, 5),
(null, 3, 'Batata', 6.7,0,160),
(null, 2, 'Batata Inglesa', 7.6,0,160),
(null, 34, 'Cenoura', 5.67,0,150),
(null, 32, 'Cenoura branca', 8.67,0,100),
(null, 23, 'Nabo', 3.67,0,60),
(null, 13, 'Beterraba', 2.67,0,60),
(null, 38, 'Alho', 8.67,0,120),
(null, 41, 'Cebola', 6.67,0,676),
(null, 12, 'Tomate', 4.68,0,100),
(null, 12, 'Maçã', 4.7,0,100),
(null, 11, 'Alho poró', 5.69,0,40),
(null, 1, 'Cebolinha', 4.67,0,210),
(null, 9, 'Jabuticaba', 3.67,0,210),
(null, 10, 'Uva', 9.70,0,432),
(null, 13, 'Pimenta', 8.50,0,670),
(null, 14, 'Pimenta Biquinho', 8.50,0,632),
(null, 43, 'Pimenta Bode', 8.50,0,680),
(null, 32, 'Pimenta Malagueta', 8.50,0,670),
(null, 30, 'Repolho', 7.6,0,30),
(null, 36, 'Repolho Roxo', 7.6,0,20),
(null, 23, 'Cebola Roxa', 7.67,0,21),
(null, 37, 'Laranja Baía', 8.68,0,60),
(null, 19, 'Banana Maçã', 7.68,0,150),
(null, 13, 'Mamão', 8.0,0,30),
(null, 41, 'Manga', 5.60,0,56),
(null, 27, 'Limão', 7.50,0,60),
(null, 23, 'Maçã Argentina', 12.90,0,66),
(null, 21, 'Kiwi', 9.90,0,40),
(null, 31, 'Coco', 11.75,0,40),
(null, 35, 'Figo', 4.50,0,60),
(null, 36, 'Pessêgo', 8.5,0,60),
(null, 39, 'Ameixa', 8.50,0,60),
(null, 39, 'Uva Passas', 6.48,0,600),
(null, 32, 'Chuchu', 6.60,0,10),
(null, 31, 'Inhame', 7.80,0,62),
(null, 31, 'Gondó', 4.5 ,0,80),
(null, 34, 'Couve', 3.50,0,60),
(null, 35, 'Couve-Flor', 5.67,0,50),
(null, 21, 'Berinjela', 8.99,0,6),
(null, 14, 'Pepino', 7.69,0,50),
(null, 18, 'Pepino japonês', 6.51,0,40),
(null, 17, 'Abóbora', 8.43,0,60),
(null, 16, 'Abobrinha', 7.60,0,60),
(null, 15, 'Morango', 16.40,0,600),
(null, 29, 'Muranga', 4.38,0,30),
(null, 32, 'Quiabo', 12.8,0,60),
(null, 5, 'Alface', 2.50,0,621),
(null, 4, 'Batata Doce', 7.79,0,60);
update Produto 
set precoVenda = precoCusto + (precoCusto * 50/100)
where precoVenda = 0;
update Produto 
set unidade = 20000
where unidade = 0;
$$
delimiter ;
#select de Todas as Tabelas para a fácil vizualização dos Inserts
Select * from ItensVenda;
Select * from ItensCompra;
Select * from Venda; 
Select * from Compra;
Select * from Funcionario;
Select * from Cliente;
Select * from Produto;
Select * from Fornecedor;

create database ProjetoIntegrador;
use ProjetoIntegrador;