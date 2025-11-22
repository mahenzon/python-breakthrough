select max(price), min(price)
from products;

select min(price)
from products;

select min(price), status
from products
group by status;


select max(price), min(price), status
from products
group by status;


select min(price) max_price, status
from products
group by status
order by max_price desc, status;

select min(priority)
from support_requests;

select min(priority), max(priority)
from support_requests;

select date(created_at) as create_date
     , min(priority)
     , max(priority)
from support_requests
group by create_date
order by create_date;


select date(created_at) as create_date
     , min(priority) as min_priority
     , max(priority) as max_priority
     , count(*) as total_sr
from support_requests
group by create_date
order by create_date;
