select count(*) from products;

create or replace function get_products_count()
returns integer as $$
declare
	products_count integer;
begin
    select count(*) into products_count from products;
	return products_count;
end;
$$ language plpgsql;

select get_products_count();

delete from products
where id = 19
returning *;
