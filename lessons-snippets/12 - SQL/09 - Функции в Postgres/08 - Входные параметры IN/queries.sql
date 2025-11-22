create or replace function multiply(in x integer, in y integer)
returns integer as $$
begin
	return x * y;
end;
$$ language plpgsql;

select multiply(3, 4), multiply(5, 7);
