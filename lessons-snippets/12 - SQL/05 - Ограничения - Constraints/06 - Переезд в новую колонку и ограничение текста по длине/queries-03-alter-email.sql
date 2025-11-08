alter table customers
    add column _email TEXT UNIQUE;

update customers
set _email = email
where email is not null;

alter table customers
drop
column email;

alter table customers
    rename column _email to email;

alter table customers
    add constraint customers_email_max_length
        check (char_length(email) <= 100);
