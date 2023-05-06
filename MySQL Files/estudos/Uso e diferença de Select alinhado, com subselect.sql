# Subselect = é um termo para falar de selects feitos dentro de um select

select * from livro l 
where l.preco = (select min(preco) from livro);

# Select alinhado = é um termo para falar de 1 select que teria vários "selects" dentro dele

#select alinhado com subconsulta

select a.nome, l.titulo, min(l.preco) from livro l, autor a, escreve e 
where a.idautor = e.idautor and l.idLivro = e.idLivro and l.preco = (select min(l.preco) from livro l);

select min(l.preco) from livro l;
select * from livro where preco = 23.5;
select * from livro l where l.preco = (select min(l.preco) from livro l);


