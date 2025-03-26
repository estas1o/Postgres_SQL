SELECT 
	InvoiceDate 
	, total
	, SUM(Total ) OVER (order by InvoiceDate )	AS acum_sum
FROM Invoice i 