-- Usando a coluna replacement_cost (valor de substituição), vamos encontrar:
SELECT AVG(replacement_cost) FROM sakila.film; -- 19.984000 (Média entre todos registros)
SELECT MIN(replacement_cost) FROM sakila.film; -- 9.99 (Menor valor encontrado)
SELECT MAX(replacement_cost) FROM sakila.film; -- 29.99 (Maior valor encontrado)
SELECT SUM(replacement_cost) FROM sakila.film; -- 19984.00 (Soma de todos registros)
SELECT COUNT(replacement_cost) FROM sakila.film; -- 1000 registros encontrados (Quantidade)

SELECT * FROM sakila.film;

-- 1 Monte uma query que exiba a diferença de dias entre '2030-01-20' e hoje.
-- Monte um query que exiba:
-- A média de duração dos filmes e dê o nome da coluna de 'Média de Duração';
SELECT AVG(length) AS 'Média de Duração' FROM sakila.film;
-- A duração mínima dos filmes como 'Duração Mínima';
SELECT MIN(length) AS 'Duração Mínima' FROM sakila.film;
-- A duração máxima dos filmes como 'Duração Máxima';
SELECT MAX(length) AS 'Duração Máxima' FROM sakila.film;
-- A soma de todas as durações como 'Tempo de Exibição Total';
SELECT SUM(length) AS 'Tempo de Exibição Total' FROM sakila.film;
-- E, finalmente, a quantidade total de filmes cadastrados na tabela sakila.film como 'Filmes Registrados'.
SELECT COUNT(length) AS 'Filmes Registrados' FROM sakila.film;