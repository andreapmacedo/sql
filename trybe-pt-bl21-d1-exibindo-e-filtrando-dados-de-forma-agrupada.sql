-- testando
SELECT COUNT(*) FROM sakila.customer;

SELECT COUNT(*) FROM sakila.customer
	WHERE active = 1;

SELECT COUNT(*) FROM sakila.customer
	WHERE active = 0;

SELECT rating FROM sakila.film;

SELECT rating FROM sakila.film
	GROUP BY rating;

SELECT AVG(length) FROM sakila.film;

-- praticando GROUP BY

-- 1 - Monte uma query que exiba a quantidade de clientes cadastrados na tabela sakila.customer que estão ativos e a quantidade que estão inativos.
SELECT active, COUNT(*) FROM sakila.customer
	GROUP BY active;

-- 2 - Monte uma query para a tabela sakila.customer que exiba a quantidade de clientes ativos e inativos por loja. Os resultados devem conter o ID da loja, o status dos clientes (ativos ou inativos) e a quantidade de clientes por status.
SELECT store_id, active, COUNT(*) FROM sakila.customer
	GROUP BY store_id, active;

-- 3 - Monte uma query que exiba a média de duração de locação por classificação indicativa (rating) dos filmes cadastrados na tabela sakila.film. Os resultados devem ser agrupados pela classificação indicativa e ordenados da maior média para a menor.
SELECT AVG(rental_duration) AS avg_rental_duration, rating
	FROM sakila.film
	GROUP BY rating
	ORDER BY avg_rental_duration DESC;

-- 4 - Monte uma query para a tabela sakila.address que exiba o nome do distrito e a quantidade de endereços registrados nele. Os resultados devem ser ordenados da maior quantidade para a menor.
SELECT district, COUNT(*)
	FROM sakila.address
	GROUP BY district
	ORDER BY COUNT(*) DESC;


-- para fixar:


-- 1 Usando a query a seguir, modifique-a de forma que exiba apenas as durações médias que estão entre 115.0 a 121.50. Além disso, dê um alias (apelido) à coluna gerada por AVG(length), de forma que deixe a query mais legível. Finalize ordenando os resultados de forma decrescente.
SELECT rating, AVG(length) AS avg_duration
    FROM sakila.film
    GROUP BY rating
    HAVING avg_duration BETWEEN 115.0 AND 212.50
    ORDER BY avg_duration DESC;

-- 2 Usando a query a seguir, exiba apenas os valores de total do custo de substituição que estão acima de $3950.50. Dê um alias que faça sentido para SUM(replacement_cost), de forma que deixe a query mais legível. Finalize ordenando os resultados de forma crescente.
SELECT rating, SUM(replacement_cost) AS sum_replacement_cost 
    FROM sakila.film
    GROUP by rating
    HAVING sum_replacement_cost > 3950.50
    ORDER BY sum_replacement_cost;
    