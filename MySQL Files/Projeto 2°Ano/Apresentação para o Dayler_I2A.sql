use ProjetoIntegradorD;
SET SQL_SAFE_UPDATES=0; #desativar
SET SQL_SAFE_UPDATES=1; #ativar

###select para apresentar para o dayler

#Consulta que mostra a venda de um Cliente especifico, juntamente com o nome, e os produtos comprados, na data correspondente
select venda.id_Venda, venda.id_Cliente as ID_V_Cliente, cliente.id_Cliente as ID_C_Cliente, 
cliente.nome, iV.id_Produto as ID_IV_Produto , pp.id_Produto as ID_P_Produto, pp.nome, iV.quantidade, venda.dataVenda 
from Venda venda
join Cliente cliente
on venda.id_Cliente = cliente.id_Cliente
join itensVenda iV
on venda.id_Venda = iV.id_Venda
join Produto pp
on pp.id_Produto = iv.id_Produto
where venda.id_Cliente like 16;

#Consulta que mostra as compras de um Fornecedor especifico, juntamente com o Funcionario reponsavel, e os produtos comprados, na data correspondente
select compra.id_Compra, compra.id_Fornecedor as ID_C_Fornecedor, fornecedor.id_Fornecedor as ID_F_Fornecedor, fornecedor.nome as Nome_Fornecedor, 
iC.id_Produto as ID_IC_Produto, pp.id_Produto as ID_P_Produto, pp.nome, funcionario.nome as Nome_Funcionaro, compra.dataCompra
from Compra compra
join Fornecedor fornecedor
on compra.id_Fornecedor = fornecedor.id_Fornecedor
join itensCompra iC
on compra.id_Compra = iC.id_Compra
join Produto pp
on pp.id_Produto = iC.id_Produto
join Funcionario funcionario
on funcionario.id_Funcionario = compra.id_Funcionario
where compra.id_Fornecedor like 32;

#Mostrar a data em que foi vendidos mais produtos de id = 8, que os clientes que o compraram
SELECT  venda.id_Venda ,cliente.id_Cliente, cliente.nome, pp.nome, iV.quantidade, venda.dataVenda from  Venda venda
join itensVenda iV
on venda.id_Venda = iV.id_Venda
join Cliente cliente
on cliente.id_Cliente = venda.id_Cliente
join Produto pp
on iV.id_Produto = pp.id_Produto
where iV.id_Produto like 8
order by quantidade desc;

#sem join

SELECT * from  Venda venda, itensVenda iV, Cliente cliente, Produto pp
WHERE venda.id_Venda = iV.id_Venda AND cliente.id_Cliente = venda.id_Cliente AND iV.id_Produto = pp.id_Produto AND iV.id_Produto like 8
order by quantidade desc;
