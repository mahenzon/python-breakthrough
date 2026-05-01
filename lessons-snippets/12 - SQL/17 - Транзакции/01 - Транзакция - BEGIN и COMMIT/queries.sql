create table if not exists accounts
(
    username text not null primary key,
    balance int not null,
    check (balance >= 0)
);


insert into accounts (username, balance)
values ('alice', 200),
       ('bob', 800);

begin;

update accounts
set balance = balance - 100
where username = 'bob';

update accounts
set balance = balance + 100
where username = 'alice';

commit;
