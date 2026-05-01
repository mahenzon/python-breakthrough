select id, email, full_name
from users
limit 10;

alter table users
    add column ref_code text;

alter table users
    drop column ref_code;


begin;

rollback;


begin;

alter table users
    add column ref_code text;

select id, email, full_name, ref_code
from users
limit 10;

update users
set ref_code = 'REF-' || id
where ref_code is null;


select id, email, full_name, ref_code
from users
limit 10;

alter table users
    alter column ref_code set not null;

commit;


begin;

alter table users
    add column ref_code text;

update users
set ref_code = 'REF-' || id
where ref_code is null;

alter table users
    alter column ref_code set not null;

commit;
