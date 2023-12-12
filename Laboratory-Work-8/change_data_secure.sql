create or replace function change_data_secure (param1 varchar, param2 varchar)
returns varchar
as $$
declare 
	query1 varchar;
begin
	query1:= 'update student set stud_name = $2 where stud_name = $1';
	raise notice 'Query=%', query1;
	execute query1 using param1, param2;
	return 'Updated table';
end;
$$ language plpgsql;
