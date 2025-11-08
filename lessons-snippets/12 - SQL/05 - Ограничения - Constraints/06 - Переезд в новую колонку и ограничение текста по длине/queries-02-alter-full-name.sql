alter table customers
    add column _full_name TEXT;

update customers
set _full_name = full_name
where full_name is not null;

alter table customers
    alter column _full_name set not null,
alter
column _full_name set default '';

alter table customers
drop
column full_name;

alter table customers
    rename column _full_name to full_name;

alter table customers
    add constraint customers_full_name_max_length
        check (char_length(full_name) <= 150);
