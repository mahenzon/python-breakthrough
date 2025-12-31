create table products_images (
    id uuid primary key default uuidv7(),
    path text not null unique,
    description text not null default '',
    product_id bigint not null,
	foreign key (product_id)
		references products(id)
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

delete from products
where name = 'Laptop';
