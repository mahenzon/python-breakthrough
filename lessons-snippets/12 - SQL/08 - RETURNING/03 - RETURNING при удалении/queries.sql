delete from products
where status = 'discontinued'
returning *;
