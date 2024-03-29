DROP SCHEMA IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
-- USE SpotifyClone;

CREATE TABLE SpotifyClone.tb_plan (
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    plan_name VARCHAR(30) NOT NULL,
    plan_price DECIMAL(10,2) NOT NULL,
    date DATETIME NOT NULL
);

CREATE TABLE SpotifyClone.tb_user (
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES tb_plan (id)
);

CREATE TABLE SpotifyClone.tb_artist(
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE SpotifyClone.tb_album(
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    album_name VARCHAR(255) NOT NULL,
    relase_year INTEGER NOT NULL, 
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES tb_artist (id)
);

CREATE TABLE SpotifyClone.tb_song (
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    song_name VARCHAR(255) NOT NULL,
    song_duration INT,
    album_id INT,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES tb_artist (id),
    FOREIGN KEY (album_id) REFERENCES tb_user (id)
);

CREATE TABLE SpotifyClone.tb_playback_history(
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    reproduced_date DATETIME NOT NULL,
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES tb_user (id),
    FOREIGN KEY (id_song) REFERENCES tb_song (id)
);
  
CREATE TABLE SpotifyClone.tb_followed_artist(
    id INTEGER auto_increment PRIMARY KEY NOT NULL,
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES tb_user (id),
    FOREIGN KEY (id_artist) REFERENCES tb_artist (id)
);

INSERT INTO SpotifyClone.tb_artist(artist_name)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon'), ('Tyler Isle'), ('Fog');

INSERT INTO SpotifyClone.tb_album(album_name, id_artist, relase_year)
VALUES 
('Envious', 1, 1990),
('Exuberant', 1, 1993),
('Hallowed Steam', 2, 1995),
('Incandescent', 3, 1998),
('Temporary Culture', 4, 2001),
('Library of liberty', 4, 2003),
('Chained Down', 5, 2007),
('Cabinet of fools', 5, 2012),
('No guarantees', 5, 2015),
('Apparatus', 6, 2015);