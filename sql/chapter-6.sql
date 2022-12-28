/* INNER JOIN */
SELECT *
FROM invoices
         INNER JOIN customers ON invoices.CustomerId = customers.CustomerId;
------------------------------------------------------------------------------------------------------------------------
SELECT *
FROM invoices AS i
         INNER JOIN customers AS c
                    ON i.CustomerId = c.CustomerId;
------------------------------------------------------------------------------------------------------------------------
SELECT c.LastName    AS [customer_last_name],
       c.FirstName   AS [customer_first_name],
       i.InvoiceId   AS [invoice_id],
       i.CustomerId  AS [customer_id],
       i.InvoiceDate AS [date],
       i.Total       AS [total]
FROM invoices AS i
         INNER JOIN customers c ON i.CustomerId = c.CustomerId;
------------------------------------------------------------------------------------------------------------------------

/*
When using an inner join, only matching records are returned. Any non-matching data from any table is ignored.
*/
SELECT *
FROM invoices AS i
         LEFT OUTER JOIN customers AS c
                         ON i.CustomerId = c.CustomerId;
------------------------------------------------------------------------------------------------------------------------
SELECT i.InvoiceId,
       c.CustomerId,
       c.FirstName,
       c.Address,
       i.InvoiceDate,
       i.BillingAddress,
       i.Total
FROM invoices AS i
         LEFT OUTER JOIN customers c
                         ON i.CustomerId = c.CustomerId;
------------------------------------------------------------------------------------------------------------------------
SELECT i.InvoiceId,
       c.CustomerId,
       c.LastName,
       c.Address,
       i.InvoiceDate,
       i.BillingAddress,
       i.Total
FROM invoices AS i RIGHT JOIN customers AS c
ON i.CustomerId = c.CustomerId;
------------------------------------------------------------------------------------------------------------------------
/*
Parse the ER diagram and select another table to add to this query using a different inner join.
Define the fields you need to display and add them to the SELECT statement.
*/
SELECT e.FirstName,
       e.LastName,
       e.EmployeeId,
       c.FirstName,
       c.LastName,
       c.SupportRepId,
       i.CustomerId,
       i.Total,
       ii.TrackId
FROM invoices AS i
         INNER JOIN customers c
                    ON c.CustomerId = i.CustomerId
         INNER JOIN employees e
                    ON c.SupportRepId = e.EmployeeId
         INNER JOIN invoice_items ii
                    on i.InvoiceId = ii.InvoiceId
ORDER BY i.Total DESC
LIMIT 10;
------------------------------------------------------------------------------------------------------------------------
SELECT ar.ArtistId AS [artist_id_from_artist_table],
       al.ArtistId AS [artist_id_from_album_table],
       ar.Name     AS [artist_name],
       al.Title    AS [album_title]
FROM artists AS ar
         LEFT OUTER JOIN albums AS al
                         ON ar.ArtistId = al.ArtistId
WHERE al.ArtistId IS NULL;
------------------------------------------------------------------------------------------------------------------------
SELECT t.TrackId,
       t.Composer,
       t.Name,
       al.AlbumId,
       al.Title
FROM tracks AS t
         LEFT OUTER JOIN albums AS al
                         ON t.AlbumId = al.AlbumId
WHERE Composer IS NULL;
------------------------------------------------------------------------------------------------------------------------
SELECT a.Title,
       t.Name,
       g.Name
FROM tracks AS t
         INNER JOIN albums a
                    ON t.AlbumId = a.AlbumId
         INNER JOIN genres g
                    ON g.GenreId = t.GenreId;
------------------------------------------------------------------------------------------------------------------------
