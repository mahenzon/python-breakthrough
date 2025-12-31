select * from products_images;

select * from products;

select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
join products_images pi
	on p.id = pi.product_id;
