update products
set status = 'in_stock'
where id = 22
returning id, status, name;

update products
set price = 12345
where price = 0
returning id, status, price, name;

update products
set status = 'discontinued'
where status = 'out_of_stock' and price < 10000
returning *;
