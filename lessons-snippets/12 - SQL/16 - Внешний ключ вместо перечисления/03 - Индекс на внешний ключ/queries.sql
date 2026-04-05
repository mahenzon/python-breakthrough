explain analyze
select *
from products
where category != 'fallback';

explain analyze
select *
from products
where category = 'tablet';


insert into products ( price
                     , name
                     , category)
select 2 * id as price
     , 'Product_' || id::text
     , 'deleteme'
from generate_series(1, 100000) as id;


create index product_category_idx
    on products (category);

delete
from products
where category = 'deleteme';
