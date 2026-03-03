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
FROM generate_series(1, 100000) AS idx;


select *
from posts
where title = 'Post #12345';

explain analyze
select *
from posts
where title = 'Post #12345';


explain analyze
select *
from posts
where title = 'Post #12345' and is_published is true;


create index idx_title_published_posts
on posts(title) where is_published is true;
