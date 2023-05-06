use sakila_portugues;

Delimiter $$
create procedure VerValorPG_Cliente (VER int) 
select concat('A venda foi realizada pelo funcionario ', f.primeiro_nome, ' ', f.ultimo_nome, ' de id igual a ', p.funcionario_id, ', e o valor do pagamento de id: ', p.pagamento_id, ' foi de R$ ', p.valor, ', pago pelo cliente ' , c.primeiro_nome, ' ', c.ultimo_nome, ' de id ', p.cliente_id) 
as VerValorPG_Cliente from pagamento p 
join Cliente c 
on c.cliente_id = p.cliente_id 
join Funcionario f 
on p.funcionario_id = f.funcionario_id 
where VER = p.cliente_id;
$$

Delimiter ;

call VerValorPG_Cliente(1);
call VerValorPG_Cliente(2);

select concat(f.primeiro_nome , ' ', f.ultimo_nome) as nomeFuncionario, p.funcionario_id, p.pagamento_id, p.valor, concat(c.primeiro_nome,' ' ,c.ultimo_nome) as nomeCliente, p.cliente_id
from pagamento p 
join Cliente c 
on c.cliente_id = p.cliente_id 
join Funcionario f 
on p.funcionario_id = f.funcionario_id 
where p.cliente_id = 1;
