
-- DROP SCHEMA IF EXISTS zoo;
CREATE SCHEMA zoo;
USE zoo;
​
CREATE TABLE localizacao(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
​
CREATE TABLE especie(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
​
CREATE TABLE animal(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
    idade TINYINT,
    localizacao_id INT,
    especie_id INT,
    FOREIGN KEY (localizacao_id) REFERENCES localizacao (id),
    FOREIGN KEY (especie_id) REFERENCES especie (id)
);
​
CREATE TABLE funcionario(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    gerente_id INT
);
​
CREATE TABLE funcionario_animal(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    animal_id INT,
    funcionario_id INT,
    FOREIGN KEY (animal_id) REFERENCES animal (id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario (id)
);
​
INSERT INTO localizacao(name)
VALUES ('jaula'), ('aquario'), ('arvore');
​
INSERT INTO especie(name)
VALUES ('elefante'), ('leão'), ('macaco'), ('golfinho'), ('foca');
​
INSERT INTO funcionario(name)
VALUES ('joao'), ('fernanda'), ('leticia'), ('pedro'), ('juliana');
​
UPDATE funcionario
SET gerente_id = 2
WHERE name IN ('joao', 'leticia', 'pedro', 'juliana');
​
INSERT INTO animal(name, sexo, idade, localizacao_id, especie_id)
VALUES
  ('mamuto', 'masculino', 20, 1, 1),
  ('mamuta', 'feminino', 18, 1, 1),
  ('jubao', 'masculino', 5, 1, 2),
  ('juba', 'feminino', 5, 1, 2),
  ('galho', 'masculino', 3, 3, 3),
  ('galha', 'feminino', 4, 3, 3),
  ('fliper', 'masculino', 6, 2, 4),
  ('flipera', 'feminino', 9, 2, 4),
  ('bate palma', 'masculino', 4, 2, 5),
  ('bata palma', 'feminino', 3, 2, 5);
​
INSERT INTO funcionario_animal(animal_id, funcionario_id)
VALUES 
  (1, 1),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 1),
  (6, 3),
  (7, 4),
  (8, 5),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 1),
  (5, 3),
  (6, 4),
  (7, 5),
  (8, 1);
​
------------- SELECT + JOIN ----------
SELECT a.*, e.name, l.name
FROM animal as a
JOIN especie as e
ON a.especie_id = e.id
JOIN localizacao as l
ON l.id = a.localizacao_id;
​
SELECT af.*, a.name, f.name
FROM funcionario_animal as af
JOIN animal as a
ON a.id = af.animal_id
JOIN funcionario as f
ON f.id = af.funcionario_id
ORDER BY a.name;