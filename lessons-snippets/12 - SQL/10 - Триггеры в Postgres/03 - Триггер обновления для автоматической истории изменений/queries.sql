create or replace function log_product_update()
returns trigger as $$
begin
	insert into products_audit(product_id, product_name, "event")
	values (NEW.id, NEW.name, 'update');
	return NEW;
end;
$$ language plpgsql;


create trigger trg_product_update
after update
on products
for each row
execute function log_product_update();


drop trigger trg_product_update on shop.products;
drop function log_product_update;


alter table products_audit
add column old_product_name text not null default '';


create or replace function log_product_name_update()
returns trigger as $$
begin
	IF OLD.name <> NEW.name THEN
		insert into products_audit(
			product_id, old_product_name, product_name, "event")
		values (NEW.id, OLD.name, NEW.name, 'update');
	END IF;
	return NEW;
end;
$$ language plpgsql;


create trigger trg_product_name_update
after update
on products
for each row
execute function log_product_name_update();


update products
set price = price / 10
  , name = name || ' [lower-price]'
where price > 10000;
