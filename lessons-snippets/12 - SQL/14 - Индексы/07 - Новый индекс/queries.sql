create index idx_users_full_name
on users (full_name);

select *
from users
where full_name = 'User Name 50000';


explain analyze
select *
from users
where full_name = 'User Name 50000';
