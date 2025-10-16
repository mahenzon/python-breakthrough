select now();

select * from pg_timezone_names;


select *
from pg_timezone_names
where name ilike '%moscow';
