drop trigger trg_update_products_updated_at on shop.products;


create or replace function update_product_updated_at()
returns trigger as $$
begin
	IF (
		(old.name IS DISTINCT FROM new.name) OR
		(old.price IS DISTINCT FROM new.price)
	) THEN
		NEW.updated_at = now();
	END IF;
	return NEW;
end;
$$ language plpgsql;


create trigger trg_update_products_updated_at
before update
on products
for each row
execute function update_product_updated_at();
