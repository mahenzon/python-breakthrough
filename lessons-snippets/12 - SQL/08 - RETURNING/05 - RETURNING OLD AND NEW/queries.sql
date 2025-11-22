update products
set price = price * 10
where price < 5000
returning id, old.price, new.price;

update products
set price = price * 2
where price < 4000
returning old.*, new.*;
