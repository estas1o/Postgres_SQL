WITH cte AS (
	SELECT
		InvoiceId
		, CustomerId 
		, Total
		, ROW_NUMBER()		OVER(PARTITION BY CustomerId ORDER BY Total DESC)	AS Invoice_nmb --порядковий номер (з сортуванням)
		, RANK() 			OVER(PARTITION BY CustomerId ORDER BY Total DESC)	AS Invoice_rank --присвоюємо рейтинг
		, DENSE_RANK()		OVER(PARTITION BY CustomerId ORDER BY Total DESC)	AS D_inv_rank
	FROM Invoice i
	ORDER BY CustomerId
)

SELECT *
FROM cte
WHERE Invoice_nmb = 2