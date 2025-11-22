select max(price)
from products;

select max(price), status
from products
group by status;


select max(price) max_price, status
from products
group by status
order by max_price desc, status;

select max(priority)
from support_requests;

select date(created_at) as create_date, max(priority)
from support_requests
group by create_date
order by create_date;

select date(created_at) as create_date
     , max(priority) as max_priority
     , count(*) as total_sr
from support_requests
group by create_date
order by create_date;
