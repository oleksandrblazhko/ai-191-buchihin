get_data.sql
create or replace function get_data(student_name varchar)
RETURNS TABLE(stud_name varchar, kurs integer)
AS $$
declare
	query1 varchar;
begin
	query1:= 'SELECT stud_name, kurs FROM student WHERE stud_name = ''' || student_name || '''';
	raise notice 'Query=%', query1;
	return query execute query1;
end;
$$ LANGUAGE plpgsql;
