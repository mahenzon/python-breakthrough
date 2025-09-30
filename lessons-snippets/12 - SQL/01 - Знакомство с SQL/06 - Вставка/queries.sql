SELECT name, hint, id
FROM demo
ORDER BY id DESC;

INSERT INTO demo (name, hint)
VALUES ('Python', 'Programming Language');


INSERT INTO demo (name, hint)
VALUES ('example', '');


INSERT INTO demo (name)
VALUES ('another example');


INSERT INTO demo (name, hint)
VALUES ('third example', NULL);


INSERT INTO demo (name, hint)
VALUES ('Go', ''),
	   ('JS', NULL),
       ('HTML', 'markup language');


SELECT name, hint, id
FROM demo
WHERE hint IS NULL
ORDER BY id DESC;


SELECT name, hint, id
FROM demo
WHERE hint IS NOT NULL
ORDER BY id DESC;
