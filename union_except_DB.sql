SELECT 
	'Customer'	AS type
	, Email 
FROM Customer c 

UNION ALL
--повертає всі значення незалежно, чи є дублікати
--UNION повертає унікальні значення (які не повторюються
--в результаті виконання першого і другого запитів)

SELECT 
	'Employee'	AS type
	, Email 
FROM Employee e ;

--INTERSECT/EXCEPT

SELECT 
	'Customer'	AS type
	, Email 
FROM Customer c 

--INTERSECT 
--повертає всі строки з першого запиту за умови
--що вони є і в другому запиті
EXCEPT
--повертаємо всі значення першого запиту, але не
--включає дані з другого запиту (протилежність INTERSECT)

SELECT 
	'Employee'	AS type
	, Email 
FROM Employee e ;
