select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
left join products_images pi
	on p.id = pi.product_id;
