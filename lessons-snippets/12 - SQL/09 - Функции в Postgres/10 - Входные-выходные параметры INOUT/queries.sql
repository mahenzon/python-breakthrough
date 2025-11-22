create or replace function increase_by_ten(inout value integer)
as $$
begin
	value := value * 10;
end;
$$ language plpgsql;


select * from increase_by_ten(7);

select * from increase_by_ten(5);



create or replace function apply_discount(
inout price numeric,
discount_percent numeric)
as $$
begin
	price := price - (price * discount_percent / 100);
end;
$$ language plpgsql;


select * from apply_discount(100, 10);

select * from apply_discount(1234, 7);

select * from apply_discount(123.45, 17.5);
