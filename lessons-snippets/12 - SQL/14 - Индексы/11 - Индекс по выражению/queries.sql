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
    , (
        ARRAY['John', 'Kyle', 'SAM', 'KaTe', idx::text]
    )[1 + floor(random() * 5)] || ' Smith ' || idx
    , idx % 3 != 0
    , now() - (random() * interval '365 days')
from generate_series(1, 100000) as idx;


select *
from users
order by id;


explain analyze
select *
from users
where lower(email) = 'user_55500@example.com';



explain analyze
select *
from users
where lower(full_name) = 'kyle smith 55500';



create index idx_full_name_lower
on users(lower(full_name));
