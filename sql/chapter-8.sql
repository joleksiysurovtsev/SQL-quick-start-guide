SELECT ROUND(AVG(Total), 2) AS [Average Total]
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total <
      (SELECT AVG(Total)
       from invoices)
ORDER BY Total DESC;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)      AS [City Average],
       (SELECT avg(total)
        from invoices) AS [Global Average]
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)      AS [City Average],
       (SELECT round(avg(total), 2)
        from invoices) AS [Global Average]
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT MAX(Total)
FROM invoices
WHERE InvoiceDate < '2013-01-01';
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate,
       BillingCity,
       Total
FROM invoices
WHERE InvoiceDate >= '2013-01-01'
  AND total >
      (select max(Total)
       from invoices
       where InvoiceDate < '2013-01-01');
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate
FROM invoices
WHERE InvoiceId = 251;
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate,
       BillingAddress,
       BillingCity
FROM invoices
WHERE InvoiceDate >
      (select InvoiceDate
       from invoices
       where InvoiceId = 251);
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate
FROM invoices
WHERE InvoiceId IN (251, 252, 255);
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceDate,
       BillingAddress,
       BillingCity
FROM invoices
WHERE InvoiceDate IN
      (SELECT InvoiceDate
       from invoices
       where InvoiceId in (251, 252, 255));
------------------------------------------------------------------------------------------------------------------------
SELECT InvoiceId,
       TrackId
FROM invoice_items
ORDER BY TrackId;
------------------------------------------------------------------------------------------------------------------------
SELECT DISTINCT TrackId
FROM invoice_items
ORDER BY TrackId;
------------------------------------------------------------------------------------------------------------------------
SELECT TrackId,
       Composer,
       Name
FROM tracks
WHERE TrackId NOT IN
      (select distinct TrackId
       from invoice_items);
------------------------------------------------------------------------------------------------------------------------
