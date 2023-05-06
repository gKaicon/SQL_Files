use sakila_portugues;
show tables;
select * from categoria;
select * from ator;
select * from filme;
select * from idioma;
select * from filme_categoria;
select * from filme_ator;
select * from Cliente;
Select * from cidade;
select * from pais;
select * from funcionario;
select * from endereco;
select * from loja;
select * from inventario;

Create view viewFilme_Loja as 
select i.filme_id as Inventario_Filme_id, f.filme_id as Filme_id, f.titulo as TituloFilme, i.loja_id as Inventario_Loja_id, 
l.loja_id as Loja_id, l.endereco_id as Loja_Endereço, e.endereco_id as Endereço_id, e.endereco as Endereço from inventario i
join filme f
on f.filme_id = i.filme_id
join loja l
on l.loja_id = i.loja_id
join endereco e
on e.endereco_id = l.endereco_id;
Select * from viewFilme_Loja;

Create view viewCidade_Pais as
select c.cidade as NomeCidade, c.pais_id as PaisIDc, p.pais_id as PaisID, p.pais as NomePais 
from Pais p
join cidade c
on c.pais_id = p.pais_id;
select * from viewCidade_Pais;

create view viewFilmeAtor_Filme as 
select f.Filme_id as filmeID, f.titulo as Titulo_Filme, FA.Filme_id as FAfilmeID, FA.ator_id as FAAtorID, a.ator_id as atorID, a.primeiro_nome as PriNomeAtor, a.ultimo_nome as UltNomeAtor
from filme f
join filme_ator FA
on FA.Filme_id = f.Filme_id
join ator a
on a.ator_id = FA.ator_id;

select filmeID, Titulo_Filme, FAfilmeID, FAAtorID, atorID, PriNomeAtor, UltNomeAtor from viewFilmeAtor_Filme;

create view viewFilmeCategoria_Filme as 
select f.Filme_id as filmeID, f.titulo as Titulo_Filme, FC.Filme_id as FCfilmeID, FC.categoria_id as FCcategoriaID, c.categoria_id as categoriaID, c.nome as nomeCategoria 
from filme f
join filme_categoria FC
on FC.Filme_id = f.Filme_id
join categoria c
on c.categoria_id = FC.categoria_id;

Select filmeID, Titulo_Filme, FCfilmeID, FCcategoriaID, categoriaID, nomeCategoria from viewFilmeCategoria_Filme;


Create view viewFilme_Idioma
as select filme.titulo as Titulo_Filme, filme.idioma_id as ID_IdiomaFilme, idioma.idioma_id as ID_Idioma, idioma.nome as Idioma 
from Filme filme
join idioma idioma
on idioma.idioma_id = filme.idioma_id;

Select Titulo_Filme, ID_IdiomaFilme, ID_Idioma, Idioma from viewfilme_idioma;
