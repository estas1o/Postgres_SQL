SELECT
	InvoiceId 
	, CustomerId
	, InvoiceDate 
	, Total
	, LAG(Total, 1) OVER(Partition by CustomerId ORDER BY InvoiceDate )	AS lag_total
	, LAG(InvoiceDate , 1) OVER(partition by CustomerId ORDER BY InvoiceDate )	AS lag_total
	, JULIANDAY(InvoiceDate ) - JULIANDAY(LAG(InvoiceDate , 1) OVER(partition by CustomerId ORDER BY InvoiceDate ))	AS diff_date
	, LEAD(Total, 1) OVER(partition by CustomerId ORDER BY InvoiceDate )	AS lead_total
FROM Invoice i 
ORDER BY CustomerId 

SELECT
	InvoiceId 
	, CustomerId 
	, InvoiceDate 
	, Total
	, FIRST_VALUE(Total) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate ASC)	AS first_amount
	, LAST_VALUE(Total) OVER(PARTITION BY CustomerId ORDER BY InvoiceDate ASC)	AS last_amount
FROM Invoice i 
