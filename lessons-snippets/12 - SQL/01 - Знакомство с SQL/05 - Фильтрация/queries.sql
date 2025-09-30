SELECT sqlite_version() as version;

SELECT name, hint, id
FROM demo
WHERE name = 'SQL'
ORDER BY name;

SELECT name, hint, id
FROM demo
WHERE name = 'sql'
ORDER BY name;

SELECT name, hint, id
FROM demo
WHERE lower(name) = 'sql'
ORDER BY name;

SELECT name, hint, id
FROM demo
WHERE name like 'sql'
ORDER BY name;

SELECT name, hint, id
FROM demo
WHERE name like 'sql%'
ORDER BY name;

SELECT name, hint, id
FROM demo
WHERE name like '%sql%' or hint LIKE '%sql%'
ORDER BY lower(name);

SELECT name, hint, id
FROM demo
WHERE name like '%sql%' AND hint LIKE '%sql%'
ORDER BY lower(name);

SELECT name, hint, id
FROM demo
WHERE name like '%sql%' AND hint NOT LIKE '%sql%' AND name not LIKE 'sql'
ORDER BY lower(name);

SELECT name, hint, id
FROM demo
WHERE
(name like '%sql%' or hint LIKE '%sql%')
AND name not LIKE 'sql'
ORDER BY lower(name);

SELECT name, hint, id
FROM demo
WHERE name like '%sql%storage%' OR hint LIKE '%sql%'
ORDER BY lower(name);

SELECT name, hint, id
FROM demo
WHERE name like '%sql%' AND hint NOT LIKE '%AI%' AND name != 'SQL'
ORDER BY lower(name);
