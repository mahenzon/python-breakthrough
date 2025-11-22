-- Как объявляем триггер

-- Step 1: Create trigger function
CREATE FUNCTION trigger_function_name()
RETURNS trigger AS $$
BEGIN
    -- trigger logic here
    RETURN NEW;  -- or RETURN OLD for DELETE
END;
$$ LANGUAGE plpgsql;

-- Step 2: Create trigger
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
EXECUTE FUNCTION trigger_function_name();


---

create table products_audit (
	id bigint generated always as identity primary key,
	product_id bigint not null,
	product_name text not null default '',
	event text not null check (event in ('insert', 'update', 'delete')),
	created_at timestamptz not null default now()
);

create or replace function log_product_insert()
returns trigger as $$
begin
	insert into products_audit(product_id, product_name, "event")
	values (NEW.id, NEW.name, 'insert');
	return NEW;
end;
$$ language plpgsql;

create trigger trg_product_insert
after insert
on products
for each row
execute function log_product_insert();


insert into products (name, price)
values ('Desktop', 4544);

insert into products (name, price)
values ('FizzBuzz 1', 123),
	   ('FizzBuzz 2', 432)
returning *;
