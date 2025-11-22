create or replace function get_grade_description(score integer)
returns text as $$
begin
	if score >= 90 THEN
		return 'Super Duper!';
	elsif score >= 80 THEN
		return 'Great!';
	elsif score >= 70 THEN
		return 'Good.';
	elsif score >= 60 THEN
		return 'Could be better.';
	elsif score >= 50 THEN
		return 'Satisfactory.';
	else
		return 'Try again';
    end if;
end;
$$ language plpgsql;


select get_grade_description(100)
	 , get_grade_description(90)
	 , get_grade_description(82)
	 , get_grade_description(77)
	 , get_grade_description(67)
	 , get_grade_description(55)
	 , get_grade_description(42)
	 , get_grade_description(0);
