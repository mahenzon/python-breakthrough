SELECT name, hint, id
FROM demo
ORDER BY id DESC;

SELECT name, hint, id
FROM demo
-- WHERE hint is NULL
-- WHERE hint = 'some default text'
WHERE hint LIKE '%telegram channel%'
ORDER BY id DESC;

SELECT 'foo' || 'bar', 'a' || 'b' || 'c';

UPDATE demo
SET hint = 'HyperText Markup Language'
WHERE name = 'HTML';

UPDATE demo
SET hint = 'some default text'
WHERE hint is NULL;


UPDATE demo
SET hint = '_' || name || '_ hint'
WHERE hint = 'some default text';


UPDATE demo
SET hint = hint || '. Please join!'
WHERE hint LIKE '%telegram channel%';
