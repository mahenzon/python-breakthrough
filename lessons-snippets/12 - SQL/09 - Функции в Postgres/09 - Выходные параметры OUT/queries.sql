create or replace function calc_stats(
	a numeric,
	b numeric,
	c numeric,
	out total numeric,
	out average numeric
)
as $$
begin
	total := a + b + c;
	average := total / 3;
end;
$$ language plpgsql;


select * from calc_stats(1, 2, 3);

select * from calc_stats(10, 25, 70);

select * from calc_stats(5.4, 10, 7.2);
