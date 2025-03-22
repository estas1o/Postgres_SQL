select
	'min_salary'	as parameter
	, MIN(salary_in_usd)	as value
from salaries

UNION

select 
	'max_salary'	as parameter
	, MAX(salary_in_usd)	as value
from salaries