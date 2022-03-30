USE music;
DROP VIEW IF EXISTS single_album_rock_genre;
CREATE VIEW single_album_rock_genre AS
	WITH album_has_info AS (
		SELECT *
        FROM albums
			JOIN album_genre_info
				USING(album_id)
    )
	SELECT album_name, SUM(number_of_songs * average_song_length) AS total_duration,
    genre_name, COUNT(genre_id) AS number_of_genres
	FROM album_has_info
		JOIN genres
			USING (genre_id)
	WHERE genre_name IN
		(SELECT genre_name
        FROM album_genre_info
			JOIN genres
				USING(genre_id)
		WHERE genre_name = 'Rock')
	GROUP BY album_id
    HAVING number_of_genres = 1
    ORDER BY total_duration;

SELECT *
FROM single_album_rock_genre;