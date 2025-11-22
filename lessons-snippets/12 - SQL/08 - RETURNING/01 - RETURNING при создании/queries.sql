insert into products (name)
values ('Gaming Display');

insert into products (name)
values ('Gaming Chair')
returning id;


insert into products (name)
values ('Gaming Table')
returning id, created_at;


insert into products (name)
values ('Gaming Mouse'),
       ('Gaming Keyboard')
returning id, created_at, status;


insert into products (name)
values ('Foo'),
       ('Fizz'),
       ('Bar'),
       ('Buzz')
returning *;


insert into products (name, status, price)
values ('Foo 1', default, 42),
       ('Fizz 1', 'in_stock', 123),
       ('Bar 1', 'out_of_stock', default),
       ('Buzz 1', 'discontinued', 555)
returning *;
