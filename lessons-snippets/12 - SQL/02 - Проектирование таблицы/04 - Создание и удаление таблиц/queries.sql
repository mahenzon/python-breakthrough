DROP TABLE demo

SELECT * FROM fruits;

INSERT INTO fruits ("name")
VALUES ('Cherry');

DROP TABLE fruits;

CREATE TABLE fruits(
   id BIGSERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);
