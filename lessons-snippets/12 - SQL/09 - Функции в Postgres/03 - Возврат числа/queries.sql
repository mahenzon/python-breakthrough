create or replace function get_answer()
returns integer as $$
begin
	return 21 * 2;
end;
$$ language plpgsql;


select get_answer();
