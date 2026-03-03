select *
from users
where id = 50000;

explain analyze
select *
from users
where id = 50000;



select *
from users
where email = 'user_50000@example.com';


explain analyze
select *
from users
where email = 'user_50000@example.com';
