DROP TABLE demo

SELECT *
FROM fruits;

CREATE TABLE fruits
(
    id   BIGSERIAL PRIMARY KEY,
    name VARCHAR NOT NULL
);

INSERT INTO fruits ("name")
VALUES ('Cherry');

DROP TABLE fruits;
