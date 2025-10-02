CREATE TABLE customers
(
    "id"      BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL DEFAULT '',
    email     VARCHAR(100) UNIQUE
);


INSERT INTO customers (full_name, email)
VALUES ('Bob Grey', NULL),
       ('John Smith', NULL),
       ('Alice Black', 'alice@example.com');

SELECT *
FROM customers;


INSERT INTO customers (full_name, email)
VALUES ('Nickolas', 'nick@ya.ru');


INSERT INTO customers (full_name, email)
VALUES ('Nikita Petrov', 'nick@ya.ru');
