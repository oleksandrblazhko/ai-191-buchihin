create or replace function change_data (param1 varchar, param2 varchar)
returns varchar
as $$
declare 
	query1 varchar;
begin
	query1:= 'update student set stud_name = ''' || param2 || ''' where stud_name = ''' || param1 ||'''';
	raise notice 'Query=%', query1;
	execute query1;
	return 'Table updated';
end;
$$ language plpgsql;
