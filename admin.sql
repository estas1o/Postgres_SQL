select *
from information_schema."columns" c 
;

create table test(
	col_1 text,
	col_2 int
);

alter table test
add column col_3 text

alter table test
rename column col_3 to col_4;