SELECT id, name, hint
FROM demo
ORDER BY id DESC;


DELETE FROM demo
WHERE name = 'example';


DELETE FROM demo
WHERE name LIKE '%example%';
