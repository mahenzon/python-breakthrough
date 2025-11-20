select *
from support_requests
order by priority, created_at, id;


select *
from support_requests
order by lower(priority::text), created_at, id;


select *
from support_requests
order by priority desc, created_at, id;


select *
from support_requests
where priority >= 'medium'
order by priority desc, created_at, id;


select *
from support_requests
where priority < 'medium'
order by priority desc, created_at, id;
