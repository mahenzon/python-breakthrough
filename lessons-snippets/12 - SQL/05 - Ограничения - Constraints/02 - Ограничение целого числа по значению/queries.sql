alter table products
add constraint products_price_nonnegative
check (price >= 0);
