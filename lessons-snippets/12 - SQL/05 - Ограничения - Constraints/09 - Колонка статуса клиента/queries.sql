alter table customers
    add column status TEXT
        check (status in ('active', 'frozen', 'deleted'));

update customers
set status = 'active'
where status is null;

alter table customers
    alter column status set not null;
