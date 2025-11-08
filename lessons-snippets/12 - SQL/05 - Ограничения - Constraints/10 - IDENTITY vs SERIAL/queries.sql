create table example
(
    id    bigint generated always as identity primary key,
    title text not null unique
);
