insert into articles (title, content)
values ('Python Lesson', '... 1'),
       ('Python News', '... 2'),
       ('Postgres News', '... 3');


insert into articles_tags_association (article_id, tag_id)
values (
	(select id from articles where title = 'Python Lesson'),
	(select id from tags where name = 'python')
), (
	(select id from articles where title = 'Python Lesson'),
	(select id from tags where name = 'lesson')
), (
	(select id from articles where title = 'Python Lesson'),
	(select id from tags where name = 'tutorial')
), (
	(select id from articles where title = 'Python News'),
	(select id from tags where name = 'python')
), (
	(select id from articles where title = 'Python News'),
	(select id from tags where name = 'news')
), (
	(select id from articles where title = 'Postgres News'),
	(select id from tags where name = 'postgres')
), (
	(select id from articles where title = 'Postgres News'),
	(select id from tags where name = 'news')
);


select a.title
     , t.name
from articles a
left join articles_tags_association ata
	on a.id = ata.article_id
left join tags t
	on t.id = ata.tag_id;



select a.title
     , t.name
from articles a
join articles_tags_association ata
	on a.id = ata.article_id
join tags t
	on t.id = ata.tag_id
where t.name = 'news';


select a.title
     , t.name
from articles a
join articles_tags_association ata
	on a.id = ata.article_id
join tags t
	on t.id = ata.tag_id
where t.name = 'news' or t.name = 'python';
