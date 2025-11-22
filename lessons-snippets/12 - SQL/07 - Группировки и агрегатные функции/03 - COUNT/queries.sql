select count(id)
from products;

select count(*)
from products;

select count(*)
from products
group by id;


select status, count(*)
from products
group by status
order by status;

select priority, count(*)
from support_requests
group by priority;

select priority, count(*)
from support_requests
group by priority
order by priority;


select priority, count(*) as total
from support_requests
group by priority
order by total DESC, priority DESC;

select date(created_at) as create_date
		, priority
		, count(*)
from support_requests
group by create_date, priority
order by create_date, priority;


select date(created_at) as create_date
		, count(*)
from support_requests
group by create_date
order by create_date;


select date(created_at) as create_date
		, count(date(created_at))
		, priority
from support_requests
group by create_date, priority
order by create_date, priority;
