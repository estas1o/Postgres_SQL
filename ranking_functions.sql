SELECT
	InvoiceId 
	, Total
	, ROW_NUMBER()		OVER(ORDER BY Total DESC)	AS Invoice_nmb --порядковий номер (з сортуванням)
	, RANK() 			OVER(ORDER BY Total DESC)	AS Invoice_rank --присвоюємо рейтинг
FROM Invoice i 