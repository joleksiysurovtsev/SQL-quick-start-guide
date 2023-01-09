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
SELECT
    PostalCode,
    length(PostalCode) AS [Posatal Code Length]
FROM customers
WHERE Country = 'USA';
------------------------------------------------------------------------------------------------------------------------
SELECT
    PostalCode,
    substr(PostalCode,1,5) AS  [Five Digit Postal Code],
    CASE
        WHEN length(substr(PostalCode,1,4)) >= '4' THEN substr(PostalCode,7,1)
        end AS [ZIP + 4 Code]
FROM customers
WHERE Country = 'USA';