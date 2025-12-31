drop table products_images;

create table products_images (
    id uuid primary key default uuidv7(),
    path text not null unique,
    description text not null default '',
    product_id bigint not null,
	foreign key (product_id)
		references products(id)
		on delete cascade
);


insert into products_images (path, description, product_id)
values ('/imgs/imacpro/front.jpg', 'Front Photo', 27),
       ('/imgs/imacpro/side.jpg', 'Side Photo', 27);



insert into products_images (path, description, product_id)
values (
	'/imgs/laptop/front.jpg',
    'Front Photo',
	(select id from products where name = 'Laptop')
	),
    (
	'/imgs/laptop/open.jpg',
	'Open Laptop Photo',
	(select id from products where name = 'Laptop')
	),
    (
	'/imgs/laptop/packaging.jpg',
	'Laptop packaging Photo',
	(select id from products where name = 'Laptop')
	);



insert into products_images (path, description, product_id)
values ('/imgs/example/front.jpg', 'Front Photo', 100);


insert into products_images (path, description)
values ('/imgs/example/front.jpg', 'Front Photo');

select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
left join products_images pi
	on p.id = pi.product_id;

delete from products
where name = 'Fizz 1';

delete from products
where name = 'Laptop';
