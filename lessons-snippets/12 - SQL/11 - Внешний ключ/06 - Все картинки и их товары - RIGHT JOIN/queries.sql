select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
right join products_images pi
	on p.id = pi.product_id;


alter table products_images
alter column product_id
drop not null;



insert into products_images (path, description)
values ('/imgs/example/front.jpg', 'Front Photo');

select *
from products_images;

select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
right join products_images pi
	on p.id = pi.product_id;

select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products_images pi
left join products p
	on p.id = pi.product_id;
