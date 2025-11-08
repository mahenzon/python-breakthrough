select now();

select TIMESTAMPTZ '2010-05-21 10:30:42.123';
select TIMESTAMPTZ '2025-10-15';

insert into products (name, price)
values ('mouse', 123);

select *
from products
where (
	created_at >= TIMESTAMPTZ '2000-01-01'
	and
	created_at < TIMESTAMPTZ '2100-01-01'
);

alter table products
add constraint products_created_at_range
check (
	created_at >= TIMESTAMPTZ '2000-01-01'
	and
	created_at < TIMESTAMPTZ '2100-01-01'
);
