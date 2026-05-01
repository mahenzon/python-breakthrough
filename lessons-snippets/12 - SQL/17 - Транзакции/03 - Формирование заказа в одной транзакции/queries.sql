set search_path = "shop";

alter table products
    add column qty int not null default 0 check (qty >= 0);

update products
set qty = qty + 5
where category != 'fallback';


create table if not exists shop.orders
(
    id         uuid   not null primary key default uuidv7(),
    product_id bigint not null references products (id),
    comment    text   not null             default '',
    qty        int    not null check (qty > 0)
);


begin;

insert into orders (product_id, comment, qty)
values (1, 'buy 3 iPhones', 3);

update products
set qty = qty - 3
where id = 1;

commit;
