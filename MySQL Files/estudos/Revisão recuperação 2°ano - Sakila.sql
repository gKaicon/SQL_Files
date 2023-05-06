show tables;

# Contar filmes por gênero

select fc.categoria_id, c.nome, count(fc.categoria_id) from filme_categoria fc, categoria c, filme f
where f.filme_id = fc.filme_id and c.categoria_id = fc.categoria_id
group by categoria_id;

# Mostrar o(s) filme(s) com maior duração

select * from filme where duracao_do_filme = (select max(duracao_do_filme) from filme);

# Mostrar a quantidade de filmes com maior duração

select count(*) from filme where duracao_do_filme = (select max(duracao_do_filme) from filme);

# Mostrar quantidade de filmes com a duração maior que 120

select count(*) from filme where duracao_do_filme > 120;

# Mostrar a quantidade de filmes que um determinado ator participou

select fa.ator_id, a.primeiro_nome, a.ultimo_nome, count(fa.filme_id) from filme_ator fa, ator a, filme f
where fa.ator_id = a.ator_id and fa.filme_id = f.filme_id
group by fa.ator_id;