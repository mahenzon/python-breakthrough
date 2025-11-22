-- структура:
CREATE FUNCTION function_name()
RETURNS return_type AS $$
BEGIN
    -- function logic here
    RETURN value;
END;
$$ LANGUAGE plpgsql;


-- настоящая функция:
create function get_hello()
returns text as $$
begin
	return 'Hello from Postgres!!!';
end;
$$ language plpgsql;


-- вызов функций:
select get_hello();
select version();
select now();
