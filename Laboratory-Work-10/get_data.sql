CREATE OR REPLACE FUNCTION get_data(
    v_user_name VARCHAR,
	v_token VARCHAR
)
RETURNS TABLE
(user_id INTEGER, user_name VARCHAR)
AS $$
BEGIN
	CALL sso_control(v_user_name,v_token);
	RETURN QUERY EXECUTE 'SELECT user_id,user_name FROM users';
END;
$$ LANGUAGE plpgsql;
