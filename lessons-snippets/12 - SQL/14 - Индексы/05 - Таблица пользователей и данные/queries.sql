drop table if exists users;

create table users (
    id bigint primary key generated always as identity,
    email text not null,  -- пока что не ставим unique
    full_name text not null,  -- пока что без индекса
    is_active boolean not null,
    created_at timestamptz not null default now()
);


insert into users (email, full_name, is_active, created_at)
select
      'user_' || idx || '@example.com'
    , 'User Name ' || idx
    , idx % 3 != 0
    , now() - (random() * interval '365 days')
from generate_series(1, 100000) as idx;

select *
from users
order by id desc
limit 10;


select *
from users
where is_active is true
order by id
limit 100;
