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

--lvl 3 ex #1
SELECT
	salary_in_usd	AS usd
	, year
	, job_title
FROM salaries
WHERE  
	year = '2023'
	AND job_title = 'ML Engineer'
	
ORDER BY salary_in_usd ASC
LIMIT 10
;

--lvl 3 ex #2
SELECT
	comp_location	AS country
	, salary_in_usd 	AS usd
	

FROM salaries
WHERE
	job_title = 'Data Scientist'
	AND year = 2023

ORDER BY salary_in_usd ASC
LIMIT 1
;

--lvl 3 ex #3

SELECT
	salary_in_usd	AS USD
	, job_title 	AS job


FROM salaries
WHERE
	remote_ratio = 100
ORDER BY salary_in_usd DESC
LIMIT 5

;

--lvl 3 ex #4
SELECT DISTINCT salary_cur
	

FROM salaries
;

--lvl 3 ex #5

SELECT COUNT(DISTINCT salary_cur)
FROM salaries
;

--lvl 3 ex #6
SELECT
	ROUND(MIN(salary_in_usd), 2)	AS Min_USD
	, ROUND(AVG(salary_in_usd), 2)	AS Avg_USD
	, MAX(salary_in_usd)	AS Max_USD
FROM salaries
WHERE
	year = 2023
;


--lvl 3 ex #7
SELECT
	salary_in_usd * 41.95 AS UAH
FROM salaries
WHERE
	year = 2023
	AND job_title = 'ML Engineer'
ORDER BY 1 DESC
LIMIT 5
;

--lvl 3 ex #8

SELECT
	DISTINCT ROUND((remote_ratio/100.0), 2) AS r_f
FROM salaries
;

--lvl 3 ex #9
SELECT
	DISTINCT 
		CASE 
		WHEN exp_lvl = 'EX'
		THEN 'Executive-lvl'
		WHEN exp_lvl = 'EN'
		THEN 'Entry-level'
		WHEN exp_lvl = 'MI'
		THEN 'Mid-level'
		WHEN exp_lvl = 'SE'
		THEN 'Senior-level' END AS exp_level_full
		
FROM salaries;

--lvl 3 ex #10
SELECT COUNT(*) - COUNT(salary_in_usd) AS test
FROM salaries;
-- just kidding :D
SELECT
	COUNT(remote_ratio) AS rr
FROM salaries
WHERE remote_ratio = 0;

