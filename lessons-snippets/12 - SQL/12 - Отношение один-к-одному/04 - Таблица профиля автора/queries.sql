create table author_profile (
    id bigint generated always as identity primary key,
    phone text not null default '',
    motto text not null default '',
    created_at timestamptz not null default now(),
    author_id uuid not null unique
    	references authors(id)
    		on delete cascade
);


insert into authors (username)
values ('kyle');

insert into author_profile (motto, author_id)
values (
    'be happy',
    (select id from authors where username = 'john')
    ), (
    'nice job',
    (select id from authors where username = 'kyle')
    );

select * from author_profile;

select
      a.username
    , uuid_extract_timestamp(a.id) author_created_at
    , ap.motto
    , ap.created_at profile_created_at
from authors a
left join author_profile ap
	on a.id = ap.author_id



select
      a.username
    , ap.motto
from authors a
join author_profile ap
	on a.id = ap.author_id;



delete from authors
where username = 'john';
