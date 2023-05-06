use sakila;
show tables;

#where = restrição
#order by = organização

select * from  actor a
join actor_info ai
on aI.actor_id = a.actor_id
where a.first_name like 'PENELOPE';

select * from  actor a
join actor_info ai
on aI.first_name = a.first_name;

select * from actor order by actor_id desc;

insert into actor (actor_id, first_name, last_name, last_update) values(null, 'Gabriel Káicon', 'Batista Hilário', now());
#id: 201       last_update: 2022-05-10 19:06:53

update actor
set first_name = 'Gabriel Káicon'
where actor_id = 202;
#id: 200       last_update: 2022-05-24 19:23:30

delete from actor where actor_id = 203;

insert into actor_info (actor_id, first_name, last_name, film_info) values(null, 'Gabriel Káicon', 'Batista Hilário', 'InFerno');

select aI.actor_id as actor_idTabelaActorInfo, a.actor_id as actor_idTabelaActor, aI.first_name 
as first_nameTabelaActorInfo, a.first_name as first_nameTabelaActor,
a.last_update as lastUpdateTabelaActor, aI.film_info as film_infoTabelaActorInfo from  actor a 
join actor_info ai
on aI.actor_id = a.actor_id
where a.actor_id not like 0
order by last_update desc;


select aI.actor_id as actor_idTabelaActorInfo, aI.first_name as first_nameTabelaActorInfo, aI.film_info as film_infoTabelaActorInfo,
a.last_update as lastUpdateTabelaActor from  actor a 
join actor_info ai
on aI.actor_id = a.actor_id;

select * from category;
select * from film;
select * from film_category;

#um join/innerJoin que mostra o id do filme, nome do filme, categoria do filme
select f.film_id, f.title, fc.category_id, c.category_id, c.name 
from film f 
join film_category fc
on f.film_id = fc.film_id
inner join category c
on c.category_id = fc.category_id;
#order by f.film_id asc;



#select alinhado 
select x.*, y.* from actor_info as x, actor as y where y.actor_id = x.actor_id;


#Uso do inner Join

#select (atributos) from(de qual) tabela(tabela desejada);
select * from Tabela;

#select (atributo específico de uma tabela específica) from(de qual)(tabela desejada) (apelido dela) 
#join(união de tabela) (tabela desejada) (apelido dela) 
#on(onde for igual) (comparação de pk com fk);
select t1.*, t2.* from Tabela1 t1 
join Tabela2 t2 
on t1.id = t2.id;

#select (atributo específico de uma tabela específica) from(de qual)(tabela desejada) (apelido dela) 
#join(união de tabela) (tabela desejada) (apelido dela) 
#on(onde for igual) (comparação de pk com fk)
#join(união de tabela) (tabela desejada) (apelido dela) 
#on(onde for igual) (comparação de pk com fk);
select t1.*, t2.* from Tabela1 t1 
join Tabela2 t2 
on t1.id = t2.id
join Tabela3 t3 
on t3.id = t2.id;

select * from ((select sum(precoVenda) as somaTotal from produto) as x, (select * from Produto) as y);
#  count() = conta
#  sum() = soma
#  max() = maior valor
#  min() = menor valor
#  avg() = media

select avg(id_produto) from produto;
