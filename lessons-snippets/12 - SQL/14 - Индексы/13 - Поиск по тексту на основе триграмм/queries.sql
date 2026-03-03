drop table if exists posts;

create table posts
(
    id bigint primary key generated always as identity
    ,
    title text not null
    ,
    content text not null default ''
    ,
    is_published boolean not null default false
    ,
    created_at timestamptz not null default now()
);

insert into posts (title, content, is_published, created_at)
select 'Post #' || idx
     , array_to_string(
        ARRAY(
            select (ARRAY [
                'lorem','ipsum','dolor','sit','amet','consectetur','adipiscing','elit',
                'sed','do','eiusmod','tempor','incididunt','ut','labore','et','dolore',
                'magna','aliqua','ut','enim','ad','minim','veniam','quis','nostrud',
                'exercitation','ullamco','laboris','nisi','ut','aliquip','ex','ea',
                'commodo','consequat','duis','aute','irure','dolor','in','reprehenderit',
                'in','voluptate','velit','esse','cillum','dolore','eu','fugiat','nulla','pariatur',
                idx::text
                ])[1 + floor(random() * 20)::int]
            from generate_series(
                1, 20 + floor(random() * 80)::int
            ) -- 20..99 words
        ),
        ' '
       )
     , idx % 3 = 0
     , now() - (random() * interval '365 days')
FROM generate_series(1, 500000) AS idx;


---


create extension if not exists pg_trgm;

select *
from posts
where content like '%et et et et sed sed%';

explain analyze
select *
from posts
where content like '%ipsum lorem lorem lorem%';

create index idx_posts_content_trgm
on posts using gin (content gin_trgm_ops);

drop index idx_posts_content_trgm;
