select avg(price)
from products;

select avg(price), status
from products
group by status;

select avg(char_length(full_name))
from customers;

select avg(char_length(full_name)) as avg_name_length, status
from customers
group by status;


select avg(char_length(full_name)) as avg_name_length
     , email is not null as has_email
from customers
group by has_email;
