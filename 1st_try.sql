SELECT
1 AS nmb_1
,2 AS NMB_2
,5+5 AS nmb_3;

SELECT 
	COUNT(*) 			AS cnt_all
	, COUNT(exp_lvl)	AS cnt_lvl
	, COUNT(DISTINCT exp_lvl) AS dist_cnt
FROM salaries
LIMIT 10;

SELECT 
	AVG(salary_in_usd)	AS salary_avg
	, MIN(salary_in_usd)	AS salary_min
	, MAX(salary_in_usd)	AS salary_max
FROM salaries
WHERE 
	year = '2023'
LIMIT 10;


SELECT 
	year
	, exp_lvl
	, salary_in_usd
	, salary_in_usd * 41.95 AS salary_in_UAH
	-- 'SE' - Senior
	-- 'MI' - Middle
	-- Other
	, CASE
		WHEN exp_lvl = 'SE'
		THEN 'Senior'
		WHEN exp_lvl = 'MI'
		THEN 'Middle'
		ELSE 'Other' END AS full_lvl


	
FROM salaries
LIMIT 100;