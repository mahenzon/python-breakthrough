select status
from products
order by id;

select status
from products;

select status
from products
group by status
order by status;

select *
from support_requests
order by id;


select *, date(created_at)
from support_requests
order by id;

select priority
from support_requests
order by id;

select priority
from support_requests
group by priority;

select priority
from support_requests
group by priority
order by priority;


select priority, created_at
from support_requests;


select id, message, date(created_at) as create_date
from support_requests;

select date(created_at) as create_date
from support_requests
group by create_date
order by create_date;

select date(created_at) as create_date, priority
from support_requests
group by create_date, priority
order by create_date, priority;
