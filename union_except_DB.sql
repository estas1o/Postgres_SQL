SELECT
	'Customer'	AS type
	, EMAIL
FROM Customer c 

UNION ALL

SELECT
	'Employee'	AS type
	, Email
FROM Employee e 
--


SELECT
	'Customer'	AS type
	, EMAIL
FROM Customer c 

--INTERSECT
EXCEPT

SELECT
	'Employee'	AS type
	, Email
FROM Employee e 