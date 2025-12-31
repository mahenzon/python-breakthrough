create table if not exists ideas (
	id uuid primary key default uuidv7(),
	idea text not null default ''
);

insert into ideas (idea)
values ('Use Postgres for everything.'),
       ('Use UUIDv7 for primary keys');

select * from ideas;


insert into ideas (idea)
values ('Use Python for web.'),
       ('Use uuid v7 in Python');

select uuid_extract_timestamp(id) created_at
     , idea
     , id
from ideas
order by id;
