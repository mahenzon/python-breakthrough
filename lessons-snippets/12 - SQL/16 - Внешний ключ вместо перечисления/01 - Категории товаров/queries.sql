create table if not exists categories
(
    slug text not null primary key,
    name text not null unique
);

insert into categories (slug, name)
values ('fallback', 'Fallback Category'),
       ('smartphone', 'Smartphone');
