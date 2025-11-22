create or replace function square(n integer)
returns integer as $$
begin
	return n * n;
end;
$$ language plpgsql;


select square(5);

select square(5), square(10), square(0), square(-3);



create or replace function add_nums(x integer, y integer)
returns integer as $$
begin
	return x + y;
end;
$$ language plpgsql;


select add_nums(5, 10);


select add_nums(-5, 12), add_nums(-5, -7), add_nums(25, 125);



create or replace function create_full_name(
first_name text, last_name text)
returns text as $$
begin
	return first_name || ' ' || last_name;
end;
$$ language plpgsql;


select create_full_name('John', 'Smith');


select create_full_name('Bob', 'White')
     , create_full_name('Alice', 'Black');



select create_full_name('White', 'Bob')
     , create_full_name(last_name => 'White', first_name => 'Bob');
