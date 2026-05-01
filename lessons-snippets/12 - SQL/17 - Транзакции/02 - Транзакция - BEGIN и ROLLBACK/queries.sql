begin;

update accounts
set balance = balance - 500
where username = 'bob';

update accounts
set balance = balance + 300
where username = 'alice';

rollback;

begin;

insert into accounts (username, balance)
values ('bob', 100);

rollback;
