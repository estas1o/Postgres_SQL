select
	'min_salary'		as parameter --new column
	, MIN(salary_in_usd )	as value
from salaries


UNION

select
	'max_salary'		as parameter --new column
	, MAX(salary_in_usd )	as value
from salaries;
