-- Operador IN

SELECT * FROM sakila.actor
WHERE first_name = 'PENELOPE'
OR first_name = 'NICK'
OR first_name = 'ED'
OR first_name = 'JENNIFER';

-- Utilizando o operador IN
SELECT * FROM sakila.actor
WHERE first_name IN ('PENELOPE','NICK','ED','JENNIFER');


-- Operador BETWEEN
-- Note que o MySQL inclui o valor inicial e o final nos resultados
SELECT title, length FROM sakila.film
WHERE length BETWEEN 50 AND 120;

-- Para encontrar uma faixa de valores em que os valores são strings, podemos digitar a palavra por completo para encontrar os valores. Exemplo:
SELECT * FROM sakila.language
WHERE name BETWEEN 'Italian' AND 'Mandarin'
ORDER BY name;

-- Usando o BETWEEN com datas
-- Para usar o BETWEEN com datas, basta que você digite o valor no formato padrão da data, que é YYYY-MM-DD HH:MM:SS, sendo os valores de horas, minutos e segundos opcionais. No exemplo abaixo, estamos filtrando os resultados para exibir o rental_id e rental_date apenas entre o mês 05 e o mês 07:
SELECT rental_id, rental_date FROM sakila.rental
WHERE rental_date
BETWEEN '2005-05-27' AND '2005-07-17';


-- Para fixar:
-- 1 Mostre o nome, sobrenome e e-mail dos clientes com os seguintes sobrenomes: hicks, crawford, henry, boyd, mason, morales e kennedy, ordenados por nome em ordem alfabética.
SELECT * FROM sakila.customer;
SELECT first_name, last_name, email FROM sakila.customer;
SELECT first_name, last_name, email FROM sakila.customer
WHERE last_name IN('hicks', 'crawford', 'henry', 'boyd', 'mason', 'morales', 'kennedy')
ORDER BY first_name;

-- 2 Mostre o e-mail dos clientes com os address_id 172, 173, 174, 175 e 176, ordenados em ordem alfabética.
USE sakila;
SELECT email FROM customer
WHERE address_id BETWEEN 172 AND 176
ORDER BY email;

-- 3 Descubra quantos pagamentos foram feitos entre 01/05/2005 e 01/08/2005. Lembre-se de que, no banco de dados, as datas estão armazenadas no formato ano/mês/dia, diferente do formato brasileiro, que é dia/mês/ano.
USE sakila;
SELECT COUNT(*) quantidade_de_pagamentos FROM payment
WHERE DATE(payment_date) BETWEEN '2005-05-01' AND '2005-08-01';

-- 4
USE sakila;
SELECT title, release_year, rental_duration FROM film
WHERE rental_duration BETWEEN 3 AND 6
ORDER BY rental_duration DESC, title;

-- 5
USE sakila;
SELECT title, rating FROM film
WHERE rating IN('G', 'PG', 'PG-13')
ORDER BY title
LIMIT 500;

-- 1 Quantos pagamentos temos com a data de retorno 2005-05-25

/* USE sakila; */
SELECT COUNT(*) pagamentos FROM sakila.payment
WHERE DATE(payment_date) = '2005-05-25';

-- 2 Quantos pagamentos foram feitos entre 01/07/2005 e 22/08/2005
USE sakila;
SELECT COUNT(*) pagamentos FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-08-22';

-- 3 Usando a tabela rental, extraia data, ano, mês, dia, hora, minuto e segundo do registro com rental_id = 10330. Utilize a coluna rental_date para extrair as informações.
USE sakila;
SELECT DATE(rental_date) AS data,
YEAR(rental_date) AS ano ,
MONTH(rental_date) AS mes,
DAY(rental_date) AS dia,
HOUR(rental_date) AS hora,
MINUTE(rental_date) AS minuto,
SECOND(rental_date) AS segundo
FROM rental
WHERE rental_id = 10330;


-- 4 Monte uma query que retorne todos os dados do pagamento feito no dia 28/07/2005 a partir das 22 horas
USE sakila;
SELECT * FROM sakila.payment
WHERE DATE(payment_date) = '2005-07-28' AND HOUR(payment_date) >= 22;
