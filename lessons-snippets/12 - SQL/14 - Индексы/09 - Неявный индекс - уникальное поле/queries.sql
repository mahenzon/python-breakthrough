drop table if exists users;

create table users (
    id bigint primary key generated always as identity,
    email text not null unique,
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


explain analyze
select *
from users
where email = 'user_50000@example.com';
