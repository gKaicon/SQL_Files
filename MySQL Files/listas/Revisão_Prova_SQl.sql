use sakila;
show tables;

select f.title, c.name as Categoria from film f, category c, film_category cf
where f.film_id = cf.film_id and cf.category_id = c.category_id;

select count(*) from film where length >= 120;

#Listar todos os filmes de duração em 120 ou mais em ordem decrescente.
select * from film 
where length >= 120
order by film_id desc;

select * from film 
where length >= 120;

select * from film 
where length >= 120
order by film_id asc, title desc;





