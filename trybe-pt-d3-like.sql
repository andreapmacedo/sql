-- Resultado da pesquisa. Encontra qualquer resultado finalizando com 'don'
SELECT * FROM sakila.film
WHERE title LIKE '%don';

-- Resultado da pesquisa. Encontra qualquer resultado iniciando com 'plu'
SELECT * FROM sakila.film
WHERE title LIKE 'plu%';

-- Resultado da pesquisa. Encontra qualquer resultado que contém 'plu'
SELECT * FROM sakila.film
WHERE title LIKE '%plu%';

-- Resultado da pesquisa. Encontra qualquer resultado que inicia com 'p' e finaliza com 'r'
SELECT * FROM sakila.film
WHERE title LIKE 'p%r';

-- Resultado da pesquisa. Encontra qualquer resultado em que o segundo caractere da frase é 'C
SELECT * FROM sakila.film
WHERE title LIKE '_C%';

-- Resultado da pesquisa. Encontra qualquer resultado em que o título possui exatamente 8 caracteres
SELECT * FROM sakila.film
WHERE title LIKE '________';

-- Resultado da pesquisa. Encontra todas as palavras com no mínimo 3 caracteres e que iniciam com E
SELECT * FROM sakila.film
WHERE title LIKE 'E__%';