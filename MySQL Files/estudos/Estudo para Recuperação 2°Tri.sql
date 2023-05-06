# Usando a Lista 5 passada no segundo trimestre. Realize as questões abaixo:

show tables;
use lista5;

#1. Nome do autor que tem livro com estoque zerado.
 select a.nome from Autor a, escreve e, livro l 
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and l.estoque = 0;

#2. Nomes dos clientes que compraram o livro "Bichos Monstruosos"

select c.nome from Cliente c, livro l, venda v, itens_da_venda iv
where c.idcliente = v.idcliente and v.idvenda = iv.idvenda and iv.idLivro = l.idlivro and l.titulo like 'Bichos Monstruosos';

select * from Cliente c, livro l, venda v, itens_da_venda iv
where c.idcliente = v.idcliente and v.idvenda = iv.idvenda and iv.idLivro = l.idlivro and l.titulo like 'Bichos Monstruosos';

#4. Qual gênero(s) o cliente "Elaine Luciana" gosta de ler?
select g.descricao from Cliente c, livro l, venda v, itens_da_venda iv, Genero g
where c.idcliente = v.idcliente and v.idvenda = iv.idvenda and iv.idLivro = l.idlivro and g.idgenero = l.idgenero 
and c.nome like 'Elaine Luciana';

select * from Cliente c, livro l, venda v, itens_da_venda iv, Genero g
where c.idcliente = v.idcliente and v.idvenda = iv.idvenda and iv.idLivro = l.idlivro and g.idgenero = l.idgenero 
and c.nome like 'Elaine Luciana';

#5. Quais livros do autor "Maria José Valero" tem em estoque? Pode ter dupla interpretação

 select l.titulo from Autor a, escreve e, livro l 
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and a.nome like 'Maria José Valero' and l.estoque != 0;
 
 select * from Autor a, escreve e, livro l 
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and a.nome like 'Maria José Valero' and l.estoque != 0;
 
 select * from Autor a, escreve e, livro l 
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and a.nome like 'Maria José Valero';

#6. Quais autores venderam 2 ou mais exemplares de seu livro?

select distinct(a.nome) from Autor a, escreve e, livro l, itens_da_venda iv
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and l.idlivro = iv.idlivro and iv.qtd >= 2;

#7. Quantos autores venderam 2 ou mais exemplares de seu livro?

select count(distinct(a.nome)) as 'Qtd de autores com mais de 2 exemplares'  from Autor a, escreve e, livro l, itens_da_venda iv
 where a.idAutor = e.idAutor and l.idlivro = e.idlivro and l.idlivro = iv.idlivro and iv.qtd >= 2;

#8. Qual livro teve o maior quantidade de exemplares vendidos em 1 venda só?

Select l.titulo from livro l, itens_da_venda iv 
where l.idlivro = iv.idlivro and iv.qtd = (select max(qtd) from itens_da_venda);
#9. Qual autor tem o livro mais barato?

select a.nome from Autor a, escreve e, livro l
where a.idAutor = e.idAutor and l.idlivro = e.idlivro and l.preco = (select MIN(preco) from Livro);

#10. Qual a média de preço dos livros de "Medicina" (gênero)?

select avg(l.preco) from livro l, genero g
where g.idgenero = l.idgenero and g.descricao like 'Medicina';

#11. Listar a quantidade de livros por gênero?

Select g.descricao, count(g.idgenero) from livro l, genero g 
where l.idgenero = g.idgenero 
group by l.idgenero;


#12. Mostrar a quantidade de livros com valores entre 23 e 28 reais

Select count(*) from livro where preco between 23 and 28;
select * from Livro;
