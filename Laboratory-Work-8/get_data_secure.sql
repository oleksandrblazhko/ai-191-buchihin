create or replace function get_data_secure(student_name varchar)
returns table(s_id integer, stud_name varchar, kurs integer, access integer)
as $$
declare
	query1 varchar;
begin
	query1:= 'select * from student where stud_name = $1';
	raise notice 'Query = %', query1;
	return query execute query1 using student_name;
end;
$$ language plpgsql;
