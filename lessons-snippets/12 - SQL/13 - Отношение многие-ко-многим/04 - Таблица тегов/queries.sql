create table tags (
    id uuid primary key default uuidv7(),
    name text not null unique
);

insert into tags (name)
values ('python'),
       ('news'),
       ('lesson'),
       ('tutorial'),
       ('postgres');

select * from tags;
