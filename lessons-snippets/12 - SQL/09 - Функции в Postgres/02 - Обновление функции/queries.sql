-- удаление функции:
DROP FUNCTION public.get_hello();

-- обновление (перезапись) функции:
create or replace function get_hello()
returns text as $$
begin
	return 'Hi from Postgres!';
end;
$$ language plpgsql;


select get_hello();
