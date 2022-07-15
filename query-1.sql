SELECT CONCAT(first_name," ", last_name) as "Nome Completo" FROM actor; 
SELECT CONCAT(first_name," ", last_update) as "Nome e data" FROM actor; 
SELECT DISTINCT first_name FROM actor;
SELECT COUNT(DISTINCT first_name) FROM actor;
SELECT * FROM actor LIMIT 10;
SELECT * FROM actor LIMIT 5 OFFSET 20;
SELECT * FROM actor ORDER BY first_name;
SELECT * FROM actor ORDER BY first_name DESC;
SELECT * FROM actor ORDER BY first_name DESC, last_name ASC;
SELECT * FROM actor ORDER BY RAND();

DROP DATABASE livraria;

CREATE DATABASE livraria;

CREATE TABLE livraria.livros (
	id INT PRIMARY KEY AUTO_INCREMENT,
  	titulo VARCHAR(50) NOT NULL,
  	paginas INT,
  	ano_lancamento INT,
  	vendas INT
);

INSERT INTO livraria.livros (titulo, paginas, ano_lancamento, vendas) VALUES
('Livro #01', 100, 2022, 153),
('Metamorfose', 125, 1980, 500),
('Livro #02', NULL, 1999, 357),
('Harry Potter', 857, 2002, 854),
('O Cortiço', 159, 1985, 254);

SELECT * FROM livraria.livros;