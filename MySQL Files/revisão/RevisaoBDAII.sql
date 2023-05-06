Delimiter $$
Create database if not exists RevisaoBDAII;
use RevisaoBDAII;

create table fornecedor(
CnpFor varchar(50) primary key not null,
RazSoc varchar(50),
CodLoc int
);
create table atua(
CnpFor varchar(50),
CodRamAti int
);
create table fornece(
CnpFor varchar(50) not null,
CodProSer int not null
);
create table produtoServico(
CodProSer int primary key not null auto_increment,
NomProSer varchar(50),
ValProSer double
);
create table itemContrato(
NumCon int,
NumIte int primary key not null auto_increment,
CodProSer int,
ValProSer double,
ValTolIte double
);
create table contrato (
NumCon int primary key not null auto_increment,
datini date,
DatPreFim date,
DatFim date,
CnpFor varchar(50),
ValTotCon double
);

create table localidade (
CodLoc int primary key not null auto_increment,
NomLoc Varchar(50),
SigUf varchar(2)
);
create table ramoAtividade(
CodRam int primary key not null auto_increment,
DescRamAtv varchar(50)
);
alter table fornecedor add constraint fkCodLoc foreign key (CodLoc) references localidade(CodLoc);
alter table atua add constraint fkCnpFor foreign key (CnpFor) references Fornecedor(CnpFor);
alter table atua add constraint fkCodRamAti foreign key (CodRamAti) references ramoAtividade(CodRam);
alter table fornece add constraint fkCnpForFornec foreign key (CnpFor) references Fornecedor (CnpFor);
alter table fornece add constraint fkCodProServc foreign key (CodProSer) references produtoServico (CodProSer);
alter table itemContrato add constraint fkNumCon foreign key (NumCon) references contrato (NumCon);
alter table contrato add constraint fkCnpForCon foreign key (CnpFor) references fornecedor(CnpFor);
alter table itemContrato add constraint fkCodProServCont foreign key (CodProSer) references produtoServico(CodProSer);

insert into localidade(CodLoc, NomLoc, SigUf) values 
(default, 'Belo Horizonte', 'MG'),
(default, 'São Paulo', 'SP'), 
(default, 'São João Evangelista', 'MG'),
(default, 'Peçanha', 'MG'), 
(default, 'Guanhães', 'MG'), 
(default, 'Caetés', 'MG'),
(default, 'Entre Rios', 'MG'), 
(default, 'Itabira', 'MG');

insert into ramoAtividade (CodRam, DescRamAtv) values 
(default, 'Material de construção'),
(default, 'Setor alimentício'),
(default, 'Produtos Agrícolas');

insert into fornecedor (CnpFor, RazSoc, CodLoc) values 
('61.142.232/0001-79','Melhore Materiais de contrução LTDA','2'),
('13.563.970/0001-47','João da contrução LTDA','1'), 
('41.533.624/0001-51','Maria alimentos LTDA','3'),
('18.209.870/0001-30','Zé agrotóxicos','5'), 
('91.273.384/0001-71', 'Carlos Fazendeiro LTDA', 1), 
('00.417.762/0001-98', "Produtos Agrícolas de qualidade", 6),
('57.891.023/0001-50', 'Mineiro Construção LTDA', 7), 
('64.910.004/0001-90', 'Química Potente LTDA', 4);

insert into atua (CnpFor, CodRamAti) values 
('61.142.232/0001-79','1'),
('13.563.970/0001-47','1'),
('41.533.624/0001-51','2'),
('18.209.870/0001-30','3'), 
('91.273.384/0001-71', 3);

insert into produtoservico (codproser, nomproser, valproser) values 
(default, 'Parafuso', 1.5), 
(default, 'Saco de cimento', 20.5),
(default, 'Porta', 100), 
(default, 'Trigo', 20), 
(default, 'Leite', 15), 
(default, 'Agrotóxico', 15 ), 
(default, 'Aguarrás', 10.5),
(default, 'Água Sanitária', 10.00), 
(default, 'Sabão em pó', 5.99), 
(default, 'Motoserra', 1500.0), 
(default, 'Caneta', 0.60);

insert into contrato (numcon, datini, datprefim, datfim, CnpFor, valtotcon) values 
(default, '2005-01-10', '2024-01-10', null, '61.142.232/0001-79', 10000),
(default, '1999-05-05', '2024-10-05', null, '41.533.624/0001-51', 30000),
(default, '2000-07-29', '2000-10-01', '2000-10-31', '13.563.970/0001-47', 50000),
(default, '2015-11-09', '2022-10-09', null, '18.209.870/0001-30', 59990),
(default, '2005-01-10', '2024-01-10', null, '13.563.970/0001-47', 30000),
(default, '2010-07-12', '2030-07-12', null, '00.417.762/0001-98', 599999.9), 
(default, '2001-01-01', '2024-01-10', null, '61.142.232/0001-79', 10000),
(default, '2022-01-04', '2023-01-04', null, '64.910.004/0001-90', 500.0);

insert into itemcontrato (numcon, numite, codproser, valproser, valtolite) values 
(1, default, 1, 1.5, 20.5),
(2, default, 4, 20, 500.9),
(3,default,3,100,2000),
(4,default,10,1500,15000.0),
(5,default,7,10.5,105.0), 
(6,default,6,15,200.0), 
(7,default,8,10,1000.9), 
(4, default, 11, 0.60, 120.0);

insert into fornece (cnpfor, codproser) values 
('13.563.970/0001-47', '1'), 
('13.563.970/0001-47', '3'),
('13.563.970/0001-47', '2'), 
('18.209.870/0001-30', '6'), 
('41.533.624/0001-51', '4'),
('41.533.624/0001-51', '5'), 
('00.417.762/0001-98', 6),
('61.142.232/0001-79', 8), 
('18.209.870/0001-30',8), 
('64.910.004/0001-90', 9), 
('13.563.970/0001-47', 11), 
('13.563.970/0001-47', 10);
$$
Delimiter ;


show tables;
select * from produtoservico where nomProSer like '%Parafuso%';

#Selecione o nome dos produtos comuns entre os fornecedores de Entre Rios e de Caetés.
select ps.NomProSer from ProdutoServico ps
inner join fornece fo
on fo.CodProSer = ps.CodProSer
inner join Fornecedor f
on fo.CnpFor = f.CnpFor
inner join Localidade l
on l.CodLoc = f.CodLoc
where (l.NomLoc like 'Entre Rios' and l.NomLoc like 'Caetés') and (fo.CodProSer = ps.CodProSer);

#33. Selecionar a quantidade de fornecedores que são de São Paulo. (Renomear a coluna como ‘QuatidadeFornecedor’.
select count(*) as QuatidadeFornecedor from Fornecedor f 
inner join Localidade l
on l.CodLoc = f.CodLoc
where l.NomLoc like 'São Paulo';

select count(*) as QuatidadeFornecedor from Fornecedor f 
inner join Localidade l
on l.CodLoc = f.CodLoc
where l.SigUF like 'SP';

select * from Fornece;

#Liste, em ordem alfabética, os fornecedores que fornecem o produto 'Água Sanitária' mas que nunca forneceram o produto Sabão em Pó

select f.CnpFor, f.RazSoc from Fornecedor f 
inner join Fornece fo 
on fo.CnpFor = f.CnpFor
inner join produtoServico ps
on ps.CodProSer = fo.CodProSer
where ps.NomProSer like 'Água Sanitária' and ps.NomProSer not like 'Sabão em Pó'
order by f.RazSoc ASC; 
