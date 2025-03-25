select
	job_title 
	, ROUND(AVG(salary_in_usd), 0)	as avg_salary
from salaries s
group by 1


with cte	AS(

select
	job_title 
	, salary_in_usd 
	, AVG(salary_in_usd ) OVER(partition by job_title)	as avg_salary
	, MIN(salary_in_usd) OVER(partition by job_title)	as min_salary
	, MAX(salary_in_usd) OVER(partition by job_title)	as max_salary
from salaries s
)

select *
from cte