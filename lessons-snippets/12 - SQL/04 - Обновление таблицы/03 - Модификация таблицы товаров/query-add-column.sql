alter table products
	add column created_at TIMESTAMPTZ not null default now();


INSERT INTO products(name, price)
	VALUES ('Tablet', 43134);


INSERT INTO products(name, price)
	VALUES ('Laptop', 5432);


INSERT INTO products(name, price)
	VALUES ('Monitor', 512345),
	('Keyboard', 4325);
