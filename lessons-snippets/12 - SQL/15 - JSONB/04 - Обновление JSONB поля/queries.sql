select profile
     , profile ->> 'name' name
     , profile -> 'age'   age
from flexi_users
where profile ->> 'name' = 'Alice';

select profile
     , profile ->> 'name' name
     , profile -> 'age'   age
     , profile || '{"foo": "bar"}'
from flexi_users
where profile ->> 'name' = 'Alice';

update flexi_users
set profile = profile || '{"age": 28}'
where profile ->> 'name' = 'Alice';


select '[1,  2]'::jsonb || '3'::jsonb;

select '[1, 2]'::jsonb || '[3, 4]'::jsonb;
