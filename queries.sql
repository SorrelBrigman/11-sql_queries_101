--For each of the following exercises, provide the appropriate query. Everything from class and the Sqlite documentation for SQL keywords and functions is fair game. Note that

--Query all of the entries in the Genre table
SELECT * FROM Genre
--Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist(ArtistName, YearEstablished)
VALUES ('Passenger', 2009);
--Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES('Passenger', "12/01/2009", "2000", "self-released", "29", "2");

--Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Young as the Morning, Old as the Sea", "45", "01/01/2017",  "2", "29", "25");
INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Let Her Go", "56", "12/01/2009",  "2", "29", "24");

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. Here is some more info on joins that might help.
SELECT Song.Title AS Song_Title, Artist.ArtistName, Album.Title AS Album_Name, Genre.Label AS Genre
FROM Song
JOIN Artist ON Artist.ArtistId = Song.ArtistId
JOIN Album ON Album.AlbumId = Song.AlbumId
JOIN Genre ON Genre.GenreId = Song.GenreId
WHERE Artist.ArtistName = "Passenger";
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.

-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;



-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Album.Title, COUNT(Song.AlbumId) AS number_of_songs
FROM Album
JOIN Song ON Song.AlbumId = Album.AlbumId
GROUP BY Song.AlbumId;
-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Artist.ArtistName, COUNT(Song.ArtistId) AS number_of_songs
FROM Artist
JOIN Song ON Song.ArtistId = Artist.ArtistId
GROUP BY Artist.ArtistId;
-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT Genre.Label AS Genre, COUNT(Song.GenreId) AS number_of_songs
FROM Genre
JOIN Song ON Song.GenreId = Genre.GenreId
GROUP BY Genre.GenreId;
-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Album.Title, MAX(Album.AlbumLength) AS Album_duration
FROM Album;
-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Song.Title, MAX(Song.SongLength) AS Song_duration
FROM Song;

-- Modify the previous query to also display the title of the album.
SELECT Song.Title, MAX(Song.SongLength) AS Song_duration, Album.Title AS Album
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId;
