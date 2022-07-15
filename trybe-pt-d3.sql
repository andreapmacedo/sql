select * from sakila.actor;
select * from sakila.actor where last_name = 'DAVIS';
select * from sakila.actor where actor_id = 101;

 
select * from sakila.film;
select * from sakila.film
where length > 50
order by length;

-- filems diferentes
select * from sakila.film
where title <> 'AILEN CENTER'
and replacement_cost > 20;

-- filems permitidos para menoere de idade
select * from sakila.film
where rating = 'G'
or rating = 'PG'
or rating = 'PG-13';

select * from sakila.rental;
select * from sakila.rental
where return_date is null;

select * from sakila.staff;
select * from sakila.staff
where active is false;
-- outra forma
select * from sakila.staff
where active is not true;

select * from sakila.address;
select * from sakila.address
where address2 is not null;

-- filmes que não começam com 'academy'
select * from sakila.film
where title not like 'academy%';

-- 1 Precisamos identificar os dados do cliente com o e-mail LEONARD.SCHOFIELD@sakilacustomer.org. As informações podem ser encontradas na tabela customer
select * from sakila.customer;
select * from sakila.customer
where email = 'LEONARD.SCHOFIELD@sakilacustomer.org';

-- 2 Precisamos de um relatório dos nomes dos clientes, em ordem alfabética, que não estão mais ativos no nosso sistema e pertencem à loja com o id = 2, e não inclua o cliente KENNETH no resultado. As informações podem ser encontradas na tabela customer
select * from sakila.customer
where store_id = 2
and first_name <> 'KENNETH'
order by first_name;

-- 3 O setor financeiro quer saber título, descrição, ano de lançamento e valor do custo de substituição (replacement_cost), dos 100 filmes com o maior custo de substituição, do valor mais alto ao mais baixo, entre os filmes feitos para menores de idade e que têm o custo mínimo de substituição de $18,00 dólares. Em caso de empate, ordene em ordem alfabética pelo título. As informações podem ser encontradas na tabela film
select * from sakila.payment;
select * from sakila.film;
select title, description, release_year, replacement_cost from sakila.film;
select title, description, release_year, replacement_cost from sakila.film
where rating != 'NC-17' and
replacement_cost >= 18.00
order by replacement_cost desc, title
limit 100;

-- 4 Quantos clientes estão ativos e na loja 1? As informações podem ser encontradas na tabela customer
select * from sakila.customer;
select * from sakila.customer
where active = 1 and
store_id = 1;

-- 5 Quantos clientes estão ativos e na loja 1? As informações podem ser encontradas na tabela customer
select * from sakila.customer;
select * from sakila.customer
where active <> 1 and
store_id = 1;

-- 6 Precisamos descobrir quais são os 50 filmes feitos apenas para adultos com a menor taxa de aluguel, para que possamos fazer uma divulgação melhor desses filmes. Em caso de empate, ordene em ordem alfabética pelo título. As informações podem ser encontradas na tabela film

select * from sakila.film
where rating = 'NC-17'
order by rental_rate, title
limit 50;



