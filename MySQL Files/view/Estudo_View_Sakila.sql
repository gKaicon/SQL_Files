use sakila;
show tables;

#sintaxe View

#view serve para armazenar uma consulta
#seja ela apenas um select
Create view _nomeEnderco_ as select nome, endereco from tbl1 t1;
Create view _nomeTelefone_ as select nome, telefone from tbl1 t1;

#seja ela apenas um select com join
Create view _nomeEnderco_ as 
select nome, endereco from tbl1 t1 
join tbl2 t2
on tbl1.id = tbl2.id;
select * from _nomeEndereco_;

#viewm feita de exemplo na view
use sakila;
create view vw_CidadePais as 
select c.city as NomeTabelaCidade, c.country_id, cy.country as nomeTabelaPais 
from City c
inner join country cy
on c.country_id = cy.country_id;
select vw.NomeTabelaCidade, vw.nomeTabelaPais from vw_CidadePais vw;


#___________________________________________________________________________________________________________________________________________________________________________________________________
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

#__________________________________________________________________________________________________________________________________________________________________________________________________
select * from Country;
select * from City;


insert into city(city_id, city, country_id) values(null, 'Brasília', '15');

select c.city as NomeTabelaCidade, c.country_id as IDTabelaPaisNaTabelaCity, cy.country_id as IDTabelaCountry, cy.country as nomeTabelaPais 
from City c
inner join country cy
on c.country_id = cy.country_id 
where c.city like 'Brasília';

select c.city as NomeTabelaCidade, c.country_id as IDTabelaPaisNaTabelaCity, cy.country_id as IDTabelaCountry, cy.country as nomeTabelaPais 
from City c 
inner join country cy
on c.country_id = cy.country_id 
where c.country_id = 44;

select x.*, y.* from (select * from City) as x, (select * from country) as y 
where x.country_id = 44 and y.country_id = 44;

select x.city as NomeTabelaCidade, x.country_id as IDTabelaPaisNaTabelaCity, y.country_id as IDTabelaCountry, y.country as nomeTabelaPais 
from (select * from City) as x, (select * from country) as y 
where x.country_id = 44 and y.country_id = 44;

create view vw_CidadePais as 
select c.city as NomeTabelaCidade, c.country_id, cy.country as nomeTabelaPais 
from City c
inner join country cy
on c.country_id = cy.country_id;
select vw.NomeTabelaCidade, vw.nomeTabelaPais from vw_CidadePais vw;