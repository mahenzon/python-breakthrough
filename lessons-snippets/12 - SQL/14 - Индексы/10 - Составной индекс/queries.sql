select *
from users
where
    is_active is true
    and created_at >= '2026-01-01'
order by id;


explain analyze
select *
from users
where
    is_active is true
    and created_at >= '2026-01-01';


create index idx_active_created
on users (is_active, created_at);


select *
from users
where
full_name = 'User Name 50000'
    and created_at >= '2025-08-19';


explain analyze
select *
from users
where full_name = 'User Name 50000'
    and created_at >= '2025-08-19';

create index idx_full_name_created_at
on users (full_name, created_at);



explain analyze
select *
from users
where full_name = 'User Name 50000';


explain analyze
select *
from users
where full_name like 'User Name 5%';

explain analyze
select *
from users
where full_name like '% 50000';
