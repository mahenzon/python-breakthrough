alter table products
add column updated_at timestamptz not null default now();

create or replace function update_updated_at()
returns trigger as $$
begin
	NEW.updated_at = now();
	return NEW;
end;
$$ language plpgsql;


create trigger trg_update_products_updated_at
before update
on products
for each row
execute function update_updated_at();

update products
set price = price * 2
where "name" like 'example%'
returning id
        , new.name
        , old.price as old_price
        , new.price as new_price
        , old.updated_at as old_updated_at
        , new.updated_at as new_updated_at;
