set search_path = "shop";

begin;

insert into orders (product_id, comment, qty)
values (26, 'buy 3 iPad Pro Max', 3);

update products
set qty = qty - 3
where id = 26;

commit;

begin;

insert into orders (product_id, comment, qty)
values (2, 'buy 3 Tablets', 3);

update products
set qty = qty - 3
where id = 2;

commit;


select id, product_id, comment, qty
from orders
order by id;
