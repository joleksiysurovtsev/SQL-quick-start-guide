SELECT Total      AS [Original Amount],
       Total + 10 AS [Additional operator],
       Total - 10 AS [Subtraction Operatoe],
       Total / 10 AS [Division operator],
       Total * 10 AS [Multiplication Operator],
       Total % 10 AS [Modulo Operator]
FROM invoices
ORDER BY Total DESC;

/*
    p.73Using the example query above,
    display the Total field from the invoices table with 15% tax added
 */
SELECT (Total + (Total * '0,15')) AS [Total + 15%]
FROM invoices;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total = '1.98'
ORDER BY InvoiceDate;

/*
    p.75 Practice Using comparison operators, write the following queries:
    a query that returns all accounts greater than 1.98;
    a query that returns all scores that are greater than or equal to 1.98;
    a query that returns all scores except 1.98.
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total > 1.98
ORDER BY Total DESC;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total >= 1.98
ORDER BY Total DESC;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total BETWEEN 1.98 AND 5.00
ORDER BY InvoiceDate
LIMIT 10;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total >= 1.98
  AND Total <= 5.00
ORDER BY Total DESC
LIMIT 1;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total in (1.98, 3.96)
ORDER BY InvoiceDate;

--How many records does the above query return?
SELECT count(*)
FROM invoices
WHERE Total in (1.98, 3.96);

--Write a query that lists all invoices for 13.86, 18.86, and 21.86.
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total IN (13.86, 18.86, 21.86)
ORDER BY Total DESC;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity = 'Tucson'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity IN ('Tucson', 'Paris', 'London')
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity LIKE 'T%'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity LIKE '%T%'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity NOT LIKE '%T%'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE InvoiceDate = '2009-01-03 00:00:00'
ORDER BY Total;

/*
    p.84 Receive all invoices issued between January 1, 2009 and December 31, 2009.
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE InvoiceDate BETWEEN '2009-01-01 00:00:00' and '2009-12-31 00:00:00'
ORDER BY Total;

/*
    Find the top 10 bills received after July 5, 2009.
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE InvoiceDate > '2009-07-05 00:00:00'
ORDER BY Total DESC
LIMIT 10;

/* Функция DATE() */
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE DATE(InvoiceDate) = '2009-01-03'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE DATE(InvoiceDate) > '2010-01-02'
  AND Total < 3
ORDER BY Total;

/*
    Find all the bills that were billed in the city,
    whose name starts with the letter P and whose total sum is greater than 2.
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity LIKE 'P%'
  AND Total > 2
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE BillingCity LIKE 'p%'
   OR BillingCity LIKE 'd%'
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total > 1.98
  AND (BillingCity LIKE 'p%' OR BillingCity LIKE 'd%')
ORDER BY Total;

/*
    Find all invoices with a total amount above 3.00 issued in cities,
    whose name begins with the letter P or D.
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
FROM invoices
WHERE Total > 3.00
  AND (BillingCity LIKE '%P' OR BillingCity LIKE '%D')
ORDER BY Total;

SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total,
       BillingCountry,
       CASE
           WHEN TOTAL < 2.00 THEN 'Baseline Purchase'
           WHEN TOTAL BETWEEN 2.00 AND 6.99 THEN 'Low    Purchase'
           WHEN TOTAL BETWEEN 7.00 AND 15.00 THEN 'Target    Purchase'
           ELSE 'Top Performers' END AS PurchaseType
FROM invoices
WHERE PurchaseType = 'Top Performers'
ORDER BY BillingCity, PurchaseType;

/*
    1. Create a query against the invoices table that includes a CASE statement,
    which will mark all sales from the USA - the country,
    from where the invoice is issued - as Domestic Sales (Sales in the domestic market),
    and all other sales as Foreign Sales.
    After the END AS statement, create a new SalesType field.

    2. Sort this data by the new SalesType field.

    3. How many invoices from domestic sales exceed 15?
*/
SELECT InvoiceDate,
       BillingAddress,
       BillingCity,
       Total,
       BillingCountry,
       CASE
           WHEN BillingCountry LIKE 'USA' THEN 'Domestic Sales'
           ELSE 'Foreign Sale'
           END AS 'SalesType'
FROM invoices
WHERE Total > 15
ORDER BY SalesType;

