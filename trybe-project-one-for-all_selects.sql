SELECT * FROM SpotifyClone.tb_user;
SELECT * FROM SpotifyClone.tb_song;
SELECT * FROM SpotifyClone.tb_playback_history;
SELECT * FROM SpotifyClone.tb_plan;
SELECT * FROM SpotifyClone.tb_followed_artist;
SELECT * FROM SpotifyClone.tb_album;
SELECT * FROM SpotifyClone.tb_artist;


-- desafio 2
SELECT 
    (SELECT COUNT(*) FROM SpotifyClone.tb_song) as cancoes,
    (SELECT COUNT(*) FROM SpotifyClone.tb_artist) as artistas,
    (SELECT COUNT(*) FROM SpotifyClone.tb_album) as albuns;
    
    
-- desafio 3 davi
SELECT  
    u.user_name AS usuario,
    h.id_user,
    s.song_duration AS total_minutos,
	s.song_name
    -- ROUND(SUM(s.song_duration / 60), 2) AS total_minutos
FROM 
    `SpotifyClone`.tb_user AS u
INNER JOIN
    `SpotifyClone`.tb_playback_history AS h
ON
    u.id = h.id_user
INNER JOIN
    `SpotifyClone`.tb_song AS s
ON s.id = h.id_song
HAVING usuario = 'Paul';    

-- desafio 3
SELECT  
    u.user_name AS usuario,
    COUNT(h.id_user) AS qtde_musicas_ouvidas,
    ROUND(SUM(s.song_duration / 60), 2) AS total_minutos
FROM 
    `SpotifyClone`.tb_user AS u
INNER JOIN
    `SpotifyClone`.tb_playback_history AS h
ON
    u.id = h.id_user
INNER JOIN
    `SpotifyClone`.tb_song AS s
ON s.id = h.id_song
GROUP BY
    u.user_name;

-- desafio 4    
SELECT
    u.user_name AS usuario,
    -- IF (MAX(YEAR(h.reproduced_date)) = 2021, 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
	-- (MAX(YEAR(h.reproduced_date)))
		-- YEAR(h.reproduced_date)
        h.reproduced_date AS condicao_usuario
         -- MAX(YEAR(h.reproduced_date)) >= '2021-01-01'
    -- YEAR(h.reproduced_date) = '2021' AS condicao_usuario
FROM
    `SpotifyClone`.tb_user AS u
INNER JOIN
    `SpotifyClone`.tb_playback_history AS h
ON
    u.id = h.id_user
GROUP BY
    u.id
ORDER BY
    u.user_name;    
    
-- desafio 5
SELECT
    s.song_name AS cancao,
    COUNT(h.id_song) AS reproducoes
FROM
    `SpotifyClone`.tb_song AS s
INNER JOIN
    `SpotifyClone`.tb_playback_history AS h
ON s.id = h.id_song
GROUP BY
    cancao
ORDER BY
    reproducoes DESC, cancao ASC
LIMIT 2;    
    
    
-- desafio 6
SELECT
    MIN(p.plan_price) AS faturamento_minimo,
    MAX(p.plan_price) AS faturamento_maximo,
    ROUND(AVG(p.plan_price),2) as faturamento_medio,
	SUM(p.plan_price) as faturamento_total
FROM
    `SpotifyClone`.tb_plan AS p
INNER JOIN
    `SpotifyClone`.tb_user AS u
ON
    p.id = u.id_plan;
    
    
-- desafio 7    
SELECT
    art.artist_name AS artista,
    alb.album_name AS album,
    COUNT(fol.id_user) AS seguidores
FROM 
    `SpotifyClone`.tb_artist AS art
INNER JOIN
    `SpotifyClone`.tb_album AS alb
ON
    art.id = alb.id_artist
INNER JOIN
    `SpotifyClone`.tb_followed_artist AS fol
ON
    art.id = fol.id_artist
GROUP BY artista, album        
ORDER BY seguidores DESC, artista, album;    

-- desafio 8
SELECT
    art.artist_name AS artista,
    alb.album_name AS album
FROM
    `SpotifyClone`.tb_album AS alb
INNER JOIN
    `SpotifyClone`.tb_artist AS art 
ON 
    alb.id_artist = art.id
GROUP BY artista, album
HAVING artista = 'Walter Phoenix'
ORDER BY album;