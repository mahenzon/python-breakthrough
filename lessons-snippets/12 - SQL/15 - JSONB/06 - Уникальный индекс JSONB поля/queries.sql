insert into flexi_users (profile)
values ('{
  "name": "Alice",
  "role": "developer",
  "skills": [
    "sql",
    "python",
    "go"
  ],
  "settings": {
    "plugins": [
      "mypy",
      "pydantic"
    ],
    "theme": "dark",
    "alerts": true
  }
}'),
       ('{
         "name": "Bob",
         "age": 42,
         "role": "developer",
         "skills": [
           "c++",
           "java"
         ],
         "settings": {
           "plugins": null,
           "theme": "light",
           "alerts": false
         }
       }');

explain analyze
select *
from flexi_users
where profile @> '{"name": "Bob"}'
   or profile @> '{"name": "Alice"}';

explain analyze
select *
from flexi_users
where profile ->> 'name' in ('Bob', 'Alice');


delete from flexi_users
where profile @> '{"name": "Bob"}'
   or profile @> '{"name": "Alice"}';


create unique index uq_flexi_users_profile_name
    on flexi_users ((profile ->> 'name'));
