create table bulk_changes_log (
  id bigint generated always as identity primary key,
  operation text not null,
  table_name text not null,
  created_at timestamptz not null default now()
);

create or replace function log_bulk_changes()
returns trigger as $$
begin
	insert into bulk_changes_log (operation, table_name)
	values (TG_OP, TG_TABLE_NAME);
	return NULL;
end;
$$ language plpgsql;


create trigger trg_bulk_insert
after insert
on products
for each statement
execute function log_bulk_changes();

create trigger trg_bulk_update
after update
on products
for each statement
execute function log_bulk_changes();


update products
set "name" = left("name", 10)
where "name" like 'FizzBuzz%';


select 'foobarfizzbuzz'
     , left('foobarfizzbuzz', 5)
     , left('foobarfizzbuzz', 7)
     , left('foobarfizzbuzz', 100);
