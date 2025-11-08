alter table products
    add column _name TEXT;

update products
set _name = name
where name is not null;

alter table products
    alter column _name set not null,
alter
column _name set default '';

alter table products
drop
column "name";


alter table products
    rename column _name to name;

alter table products
    add constraint products_name_max_length
        check (char_length(name) <= 300);


select '👍👍🏻 foќљ 🐍👨‍💻'              as val
     , length('👍👍🏻 foќљ 🐍👨‍💻')      as len
     , char_length('👍👍🏻 foќљ 🐍👨‍💻') as c_len;
