create or replace function get_rectangle_area(
rect_length integer, rect_width integer)
returns integer as $$
declare
	rect_area integer;
begin
    rect_area = rect_length * rect_width;
	return rect_area;
end;
$$ language plpgsql;

select get_rectangle_area(10, 20);
