create table if not exists flexi_users
(
    id      uuid primary key default uuidv7(),
    profile jsonb
);


insert into flexi_users (profile)
values ('{
  "name": "John",
  "age": 33,
  "role": "manager",
  "motto": "Be happy"
}');


insert into flexi_users (profile)
values ('{
  "name": "Kyle",
  "age": 30,
  "role": "devops",
  "motto": null,
  "skills": [
    "k8s",
    "docker"
  ],
  "duty": {
    "start": "09:00",
    "end": "18:00",
    "days": "weekdays"
  }
}');

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


select *
from flexi_users;


select id
     , uuid_extract_timestamp(id)
     , profile
from flexi_users;


select profile -> 'name'
     , profile
from flexi_users;


select profile -> 'name' as "name"
     , profile
from flexi_users;


select profile
     , profile -> 'name' as "name"
     , profile -> 'role' as "role"
from flexi_users;


select profile
     , profile -> 'name'   name
     , profile -> 'role'   role
     , profile -> 'motto'  motto
     , profile -> 'skills' skills
from flexi_users;



select profile
     , profile -> 'name'  name
     , profile -> 'role'  role
     , profile -> 'motto' motto
from flexi_users
where profile -> 'motto' is not NULL;



select profile
     , profile -> 'name'   name
     , profile -> 'role'   role
     , profile -> 'motto'  motto
     , profile ->> 'motto' motto_text
from flexi_users
where profile ->> 'motto' is not NULL;



select profile
     , profile -> 'name'  name
     , profile -> 'role'  role
     , profile -> 'motto' motto
     , profile -> 'age'   age
     , profile ->> 'age'  age_text
from flexi_users;



select profile
     , profile -> 'name'            name
     , profile -> 'role'            role
     , profile -> 'motto'           motto
     , profile -> 'age'             age
     , pg_typeof(profile -> 'age')  type_of_age
     , profile ->> 'age'            age_text
     , pg_typeof(profile ->> 'age') type_of_age_text
from flexi_users;



select profile
     , profile -> 'name'  name
     , profile -> 'role'  role
     , profile -> 'motto' motto
     , profile -> 'age'   age
from flexi_users
where (profile -> 'age')::int < 40;



select profile
     , profile -> 'name'  name
     , profile -> 'role'  role
     , profile -> 'motto' motto
     , profile -> 'age'   age
from flexi_users
where profile -> 'age' < '40'::jsonb;



select profile
     , profile -> 'name'  name
     , profile -> 'role'  role
     , profile -> 'motto' motto
     , profile -> 'age'   age
from flexi_users
where profile ->> 'name' = 'Alice';
