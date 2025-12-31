select
      p.id
    , p.name
    , p.status
    , pi.path
    , pi.description
from products p
full outer join products_images pi
	on p.id = pi.product_id;
