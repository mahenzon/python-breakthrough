alter table products
    add column status TEXT
        check (
            status in ('in_stock', 'out_of_stock', 'discontinued')
            );

update products
set status = 'in_stock'
where status is null;

alter table products
    alter column status set not null;
