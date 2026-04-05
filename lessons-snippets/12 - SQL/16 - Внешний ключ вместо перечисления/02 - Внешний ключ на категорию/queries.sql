alter table products
    add column category text not null default 'fallback';

alter table products
    add constraint products_category_fkey
        foreign key (category)
            references categories (slug)
            on update cascade
            on delete restrict;

update products
-- set category = 'foo'
-- set category = 'fallback'
set category = 'smartphone'
where name ilike '%phone%';


insert into categories (slug, name)
values ('tablet', 'Tablet');


update products
set category = 'tablet'
where name ilike '%ipad%'
   or name ilike '%tablet%';

select *
from products
where category = 'smartphone';

select *
from products
where category = 'tablet';

select *
from products
where category != 'fallback';
