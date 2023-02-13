/* SQL Functions */
/*
Используя функцию COUNT(),
произвести подсчет LastName и использовать псевдоним NameCount для возврата
значения.
*/
SELECT count(LastName) AS [NameCount]
FROM customers
WHERE LastName LIKE 'B%';
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName,
       LastName,
       Address
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName || LastName
FROM customers
WHERE CustomerId = 1;
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName,
       LastName,
       FirstName || ' ' || LastName AS [Full Name]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName || ' ' || LastName || ' ' || Address || ', ' || City || ', ' || State || ' ' || PostalCode
           AS [MailingAddress]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT PostalCode,
       length(PostalCode) AS [Posatal Code Length]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT PostalCode,
       substr(PostalCode, 1, 5) AS [Five Digit Postal Code],
       CASE
           WHEN length(substr(PostalCode, 1, 4)) >= '4' THEN substr(PostalCode, 7, 1)
           END                  AS [ZIP + 4 Code]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT REPLACE('SQL Tutorial', 'T', 'M');
------------------------------------------------------------------------------------------------------------------------
SELECT FirstName                                  as [First name Unmodified],
       UPPER(FirstName)                           as [First Name in UPPERCASE],
       LOWER(FirstName)                           as [First Name in lowercase],
       UPPER(FirstName) || ' ' || UPPER(LastName) AS [Full Name in UPPERCASE]
FROM customers;
------------------------------------------------------------------------------------------------------------------------
SELECT UPPER(FirstName) || ' ' || UPPER(LastName) || ' '
           || Address || ', ' || City || ', ' || State || ' '
           || SUBSTR(PostalCode, 1, 5) AS [MailingAddress]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT STRFTIME('TheYear is: %Y The Day is: %d The Month is %m', '2011-05-22') AS [Text with Conversion Specifications];
------------------------------------------------------------------------------------------------------------------------
SELECT LastName,
       FirstName,
       STRFTIME('%Y-%m-%d', BirthDate)                               AS [Birthday No Timecode],
       STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', BirthDate) AS [Age]
FROM employees
ORDER BY Age;
------------------------------------------------------------------------------------------------------------------------
SELECT LastName,
       FirstName,
       STRFTIME('%Y-%m-%d', 'now') - STRFTIME('%Y-%m-%d', HireDate) AS [Hire Age]
FROM employees
ORDER BY HireDate
------------------------------------------------------------------------------------------------------------------------
SELECT SUM(Total) AS [Total Sales]
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT SUM(Total) AS TotalSales,
       AVG(Total) AS AverageSales,
       MAX(Total) AS MaximumSale,
       MIN(Total) AS MinSale,
       COUNT(*)   AS SalesCount
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT COUNT(Total) AS Total
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT MAX(Total) AS TotalSales
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT AVG(Total)           AS [Average Sales],
       ROUND(AVG(Total), 2) AS [Rounded Average Sales]
FROM invoices;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM invoices
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total),
       round(AVG(Total), 2)
FROM invoices
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM invoices
WHERE BillingCity LIKE 'L%'
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM Invoices
WHERE AVG(Total) > 5
GROUP BY BillingCity
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCity,
       AVG(Total)
FROM invoices
WHERE BillingCity LIKE 'B%'
GROUP BY BillingCity
HAVING AVG(Total) > 5
ORDER BY BillingCity;
------------------------------------------------------------------------------------------------------------------------
SELECT BillingCountry,
       BillingCity,
       AVG(Total)
FROM invoices
GROUP BY BillingCountry, BillingCity
ORDER BY BillingCountry;
------------------------------------------------------------------------------------------------------------------------
