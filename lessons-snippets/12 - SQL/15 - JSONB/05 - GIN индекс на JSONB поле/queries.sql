select *
from flexi_users
where profile ->> 'role' = 'developer';

select *
from flexi_users
where profile @> '{"role": "developer"}';

explain analyze
select *
from flexi_users
where profile ->> 'role' = 'developer';

explain analyze
select *
from flexi_users
where profile @> '{"role": "developer"}';


insert into flexi_users (profile)
select json_build_object(
               'name', 'User_' || id,
               'age', (random() * 50 + 18)::int,
               'role', 'user',
               'skills', '["ui"]'::jsonb
       )
from generate_series(1, 100000) as id;

create index idx_flexi_user_profile_gin
    on flexi_users using gin (profile);
