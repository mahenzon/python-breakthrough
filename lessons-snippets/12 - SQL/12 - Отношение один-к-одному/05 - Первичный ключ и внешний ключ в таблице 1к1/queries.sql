drop table author_profile;

create table author_profile (
    author_id uuid not null unique primary key,
    phone text not null default '',
    motto text not null default '',
    created_at timestamptz not null default now(),
    foreign key (author_id)
    	references authors(id)
    		on delete cascade
);




insert into authors (username)
values ('john')
returning id;

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
