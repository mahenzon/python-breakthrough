SELECT * FROM demo;

SELECT id, name, hint FROM demo;

SELECT name, hint, id FROM demo;

SELECT name, hint FROM demo;

SELECT name, hint, id
FROM demo
ORDER BY id;

SELECT name, hint, id
FROM demo
ORDER BY id ASC;

SELECT name, hint, id
FROM demo
ORDER BY id DESC;

SELECT name, hint, id
FROM demo
ORDER BY name;

SELECT name, hint, id
FROM demo
ORDER BY lower(name);
