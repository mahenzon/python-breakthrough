create table authors (
    id uuid primary key default uuidv7(),
    username text not null unique
);


create table articles (
    id uuid primary key default uuidv7(),
    title text not null unique,
    content text not null default '',
    author_id uuid,
    foreign key (author_id)
    	references authors(id)
    	on delete set null
);


insert into authors (username)
values ('john'), ('bob');

insert into articles (title, content, author_id)
values (
'first title',
'some content',
(select id from authors where username = 'john')
), (
'another title',
'sdfsadf sacontent',
(select id from authors where username = 'bob')
), (
'my first article',
'content content content',
(select id from authors where username = 'bob')
);

select a.username
     , ar.title
     , ar.content
from authors a
full outer join articles ar
	on a.id = ar.author_id;




insert into authors (username)
values ('alice');


delete from authors
where username = 'bob';
