select InvoiceDate,
       BillingAddress,
       BillingCity,
       Total
from invoices
ORDER BY Total;

-- This`is a line comment
select *
from albums;

select FirstName,
       LastName,
       Email,
       Company
from customers;

select FirstName as 'First Name',
       LastName  as [Last Name],
       Email     as EMAIL,
       Phone        CELL,
       Fax       as FAX
from customers
order by LastName;


SELECT FirstName AS [First Name], LastName AS [Last Name], Email AS [EMAIL]
FROM customers
ORDER BY FirstName, LastName DESC
LIMIT 10;

/*
exercises from the control questions ⬇️
*/
--Write a query to find out the number of customers whose last names begin with the letter B.
select count(*)
from customers
where LastName like 'B%';
--4

--Which company, when sorted in descending order, appears in the top row of the customers table?
select Company
from customers
order by Company desc;
--Woodstock Discos

--How many customers did not provide a zip code?
select count(*)
from customers
where PostalCode is null;
--4

