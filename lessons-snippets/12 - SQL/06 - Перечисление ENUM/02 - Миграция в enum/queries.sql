select *
from products
order by id;


select *
from products
where status::text != old_status
order by id;


select *
from products
where status != old_status::product_status
order by id;

update products
set status = old_status::product_status
where status != old_status::product_status

alter table products
drop column old_status;

select 'in_stock'::product_status;
select 'stock'::product_status;
