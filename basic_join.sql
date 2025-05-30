SELECT * FROM Invoice i LIMIT 100;
SELECT * FROM InvoiceLine il  LIMIT 100;
SELECT * FROM Track t LIMIT 100;
SELECT * FROM Album a LIMIT 100;
SELECT * FROM Artist a LIMIT 100;

SELECT 
	t.TrackId
	, t.Name
	, a.Title
	, a.ArtistId
	, art.Name
FROM Track t
JOIN Album a ON t.AlbumId = a.AlbumId
JOIN Artist art ON a.ArtistId = art.ArtistId
WHERE art.Name LIKE "A%"
LIMIT 100;

SELECT 
	art.Name
	, COUNT(t.TrackId)
FROM Track t
JOIN Album a 	ON t.AlbumId = a.AlbumId
JOIN Artist art ON a.ArtistId = art.ArtistId
WHERE art.Name LIKE "A%"
GROUP BY 1
ORDER BY 2 DESC 
LIMIT 100;