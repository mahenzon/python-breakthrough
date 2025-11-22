select sum(price)
from products;

select sum(price), status
from products
group by status
order by status;
