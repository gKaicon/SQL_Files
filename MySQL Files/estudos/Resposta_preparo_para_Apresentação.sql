use projeto_distribuidora_vlfh;

# 1. NOME DO FUNCIONARIO E TODOS OS ITENS QUE ELE JÁ VENDEU.
Select v.id_Funcionario, f.nome, v.id_Venda, i.id_ItensVenda, i.id_Produto, p.nome from Funcionario f, venda v, itensVenda i, produto p
where f.id_Funcionario = v.id_Funcionario and v.id_Venda = i.id_Venda and i.id_Produto = p.id_Produto and v.id_Funcionario = 32;

# 2. NOME DO CLIENTE E OS PRODUTOS COMPRADOS POR ELE.

select * from Cliente c
join venda v 
on v.id_Cliente = c.id_Cliente
join itensVenda i 
on v.id_Venda = i.id_Venda
join produto p 
on i.id_Produto = p.id_Produto
where c.id_cliente = 1;

select * from Cliente c, venda v, itensVenda i, produto p
where v.id_Cliente = c.id_Cliente and v.id_Venda = i.id_Venda and i.id_Produto = p.id_Produto and c.id_cliente = 1;

# 3. PRODUTO MAIS VENDIDO.
select P.ID_PRODUTO, P.NOME, MAX(ITENSVENDA_QTD) from produto p, (select sum(quantidade) AS ITENSVENDA_QTD, id_produto from itensvenda group by id_produto order by sum(quantidade) desc) itensMaisVendidos 
where p.id_produto = itensMaisVendidos.id_produto;

select P.ID_PRODUTO, P.NOME, MAX(ITENSVENDA_QTD) from produto p 
join (select sum(quantidade) AS ITENSVENDA_QTD, id_produto 
	from itensvenda group by id_produto
	order by sum(quantidade) desc) itensMaisVendidos 
on p.id_produto = itensMaisVendidos.id_produto;

# 4. GRUPO DOS PRODUTOS QUE MAIS VENDEU.

select p.id_grupo, g.nome, mq.maiorQtd from produto p 
join grupo g 
on g.id_Grupo = p.id_grupo 
join itensVenda i 
on i.id_Produto = p.id_Produto
join (select p.id_produto, count(p.id_Grupo) maiorQtd from produto p join itensVenda i on i.id_Produto = p.id_Produto group by p.id_Grupo order by maiorQtd desc) mq
on mq.id_produto = p.id_produto
having max(mq.maiorQtd);

select p.id_grupo, g.nome, mq.maiorQtd from produto p, grupo g, itensVenda i, (select p.id_produto, count(p.id_Grupo) maiorQtd from produto p join itensVenda i on i.id_Produto = p.id_Produto group by p.id_Grupo order by maiorQtd desc) mq
where g.id_Grupo = p.id_grupo and i.id_Produto = p.id_Produto and mq.id_produto = p.id_produto
having max(mq.maiorQtd);

# 5. NOME DO FORNECEDOR E DO ITEM MAIS COMPRADO.

Select i.id_Produto, p.nome, p.precoCusto, p.id_Fornecedor, f.nome, f.telefone, pi.qtd from Produto p
join fornecedor f
on p.id_fornecedor = f.id_fornecedor
join itensCompra i
on i.id_produto = p.id_produto
join (select id_itensCompra, count(i.id_produto) as qtd from itensCompra i, produto p where i.id_produto = p.id_produto group by p.id_fornecedor order by qtd desc) pi
on pi.id_itensCompra = i.id_itensCompra
having max(pi.qtd);

Select i.id_Produto, p.nome, p.precoCusto, p.id_Fornecedor, f.nome, f.telefone, pi.qtd from Produto p, fornecedor f, itensCompra i,
(select id_itensCompra, count(i.id_produto) as qtd from itensCompra i, produto p where i.id_produto = p.id_produto group by p.id_fornecedor order by qtd desc) pi
where p.id_fornecedor = f.id_fornecedor and i.id_produto = p.id_produto and pi.id_itensCompra = i.id_itensCompra
having max(pi.qtd);

# 7. CONSULTA QUE MOSTRA AS COMPRAS DE UM FORNECEDOR ESPECÍFICO, JUNTAMENTE COM AS INFORMAÇÕES DO FUNCIONARIO RESPONSÁVEL, E OS PRODUTOS COMPRADOS

select c.id_Compra, f.nome as Fornecedor, fu.nome as Funcionaro, iC.id_Produto, pp.nome, c.dataCompra from Compra c
join Fornecedor f
on c.id_Fornecedor = f.id_Fornecedor
join itensCompra iC
on c.id_Compra = iC.id_Compra
join Produto pp
on pp.id_Produto = iC.id_Produto
join Funcionario fu
on fu.id_Funcionario = c.id_Funcionario
where c.id_Fornecedor like 32;

select c.id_Compra, f.nome as Fornecedor, fu.nome as Funcionaro, iC.id_Produto, pp.nome, c.dataCompra from Compra c, Produto pp, Funcionario fu, itensCompra iC, Fornecedor f
where c.id_Fornecedor = f.id_Fornecedor and c.id_Compra = iC.id_Compra and pp.id_Produto = iC.id_Produto and fu.id_Funcionario = c.id_Funcionario and
c.id_Fornecedor like 32;

# 8. MOSTRAR A VENDA EM QUE FOI VENDIDO PRODUTOS DE ID = 8, E QUAIS SÃO OS CLIENTES QUE O COMPRARAM

SELECT  v.id_Venda, c.id_Cliente, c.nome, p.nome, i.quantidade, v.dataVenda from  Venda v
join itensVenda i
on v.id_Venda = i.id_Venda
join Cliente c
on c.id_Cliente = v.id_Cliente
join Produto p
on i.id_Produto = p.id_Produto
where i.id_Produto = 8;

SELECT v.id_Venda, c.id_Cliente, c.nome, p.nome, i.quantidade, v.dataVenda from  Venda v, itensVenda i, Cliente c, Produto p
WHERE v.id_Venda = i.id_Venda AND c.id_Cliente = v.id_Cliente AND i.id_Produto = p.id_Produto AND i.id_Produto = 8;

# 9. MOSTRAR OS PRODUTOS E AS INFORMAÇÕES DOS SEUS RESPECTIVOS FORNECEDORES

Select id_Produto, p.nome, p.precoCusto, p.id_Fornecedor, f.nome, f.telefone from Produto p, fornecedor f 
where p.id_fornecedor = f.id_fornecedor;

# 10. CLIENTE COM MAIOR IDADE
select * from Cliente where idade = (select max(idade) from Cliente);

# 11. O NOME DO CLIENTE QUE MAIS COMPROU

select v.id_Cliente, c.nome, cmc.cont from venda v
join cliente c 
on c.id_Cliente = v.id_Cliente 
join (select id_Venda, id_cliente, count(id_cliente) as cont from venda group by id_Cliente order by cont desc) as cmc
on (v.id_venda = cmc.id_Venda and cmc.id_Cliente = v.id_Cliente) 
having max(cmc.cont);

select v.id_Venda, v.id_Cliente, c.nome, cmc.cont from venda v, cliente c, (select id_Venda, id_cliente, count(id_cliente) as cont from venda group by id_Cliente order by cont desc) as cmc
where v.id_venda = cmc.id_Venda and cmc.id_Cliente = v.id_Cliente and c.id_Cliente = v.id_Cliente 
having max(cmc.cont);