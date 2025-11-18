alter table products
rename column status to old_status;


create type product_status as enum (
  'in_stock',
  'out_of_stock',
  'discontinued');

alter table products
add column status product_status default 'in_stock';

alter table products
alter column status set not null;

insert into products (name, price, old_status)
values ('example1', 123, 'in_stock');


insert into products (name, price, old_status, status)
values ('example2', 123, 'out_of_stock', 'out_of_stock');
