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

--lvl 4 filter
SELECT *
FROM salaries
WHERE 
	year !=2023
LIMIT 5;

SELECT *
FROM salaries
WHERE
	exp_lvl = 'MI'
	AND (exp_lvl != 'MI' --дуже важлива дужка!!! вивчити кейс!
	OR exp_lvl != 'MI')
LIMIT 5;

SELECT DISTINCT year
FROM salaries
WHERE 1=1 --пустий фільтр!
	AND year NOT BETWEEN 2021 AND 2023
	-- AND year = 2020
	
LIMIT 5;

SELECT DISTINCT year
FROM salaries
WHERE 1=1 --пустий фільтр!
	AND year IN (2020,2021)
	-- AND year = 2020
	
LIMIT 5;

SELECT DISTINCT job_title
FROM salaries
WHERE 1=1 --пустий фільтр!
	AND job_title IN ('Data Analyst', 'Data Scientist')
	-- AND year = 2020
	
LIMIT 5;

SELECT DISTINCT job_title
FROM salaries
WHERE 1=1 --пустий фільтр!
	AND job_title NOT LIKE ('Data Sc%') --чутливий до регістру! *"iLIKE" не є чутливий до регістру
	-- OR job_title LIKE ('%Data_') --"_" відповідає за наступний символ
	-- AND year = 2020
	
LIMIT 20;

SELECT *
FROM salaries
WHERE 1=1
	AND year IS NULL --або не пусті "IS NOT NULL"
LIMIT 20;

SELECT COUNT(year)
FROM salaries
WHERE 1=1
	-- AND year IS NOT NULL
LIMIT 20;

-- lvl 5 groupping #1
--
SELECT DISTINCT
	job_title
	, exp_lvl
	, ROUND (AVG (salary_in_usd * 42),2)		AS avg_sal
	, COUNT (job_title)			AS job_nmb
FROM salaries
WHERE 1=1
GROUP BY 
	job_title, exp_lvl
ORDER BY 1,2 DESC;

-- lvl 5 groupping #2
SELECT
	job_title
	-- , COUNT(*) AS job_nmb
	, ROUND(AVG(salary_in_usd * 42), 2)	AS sal_avg_UAH

FROM salaries
WHERE year = 2023
GROUP BY job_title
HAVING
	COUNT(*) = 2
	AND ROUND(AVG(salary_in_usd * 42), 2) > 4000000
ORDER BY 2 ASC
;
--lvl 6 nested queries
SELECT *
FROM salaries
WHERE salary_in_usd > --порівння з сер. ЗП
(
	SELECT AVG(salary_in_usd)
	FROM salaries
	WHERE year = 2023
)
	AND year = 2023;

-- lvl 6 nested queries (HARDMODE)
/*
Задача:
Вивести всіх спеціалістів, які живуть в країнах,
де середня ЗП вища за середню усіх країн.
*/
--1. пошук сер ЗП
--2. по кожній країні - середня ЗП
--3. порівнюємо, виводимо перелік країн
--4. спеціалісти, що проживають в цих країнах
SELECT *
FROM salaries;
--
SELECT
	comp_location
FROM salaries
WHERE year = 2023
GROUP BY
	comp_location
HAVING AVG(salary_in_usd) >
(
	SELECT AVG(salary_in_usd)
	FROM salaries
		WHERE year = 2023
)
--4
-- SELECT *
-- FROM salaries
-- WHERE emp_loc IN
-- (
-- SELECT
-- 	comp_location
-- FROM salaries
-- WHERE year = 2023
-- GROUP BY
-- 	comp_location
-- HAVING AVG(salary_in_usd) >
-- (
-- 	SELECT AVG(salary_in_usd)
-- 	FROM salaries
-- 	WHERE year = 2023
-- )
-- )--if u select specific text from line 276 to 293 it's working!
;

/*
Знайти мінімальну ЗП
серед максимальних ЗП
по країнах у 2023 році
*/
--1. макс ЗП по країнах у 2023р
--2. знайти мін ЗП
-------------------
--1.
SELECT
	comp_location
	, MAX(salary_in_usd)
FROM salaries
GROUP BY 1;

--2.
SELECT MIN(t.salary_in_usd)
FROM
(
SELECT
	comp_location
	, MAX(salary_in_usd) AS salary_in_usd
FROM salaries
GROUP BY 1
) AS t
;
--альтернатива попередьому рішенню
SELECT
	comp_location
	, MAX(salary_in_usd) AS salary_in_usd
FROM salaries
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1;

/*
По кожній професії вивести різницю між сер ЗП
та макс ЗП усіх спеціалістів
*/

--1. Макс ЗП
--2. табл професій і середніх ЗП
--3. Результат

SELECT MAX(salary_in_usd)
FROM salaries;

SELECT
	job_title
	, AVG(salary_in_usd) -
(
SELECT MAX(salary_in_usd)
FROM salaries
) AS diff
FROM salaries
GROUP BY job_title --1
;

/*
Вивести дані по співробітнику, який отримує
другу по розміру ЗП в таблиці
*/
SELECT *
FROM
(
SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 2
) AS t
ORDER BY salary_in_usd ASC
LIMIT 1
;
--same solution using offset
SELECT *
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 1 OFFSET 1;

-- 6-7

SELECT *
FROM salaries
LIMIT 10;

SELECT COUNT(*)
FROM salaries;

SELECT
	COUNT(*)
	, COUNT(*) - COUNT(salary_in_usd) AS missing_values
FROM salaries;

-- next lvl

SELECT
	job_title
	, exp_lvl
	, MIN(salary_in_usd)
	, MAX(salary_in_usd)
	, ROUND(AVG(salary_in_usd)) AS avg
	, stddev(salary_in_usd)
FROM salaries
GROUP BY 1, 2
-- ORDER BY 2 DESC
-- LIMIT 10
;

SELECT
	salary_in_usd
	, COUNT(*)
FROM salaries
GROUP BY 1
ORDER BY 2 DESC
;
SELECT
	CASE
		WHEN salary_in_usd <= 10000 THEN 'A'
		WHEN salary_in_usd <= 20000 THEN 'B'
		WHEN salary_in_usd <= 5000 THEN 'C'
		WHEN salary_in_usd <= 100000 THEN 'D'
		WHEN salary_in_usd <= 200000 THEN 'E'
		ELSE 'F' END AS salary_category
	, COUNT(*)
FROM salaries
GROUP BY 1
;

SELECT
	corr(remote_ratio )
		
