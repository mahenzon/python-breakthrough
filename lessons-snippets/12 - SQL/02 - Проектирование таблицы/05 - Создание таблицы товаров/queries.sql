CREATE TABLE products
(
    "id"   BIGSERIAL PRIMARY KEY,
    "name" VARCHAR(300) NOT NULL DEFAULT '',
    price  INTEGER      NOT NULL DEFAULT 0
);

SELECT *
FROM products;

INSERT INTO products(name, price)
VALUES ('iPhone', 123456);
