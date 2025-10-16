alter table customers
	add column created_at TIMESTAMPTZ not null default now();


INSERT INTO customers (full_name, email)
  VALUES ('Bob', NULL),
         ('John', NULL);


INSERT INTO customers (full_name)
  VALUES ('Nick');
